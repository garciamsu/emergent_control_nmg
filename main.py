import os
import time
import pandas as pd
from esdl import esdl
from datetime import datetime
import matplotlib.pyplot as plt
from esdl.esdl_handler import EnergySystemHandler
from sourcecode.classes.agent.peu import powerExchangeUnitAgent

# User-defined functions
def read_esdl(file):
    esh = EnergySystemHandler()

    nodes = []
    es: esdl.EnergySystem = esh.load_file(file)

    for area in es.instance[0].area.area:
        
        node = {
            "name": area.name,
            "id": area.id,
            "PL": {"measurement": "", "field": ""},
            "PT": {"measurement": "", "field": ""},
            "neighbors": []
        }

        for asset in area.asset:

            if "PT" in asset.name:
                node["PT"]["measurement"] = asset.port[0].profile[0].measurement
                node["PT"]["field"] = asset.port[0].profile[0].field

            if "PL" in asset.name:
                node["PL"]["measurement"] = asset.port[0].profile[0].measurement
                node["PL"]["field"] = asset.port[0].profile[0].field

            if "PEU" in asset.name:
                neighbor = {
                    "name": asset.name,
                    "id": asset.id,
                    "PL": 0,
                    "PT": 0,
                }
                node["neighbors"].append(neighbor)

        nodes.append(node)

    for i, node in enumerate(nodes):
        
        for j, neighbor in enumerate(node["neighbors"]):

            name = "Microgrid " + neighbor["name"].split("_")[1].split("-")[1] 
            for k, n in enumerate(nodes):
                
                if name in n["name"]:
                    nodes[i]["neighbors"][j]["PT"] = n["PT"]
                    nodes[i]["neighbors"][j]["PL"] = n["PL"]

    return nodes

# Parameters
pathname = '/sourcecode/scenarios'
route = os.getcwd() + pathname + "/online"
cases = os.listdir(route)

connection = {
    "address": 'localhost',
    "port": 8086,
    "user": 'admin',
    "password": 'admin',
    "database": 'energy_profiles'
}

# Generates the nodes with their relationships based on the .ESDL source file
for case in cases:
    nodes = read_esdl(os.path.join(route, case))

# Initialization of exchange agents
agents = []
for index, node in enumerate(nodes):
    agent = powerExchangeUnitAgent(node, connection)
    agents.append(agent)

# The time range to carry out the sweep is established
# https://stackoverflow.com/questions/70029304/create-pandas-dataframe-from-datetime-range
environment = pd.DataFrame({'time':pd.date_range(start='2019-01-01 00:00:00', end='2019-01-02 23:50:00', freq="10T")}) #S

#for index, instant in environment.iterrows():
#    for peu in agents:
#        peu.update(index, instant["time"])

#The energy balance is established to know the contribution of each neighboring microgrid to the local one.
#for reference in agents:
#    print("************")
#    temporal = pd.DataFrame()
#    for peu in agents:
#        if not reference.name in peu.name:
#            j = 0            
#            for neighbor in peu.neighbors:
#                if reference.name.split(" ")[1] == neighbor["name"].split("_")[1].split("-")[1]:
#                    print(reference.name + " <--> " + peu.name)
#                    reference.data['sw_' + neighbor["name"]] = neighbor["data"]["master"]
#                    col_name = "master-" + str(peu.name.split(" ")[1])
#                    temporal.loc[:, col_name] = neighbor["data"]["producer"].values.tolist()

#    reference.data["balance"] = temporal.sum(axis = 1)
#    reference.data.loc[reference.data['balance'] >= 1, 'balance'] = 1
#    reference.data[neighbor["name"]] = abs(reference.data["dP"]) * reference.data["balance"]
#    reference.data["balance"] = reference.data["dP"]  + reference.data[neighbor["name"]]
#    reference.data.loc[reference.data['balance'] > 0, 'balance'] = 0

# Calculation of performance metrics
#for index, instant in environment.iterrows():
#    for peu in agents:
#        peu.performanceIndex(index, instant["time"])

# The graphs are generated
#for peu in agents:
#    print(peu.name)
#    print("ise: " + str(peu.data.iloc[-1]["ise"])+ " " + "iae: " + str(peu.data.iloc[-1]["iae"])+ " " + "loss: " + str(peu.data.iloc[-1]["loss"]/environment.size) + " " + "resiliency: " + str(environment.size/peu.data.iloc[-1]["loss"]))        
#    peu.graphics_power_differentials(os.getcwd() + pathname + "/results/" + peu.name + ".png")