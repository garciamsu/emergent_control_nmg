# https://ellibrodepython.com/herencia-en-python
# https://subscription.packtpub.com/book/hardware+and+creative/9781786466518/1/ch01lvl1sec12/building-a-smart-temperature-controller-for-your-room
# https://github.com/magnusoy/Python-PID/blob/master/src/pid.py

from math import pow
import pandas as pd
import numpy as np

class ResponseThresholdController:

    def __init__(self, s_j=100, zeta_ij=100, beta=1.06e-6, gamma=3e-5, omega=10.1e-6, ThresholdMin=0.2, ThresholdMax=0.8, output="rise"):

        self.beta = beta
        self.gamma = gamma
        self.omega = omega
        self.zeta_ij = zeta_ij
        self.s_j = s_j
        self.last_time = -1
        self.last_q = 0.5
        self.delta_q = 0.0
        self.q = 0.5
        self.stimulus = 0.0
        self.workers = 0.0
        self.sw = 0
        self.reinforcement = 0.0
        self.detectIncreasePos = 0
        self.detectThreshold = 0
        self.detectThresholdMin = ThresholdMin
        self.detectThresholdMax = ThresholdMax
        self.output = output
        self.data = pd.DataFrame()

    def setStimulus(self, instantStimulu):
        self.stimulus = instantStimulu
        if (self.zeta_ij > 0 and self.s_j > 0):
            self.s_j = self.s_j + self.omega*self.stimulus

    def setWorkers(self, workerAction):

        self.workers = workerAction

        self.reinforcement = - self.beta * \
            (self.workers) + self.gamma*(1-self.workers)

        if (self.zeta_ij > 0 and self.s_j > 0):
            self.zeta_ij = self.zeta_ij + self.reinforcement

    def probability(self):

        self.q = pow(self.s_j, 2)/(pow(self.s_j, 2) + pow(self.zeta_ij, 2))

        self.delta_q = (self.q - self.last_q)

        if self.delta_q > 0:
            self.detectIncreasePos = 1
        else:
            self.detectIncreasePos = 0

        if self.q > self.detectThresholdMax:
            self.detectThreshold = 1
        elif self.q < self.detectThresholdMin:
            self.detectThreshold = 0

        self.last_q = self.q

        new_row = pd.DataFrame({'Stimulus': self.stimulus, 's_j': self.s_j, 'Workers': self.workers, 'zeta_ij': self.zeta_ij, 'q': self.q, 'last_q': self.last_q, 'DetectIncreasePos': self.detectIncreasePos, 'detectThreshold': self.detectThreshold}, index=[0])
        self.data = pd.concat([self.data.loc[:], new_row]).reset_index(drop=True)

        if (self.output == "rise"):
            self.sw = self.detectIncreasePos
        if (self.output == "fall"):
            self.sw = 1 - self.detectIncreasePos
        if (self.output == "threshold"):
            self.sw = self.detectThreshold

        return self.q
