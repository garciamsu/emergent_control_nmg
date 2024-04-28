from classes.controller.rtm import ResponseThresholdController
from classes.agent.base import Base
import pandas as pd

class photovoltaicAgent (Base):

    def __init__(self, type="mg"):
        self.pv_agent = ResponseThresholdController()
        self.df = pd.DataFrame()
        self.modelType = type
        self.power = 0
        
        self.listPower = []
    
    def update(self, demand, renewablePower):
    
        if (self.modelType == 'mg'):
            self.pv_agent.setStimulus (renewablePower - demand) 
            self.pv_agent.setWorkers (renewablePower / demand) 
        elif (self.modelType == 'ja'):
            print("Falta implementación")

        self.pv_agent.probability()

        if (self.pv_agent.detectIncreasePos == 1):
            self.power = abs(demand)
        else:
            self.power = 0
        
        self.listPower.append(self.power)

    def setStimulus(self, instantStimulu):
        self.pv_agent.setStimulus(instantStimulu)

    def setWorkers(self, workerAction):
        self.pv_agent.setWorkers(workerAction)

    def results(self):
        self.df = self.pv_agent.results()
        self.df['power'] = self.listPower

        