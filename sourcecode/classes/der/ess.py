import pandas as pd

class essModel():
    def __init__(self, capacity=100, voltage=12, soc=100, ctime=10):

        self.nominalVoltage = voltage
        self.ratedCapacity = capacity               #Unidades: Ah
        self.capacityByHour = capacity/ctime
        self.ctime = ctime
        self.soc = soc                              #state-of-charger
        self.enable = True
        self.t_prev = 0
        self.accumulatedCurrent = self.ratedCapacity*self.soc/100  

        self.listSoc = []
        self.listPower = []

        self.df = pd.DataFrame()


    def update(self, power, t):
    
        if self.enable:

            if (power > 0):
                demand = abs(power)
                dischargeCurrent = round(demand/self.nominalVoltage, 2)
                self.accumulatedCurrent = (self.accumulatedCurrent - dischargeCurrent*(t-self.t_prev))
            else:
                renewablePower = abs(power)
                chargingCurrent = round(renewablePower/self.nominalVoltage, 2)
                self.accumulatedCurrent = (self.accumulatedCurrent + chargingCurrent*(t-self.t_prev))
            
            if (self.accumulatedCurrent <= 0):
                self.accumulatedCurrent = 0

            if (self.accumulatedCurrent >= self.ratedCapacity):
                self.accumulatedCurrent = self.ratedCapacity

            self.soc = round(100*self.accumulatedCurrent/self.ratedCapacity, 2)

        self.t_prev = t
        self.accumulatedCurrent = round(self.accumulatedCurrent, 2)

        self.listSoc.append(self.soc)
        self.listPower.append(power)
        #print(str(self.accumulatedCurrent) + " -> " + str(self.soc))
        
    def results(self):
        self.df['soc'] = self.listSoc
        self.df['power'] = self.listPower

    def show(self):
        print("Rated capacity: " +  str(self.ratedCapacity) + " Ah in " + str(self.ctime)+ " Hours")
        print("Nominal voltage: " +  str(self.nominalVoltage) + " V")
        print("State of charge (soc): "+  str(self.soc) + "%")
        print("Capacity by hour: "+  str(self.capacityByHour)  + " A")
        


