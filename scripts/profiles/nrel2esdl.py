import pandas as pd
from datetime import datetime
import os

#Initialitation
dataset = "nrel-5339233_7.76_-72.23_2019.csv"

# Define the folder'route
root = os.getcwd()
pathname = os.path.join(root)

# Read the file source CSV
df_comma = pd.read_csv(pathname + "/datasets/" + dataset, sep=",", encoding='latin1')
df_semi = pd.read_csv(pathname + "/datasets/" + dataset, sep=";", encoding='latin1')
if df_comma.shape[1] > df_semi.shape[1]:
    origin = df_comma
else:
    origin = df_semi

print("Processing information, please wait... ")
result = pd.DataFrame(columns=['datetime_UTC', 'Clearsky DNI', 'Wind Speed', 'Temperature', 'Relative Humidity', 'Wind Direction'])

count = 0
for index1, row1 in origin.iterrows():
    # Get fields

    dt = datetime(int(row1["Year"]), int(row1["Month"]), int(row1["Day"]), int(row1["Hour"]), int(row1["Minute"])).strftime("%d-%m-%Y %H:%M")
    result=result.append({'datetime_UTC' : dt, 'Clearsky DNI' : row1["Clearsky DNI"], 'Wind Speed' : row1["Wind Speed"], 'Temperature' : row1["Temperature"], 'Relative Humidity' : row1["Relative Humidity"], 'Wind Direction' : row1["Wind Direction"]} , ignore_index=True)  

 
print(result)
print(result.size)
result.to_csv("nrel.csv", sep=';', encoding ='latin1', index=False)

