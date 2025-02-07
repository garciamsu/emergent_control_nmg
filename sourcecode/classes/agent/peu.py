from sourcecode.classes.controller.rtm import ResponseThresholdController
import json
import pandas as pd
import os
import time
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from dateutil import parser
from influxdb import InfluxDBClient
import matplotlib.dates as mdates

plt.style.use('default')
# update the overall font size
# https://datascienceparichay.com/article/change-font-size-of-elements-matplotlib-plot/
plt.rcParams.update({'font.size': 13.5})


class powerExchangeUnitAgent():

    def __init__(self, microgrid, connection, type="mg6"):

        # https://pypi.org/project/influxdb/
        self.DBClient = InfluxDBClient(
            connection["address"], connection["port"], connection["user"], connection["password"], connection["database"])
        self.modelType = type
        self.microgrid = microgrid
        self.interactivityFactor = []
        self.neighbors = []
        self.name = microgrid["name"]
        self.id = microgrid["id"]
        self.data = pd.DataFrame(
            columns=['time', 'PT', 'PL', 'dP', 'ise', 'iae', 'loss', 'resiliency'])
        self.producer = ResponseThresholdController()

        for node in microgrid["neighbors"]:
            neighbor = {}
            neighbor["name"] = node["name"]
            neighbor["id"] = node["id"]
            neighbor["master"] = 0
            neighbor["sw_producer"] = 0
            neighbor["sw_consumer"] = 0
            neighbor["producer"] = ResponseThresholdController()
            neighbor["exchange"] = ResponseThresholdController()
            neighbor["consumer"] = ResponseThresholdController()
            neighbor["data"] = pd.DataFrame(
                columns=['time', 'PT', 'PL', 'dP', 'master', 'not_master', 'producer', 'consumer'])
            self.neighbors.append(neighbor)

    # https://community.influxdata.com/t/python-influxdbclient-how-to-read-a-single-measurement-and-nothing-else-solved/4543/10
    def read_energy_data(self, field, measurement, time):

        stringQuery = "SELECT {} FROM {} where time = '{}';".format(
            field, measurement, time)
        result = self.DBClient.query(stringQuery)
        points = result.get_points()

        for item in points:
            item["seconds"] = parser.isoparse(item["time"]).timestamp()
            item["value"] = item[field]
            return item

    def update(self, i, time):

        self.readDataInfluxDB(i, time)

        # if (self.modelType == 'mg1'):
            # Here is the code of the model to be tested

        if (self.modelType == 'mg6'):

            # self.producer.setStimulus(self.PT - self.PL)
            # self.producer.setWorkers(self.PT / self.PL)
            # self.producer.probability()

            for index, neighbor in enumerate(self.neighbors):

                soc = 0
                if self.PL > self.PT:
                    soc = 0
                else:
                    soc = (self.PT - self.PL) / 1200

                self.neighbors[index]["producer"].setStimulus(
                    soc*(neighbor["PL"] - neighbor["PT"]))
                self.neighbors[index]["producer"].setWorkers(soc)
                self.neighbors[index]["producer"].probability()

                self.neighbors[index]["consumer"].setStimulus(
                    (1 - soc)*(neighbor["PT"] - neighbor["PL"]))
                self.neighbors[index]["consumer"].setWorkers(1 - soc)
                self.neighbors[index]["consumer"].probability()

                # self.neighbors[index]["master"] = self.neighbors[index]["consumer"].sw
                self.neighbors[index]["sw_producer"] = self.neighbors[index]["producer"].sw
                self.neighbors[index]["sw_consumer"] = self.neighbors[index]["consumer"].sw

                # https://stackoverflow.com/questions/31569384/set-value-for-particular-cell-in-pandas-dataframe-with-iloc
                #self.neighbors[index]["data"].iloc[i, self.neighbors[index]["data"].columns.get_loc(
                #    'producer')] = self.neighbors[index]["sw_producer"]

                #self.neighbors[index]["data"].iloc[i, self.neighbors[index]["data"].columns.get_loc(
                #    'consumer')] = 1 - self.neighbors[index]["sw_consumer"]

                self.neighbors[index]["data"].iloc[i, self.neighbors[index]["data"].columns.get_loc(
                    'producer')] = self.neighbors[index]["producer"].sw

                self.neighbors[index]["data"].iloc[i, self.neighbors[index]["data"].columns.get_loc(
                    'consumer')] = self.neighbors[index]["consumer"].sw
        

    def performanceIndex(self, i, time):
        if i == 0:
            # ise
            self.data.iloc[i, self.data.columns.get_loc(
                'ise')] = 0
            # iae
            self.data.iloc[i, self.data.columns.get_loc(
                'iae')] = 0
            # loss
            self.data.iloc[i, self.data.columns.get_loc(
                'loss')] = 0

        else:
            # ise
            self.data.iloc[i, self.data.columns.get_loc(
                'ise')] = self.data.iloc[i-1, self.data.columns.get_loc(
                    'ise')] + pow(self.data.iloc[i]["balance"], 2)
            # iae
            self.data.iloc[i, self.data.columns.get_loc(
                'iae')] = self.data.iloc[i-1, self.data.columns.get_loc(
                    'iae')] + abs(self.data.iloc[i]["balance"])
            # loss
            self.data.iloc[i, self.data.columns.get_loc(
                'loss')] = self.data.iloc[i-1, self.data.columns.get_loc(
                    'loss')] + abs(self.data.iloc[i]["balance"]/self.data.iloc[i]["PL"])
            # resiliency
            # self.data.iloc[i, self.data.columns.get_loc(
            # 'q')] = 1/self.data.iloc[i]["loss"]

    def readDataInfluxDB(self, i, time):

        self.PT = self.read_energy_data(
            self.microgrid["PT"]["field"], self.microgrid["PT"]["measurement"], time)["value"]

        self.PL = self.read_energy_data(
            self.microgrid["PL"]["field"], self.microgrid["PL"]["measurement"], time)["value"]
        self.dP = (self.PT - self.PL)

        new_row = pd.DataFrame(
            {'time': time, 'PT': self.PT, 'PL': self.PL, 'dP': self.dP}, index=[0])
        self.data = pd.concat([self.data.loc[:], new_row]
                              ).reset_index(drop=True)

        for index, neighbor in enumerate(self.microgrid["neighbors"]):
            self.neighbors[index]["PT"] = self.read_energy_data(
                neighbor["PT"]["field"], neighbor["PT"]["measurement"], time)["value"]
            self.neighbors[index]["PL"] = self.read_energy_data(
                neighbor["PL"]["field"], neighbor["PL"]["measurement"], time)["value"]
            self.neighbors[index]["dP"] = self.neighbors[index]["PT"] - \
                self.neighbors[index]["PL"]

            new_row = pd.DataFrame(
                {'time': time, 'PT': self.neighbors[index]["PT"], 'PL': self.neighbors[index]["PL"], 'dP': self.neighbors[index]["dP"]}, index=[0])
            self.neighbors[index]["data"] = pd.concat(
                [self.neighbors[index]["data"].loc[:], new_row]).reset_index(drop=True)

    def calculateInteractivity(self):
        for index, neighbor in enumerate(self.neighbors):

            if ((self.dP != 0) and (self.neighbors[index]["dP"] != 0)):
                self.interactivityFactor.append(
                    0.5*(1-((self.dP*self.neighbors[index]["dP"])/(abs(self.dP)*abs(self.neighbors[index]["dP"])))))
            else:
                self.interactivityFactor.append(0)

    def graphics_rtm(self):

        fig, axs = plt.subplots(np.size(self.neighbors), 3)

        fig.suptitle('Local ' + self.name, fontsize=16)

        for index, neighbor in enumerate(self.neighbors):
            print(self.neighbors[index]["producer"].results())
            axs[index, 0].axes.get_xaxis().set_visible(False)
            if (index == np.size(self.neighbors)-1):
                axs[index, 0].set_xlabel('Time')
                axs[index, 0].axes.get_xaxis().set_visible(True)
            axs[index, 0].set_ylabel('Stimulus')
            axs[index, 0].set_title(
                'Neighbor ' + self.neighbors[index]['name'])
            axs[index, 0].plot(self.neighbors[index]["producer"].df["s_j"])

        for index, neighbor in enumerate(self.neighbors):
            print(self.neighbors[index]["producer"].results())
            axs[index, 1].axes.get_xaxis().set_visible(False)
            if (index == np.size(self.neighbors)-1):
                axs[index, 1].set_xlabel('Time')
                axs[index, 1].axes.get_xaxis().set_visible(True)
            axs[index, 1].set_ylabel('Threshold')
            axs[index, 1].set_title(
                'Neighbor ' + self.neighbors[index]['name'])
            axs[index, 1].plot(self.neighbors[index]["producer"].df["zeta_ij"])

        for index, neighbor in enumerate(self.neighbors):
            print(self.neighbors[index]["producer"].results())
            axs[index, 2].axes.get_xaxis().set_visible(False)
            if (index == np.size(self.neighbors)-1):
                axs[index, 2].set_xlabel('Time')
                axs[index, 2].axes.get_xaxis().set_visible(True)
            axs[index, 2].set_ylabel('q [%]')
            axs[index, 2].set_title(
                'Neighbor ' + self.neighbors[index]['name'])
            axs[index, 2].plot(self.neighbors[index]["producer"].df["q"])

        plt.subplots_adjust(hspace=0.5)
        plt.show()

    def graphics_trigger_producer(self):

        fig, axs = plt.subplots(np.size(self.neighbors) + 1)

        #fig.suptitle('Local ' + self.name, fontsize=16)

        self.producer.results()
        axs[0].axes.get_xaxis().set_visible(False)
        axs[0].set_ylabel('SW')
        axs[0].set_title('Local ' + self.name)
        axs[0].plot(self.producer.df["DetectIncreasePos"])

        for index, neighbor in enumerate(self.neighbors):
            self.neighbors[index]["producer"].results()
            axs[index+1].axes.get_xaxis().set_visible(False)
            axs[index+1].set_ylabel('SW')
            axs[index+1].set_title('Neighbor ' + self.neighbors[index]['name'])
            axs[index+1].plot(self.neighbors[index]
                              ["producer"].df["DetectIncreasePos"])

        #plt.ylim([0, 1])
        plt.subplots_adjust(hspace=0.5)
        plt.subplots_adjust(wspace=0.25)
        plt.show()

    def graphics_trigger_exchange(self):

        fig, axs = plt.subplots(np.size(self.neighbors) + 1)

        #fig.suptitle('Local ' + self.name, fontsize=16)

        self.producer.results()
        axs[0].axes.get_xaxis().set_visible(False)
        axs[0].set_ylabel('SW')
        axs[0].set_title('Local ' + self.name)
        axs[0].plot(self.producer.df["DetectIncreasePos"])

        for index, neighbor in enumerate(self.neighbors):
            self.neighbors[index]["exchange"].results()
            axs[index+1].axes.get_xaxis().set_visible(False)
            axs[index+1].set_ylabel('SW')
            axs[index+1].set_title('Neighbor ' + self.neighbors[index]['name'])
            axs[index+1].plot(self.neighbors[index]
                              ["exchange"].df["DetectIncreasePos"])

        #plt.ylim([0, 1])
        plt.subplots_adjust(hspace=0.5)
        plt.subplots_adjust(wspace=0.25)
        plt.show()

    def graphics_trigger(self):

        fig, axs = plt.subplots(np.size(self.neighbors) + 1)

        #fig.suptitle('Local ' + self.name, fontsize=16)

        self.producer.results()
        axs[0].axes.get_xaxis().set_visible(False)
        axs[0].set_ylabel('SW')
        axs[0].set_title('Local ' + self.name)
        axs[0].plot(self.producer.df["DetectIncreasePos"])

        self.results()
        for index, neighbor in enumerate(self.neighbors):
            axs[index+1].axes.get_xaxis().set_visible(False)
            axs[index+1].set_ylabel('SW')
            axs[index+1].set_title('Neighbor ' + self.neighbors[index]['name'])
            axs[index+1].plot(self.neighbors[index]["df"])

        #plt.ylim([0, 1])
        plt.subplots_adjust(hspace=0.5)
        plt.subplots_adjust(wspace=0.25)
        plt.show()

    def graphics_rtm_neighbor(self, name_mg_neighbor):

        fig, axs = plt.subplots(3)
        fig.suptitle('Local: ' + self.name + " <-> Neighbor: " +
                     name_mg_neighbor, fontsize=16)

        for index, neighbor in enumerate(self.neighbors):
            if (neighbor["name"] == name_mg_neighbor):
                self.neighbors[index]["producer"].results()
                axs[0].set_ylabel('Stimulus')
                axs[0].plot(self.neighbors[index]["producer"].df["s_j"])
                axs[1].set_ylabel('Threshold')
                axs[1].plot(self.neighbors[index]["producer"].df["zeta_ij"])
                axs[2].set_ylabel('q [%]')
                axs[2].plot(self.neighbors[index]["producer"].df["q"])

        plt.show()

    def results(self):

        for index, neighbor in enumerate(self.neighbors):
            self.neighbors[index]['df'] = self.neighbors[index]["listMaster"]
            self.neighbors[index]['powerDifference'] = self.neighbors[index]["listdP"]
            self.neighbors[index]['powerDifference'] = pd.DataFrame(
                self.neighbors[index]["listdP"], columns=['dP'])
            self.neighbors[index]['smartSwith'] = self.neighbors[index]["listMaster"]

            # print(self.neighbors[index]['df'][-1])
            self.localBefore["PL"] = self.localBefore["PL"] + \
                self.neighbors[index]['df'][-1] * \
                abs(self.neighbors[index]["dP"])
            self.networksBefore[index]["PT"] = self.networksBefore[index]["PT"] + \
                self.neighbors[index]['df'][-1] * \
                abs(self.neighbors[index]["dP"])*0.998

            demand = self.neighbors[index]['df'][-1] * \
                abs(self.neighbors[index]["dP"])
            power = self.neighbors[index]['df'][-1] * \
                abs(self.neighbors[index]["dP"])*0.998

        #self.powerDifference = self.listdP
        self.powerDifference = pd.DataFrame(self.listdP, columns=['dP'])

        element = {'demand': demand,
                   'power': power
                   }

        return element

    def graphics_power_differentials(self, file, name):

        rows = np.size(self.neighbors)
        fig, axs = plt.subplots(np.size(2*self.neighbors) + 2)

        # cutoff value
        cutoff = 0
        size = 13
        pad = 50

        axs[0].axes.get_xaxis().set_visible(False)
        axs[0].set_ylabel('ΔP[kW]', rotation="horizontal", labelpad=pad)
        axs[0].set_title(self.name, {'fontsize': size})
        axs[0].grid(axis='both')

        # Define the date format
        myFmt = mdates.DateFormatter('%H')
        axs[0].xaxis.set_major_formatter(myFmt)

        axs[0].plot(self.data["time"], self.data["dP"])

        # https://matplotlib.org/stable/gallery/lines_bars_and_markers/span_regions.html#sphx-glr-gallery-lines-bars-and-markers-span-regions-py
        # https://stackoverflow.com/questions/31345489/change-color-of-line-if-data-is-less-than-zero
        axs[0].fill_between(self.data["time"], self.data["dP"],
                            where=self.data["dP"] > cutoff, facecolor='green', alpha=.3)
        axs[0].fill_between(self.data["time"], self.data["dP"],
                            where=self.data["dP"] < cutoff, facecolor='red', alpha=.3)
        axs[0].axhline(0, color='black')

        for index, neighbor in enumerate(self.neighbors):
            axs[index+1].axes.get_xaxis().set_visible(False)
            # axs[index+1].set_ylabel('ΔP[kW]')
            axs[index+1].set_ylabel(self.neighbors[index]['name'] +
                                    " [kW]", rotation="horizontal", labelpad=pad)
            # axs[index+1].set_title(self.neighbors[index]
            #                       ['name'], {'fontsize': size})
            # Define the date format
            myFmt = mdates.DateFormatter('%H')
            axs[index+1].xaxis.set_major_formatter(myFmt)
            axs[index+1].plot(self.data["time"],
                              self.neighbors[index]["data"]['dP'])
            axs[index+1].fill_between(self.data["time"], self.neighbors[index]["data"]['dP'],
                                      where=self.neighbors[index]["data"]['dP'] > cutoff, facecolor='green', alpha=.3)
            axs[index+1].fill_between(self.data["time"], self.neighbors[index]["data"]['dP'],
                                      where=self.neighbors[index]["data"]['dP'] < cutoff, facecolor='red', alpha=.3)
            axs[index+1].grid(axis='both')
            axs[index+1].axhline(0, color='black')

        for index, neighbor in enumerate(self.neighbors):
            axs[rows + index + 1].axes.get_xaxis().set_visible(False)
            #axs[rows + index + 1].set_ylabel('Smart Switch')
            axs[rows + index + 1].set_ylabel('SW_' + self.neighbors[index]['name'].split("_")[
                                             1], rotation="horizontal", labelpad=pad*1.45)
            # axs[rows + index + 1].set_title(self.name +
            #                       " as Producer", {'fontsize': size})
            # Define the date format
            myFmt = mdates.DateFormatter('%H')
            axs[rows + index + 1].xaxis.set_major_formatter(myFmt)
            axs[rows + index + 1].plot(self.data["time"],
                                       self.neighbors[index]["data"]['producer'])
            axs[rows + index + 1].plot(self.data["time"],
                                       self.neighbors[index]["data"]['consumer'])

        # axs[0].axes.get_xaxis().set_visible(False)
        axs[2*rows + 1].set_ylabel('Balance [kW]',
                                   rotation="horizontal", labelpad=pad)
        axs[2*rows + 1].set_xlabel('Time [Hours]')
        axs[2*rows + 1].grid(axis='both')

        # Define the date format
        myFmt = mdates.DateFormatter('%H')
        axs[2*rows + 1].xaxis.set_major_formatter(myFmt)
        axs[2*rows + 1].plot(self.data["time"], self.data["balance"])
        
        # Exportar los datos a un archivo CSV
        self.data[["time", "balance"]].to_csv(name, index=False)  

        # Configuración para alta resolución
        plt.rcParams['figure.dpi'] = 300  # Ajusta la resolución de la figura

        # Tu código de configuración de la gráfica
        plt.tight_layout()
        plt.subplots_adjust(hspace=0.5)
        plt.subplots_adjust(wspace=0.25)
        #plt.xticks(np.arange(0, 48, 2))
        plt.grid()


        plt.savefig(file, format='svg')
        plt.show()
