from sourcecode.classes.controller.rtm import ResponseThresholdController
import pandas as pd

class storageAgent ():

    def __init__(self, type="mg"):
        self.producer = ResponseThresholdController()
        self.consumer = ResponseThresholdController()
        self.df_producer = pd.DataFrame()
        self.df_consumer = pd.DataFrame()
        self.modelType = type
        self.power = 0
    
    def update(self, demand, renewablePower):

        if (self.modelType == 'mg'):
            self.producer.setStimulus (demand - renewablePower) 
            self.producer.setWorkers (renewablePower / demand) 

            self.consumer.setStimulus (renewablePower - demand) 
            self.consumer.setWorkers (renewablePower / demand)

        self.producer.probability()
        self.consumer.probability()

        
        if (self.producer.detectIncreasePos == 1 and self.consumer.detectIncreasePos == 0):
            self.power = abs(demand)
        elif (self.producer.detectIncreasePos == 0 and self.consumer.detectIncreasePos == 1):
            self.power = -abs(renewablePower) + abs(demand)
        elif (self.producer.detectIncreasePos == 0 and self.consumer.detectIncreasePos == 0):
            self.power = 0
        else:
            self.power = 0


    def setStimulusProducer(self, instantStimulu):
        self.producer.setStimulus(instantStimulu)

    def setWorkersProducer(self, workerAction):
        self.producer.setWorkers(workerAction)

    def setStimulusConsumer(self, instantStimulu):
        self.consumer.setStimulus(instantStimulu)

    def setWorkersConsumer(self, workerAction):
        self.consumer.setWorkers(workerAction)

    def results(self):
        self.df_producer = self.producer.results()
        self.df_consumer = self.consumer.results()