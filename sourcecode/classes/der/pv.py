#https://assessingsolar.org/notebooks/solar_power_modeling.html

import matplotlib.pyplot as plt
import pandas as pd
import pvlib
import numpy as np
from pvlib import pvsystem
import os

# Define the folder'route
root = os.getcwd()
pathname = os.path.join(root)

#INPUT
stationID = 'UOSMRL'
startDate = '20210601'
endDate = '20210607'
latitude = 44.0467
longitude = -123.0743
altitude = 133.8
namePV = 'AssessingSolar_PV'
surface_tilt = 30
surface_azimuth = 180
typeInverter = 0

# CEC PV Module Database
cec_mod_db = pvsystem.retrieve_sam('CECmod')
invdb = pvsystem.retrieve_sam('CECInverter')

# Let's read the weather data from the MIDC station using the I/O tools available within pvlib
df_weather = pvlib.iotools.read_midc_raw_data_from_nrel(stationID,               # Station id
                                                    pd.Timestamp(startDate),   # Start date YYYYMMDD
                                                    pd.Timestamp(endDate))   # End date  YYYYMMDD

# Let's see the head, shape and columns of the data
df_weather.head(3)

# Subset variables needed
df_weather = df_weather[['Global CMP22 [W/m^2]', 'Diffuse Schenk [W/m^2]', 
                         'Direct CHP1 [W/m^2]','Air Temperature [deg C]', 'Avg Wind Speed @ 10m [m/s]']]
# Rename the columns
df_weather.columns = ['ghi', 'dhi', 'dni', 'temp_air', 'wind_speed']

df_weather['wind_speed'].to_csv(pathname + "/datasets/pvlib-wind_speed.csv", encoding ='latin1', index=True)

# See the first columns of our weather dataset
df_weather.head(3)

# Define the location object
location = pvlib.location.Location(latitude, longitude, altitude=altitude)

# Define Temperature Paremeters 
temperature_model_parameters = pvlib.temperature.TEMPERATURE_MODEL_PARAMETERS['sapm']['open_rack_glass_glass']

# Define the PV Module and the Inverter from the CEC databases (For example, the first entry of the databases)
module_data = cec_mod_db.iloc[:,0]

invdb = pvsystem.retrieve_sam('CECInverter')
inverter_data = invdb.iloc[:, typeInverter]

# Define the basics of the class PVSystem
system = pvlib.pvsystem.PVSystem(surface_tilt=surface_tilt, surface_azimuth=surface_azimuth,
                                 module_parameters=module_data,
                                 inverter_parameters=inverter_data,
                                 temperature_model_parameters=temperature_model_parameters)

# Creation of the ModelChain object
""" The example does not consider AOI losses nor irradiance spectral losses"""
mc = pvlib.modelchain.ModelChain(system, location, 
                                 aoi_model='no_loss', 
                                 spectral_model='no_loss',
                                 name=namePV)

# Have a look to the ModelChain
#print(mc)

mc.run_model(df_weather) 

# Access the weather data
mc.results.weather

# Access the solar position at each timestamp
mc.results.solar_position

# Access Plane-of-array Irradiances
mc.results.total_irrad

# Access the AC power output
mc.results.ac

#OUTPUT
# Access the DC power output
print(mc.results.dc)

mc.results.dc['p_mp'].to_csv(pathname + "/datasets/pvlib-solar_power.csv", encoding ='latin1', index=True)