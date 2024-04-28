import influxdb_client, os, time
from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS

#token = os.environ.get("INFLUXDB_TOKEN")
token = "1WtMoW7V9eQp9aVcp5DuRYde6dmRrsxB1hmVWm6sLGyt7JG_Udxm8pYkiOpBDNLrrUsknbMGICYseJJau1k3nA=="
org = "garciamsu@gmail.com"
url = "https://us-east-1-1.aws.cloud2.influxdata.com"

client = influxdb_client.InfluxDBClient(url=url, token=token, org=org)

bucket="irradiance"

write_api = client.write_api(write_options=SYNCHRONOUS)
   
for value in range(5):
  point = (
    Point("measurement1")
    .tag("tagname1", "tagvalue1")
    .field("field1", value)
  )
  write_api.write(bucket=bucket, org="garciamsu@gmail.com", record=point)
  time.sleep(1) # separate points by 1 second

  query_api = client.query_api()

query = """from(bucket: "irradiance")
 |> range(start: -10m)
 |> filter(fn: (r) => r._measurement == "measurement1")"""
tables = query_api.query(query, org="garciamsu@gmail.com")

for table in tables:
  for record in table.records:
    print(record)

    query_api = client.query_api()

query = """from(bucket: "irradiance")
  |> range(start: -10m)
  |> filter(fn: (r) => r._measurement == "measurement1")
  |> mean()"""
tables = query_api.query(query, org="garciamsu@gmail.com")

for table in tables:
    for record in table.records:
        print(record)