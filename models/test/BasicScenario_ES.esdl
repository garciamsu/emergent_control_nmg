<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="67b69897-c888-4427-8860-99ece21dfb8f" description="" version="6" esdlVersion="v2111" name="BasicScenario_ES">
  <instance xsi:type="esdl:Instance" name="House01" id="10f784e6-b1ad-4321-8294-3d2e0f95541c">
    <area xsi:type="esdl:Area" name="Untitled area" id="59a0ca12-e55f-4205-834c-9f0378be3bba">
      <asset xsi:type="esdl:Import" id="161bf978-1de0-458b-93e0-922615e8323c" power="1000000.0" prodType="FOSSIL" name="Import_161b">
        <geometry xsi:type="esdl:Point" lon="10.374808609485628" lat="54.39305199966669"/>
        <port xsi:type="esdl:OutPort" carrier="f2314a7c-fdf2-49dc-b04e-83510db5a3c4" connectedTo="57732dda-2ccc-40df-8dd6-1023fd3cebdf" name="Out" id="f0d3c0bb-ef73-4073-848f-5e44ccea3888"/>
        <dataSource xsi:type="esdl:DataSource" name="NewDataSource" id="1c1a9be1-e063-4384-b7c7-b439af6bad41"/>
        <KPIs xsi:type="esdl:KPIs" id="021c1b2f-3ed4-4c0f-b037-afbe6c77880c"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="5b4f14c4-ee57-49af-8747-3d9de78a5232" name="HeatingDemand_Local">
        <port xsi:type="esdl:InPort" carrier="4b2ee6e1-ac58-4ff4-b5a2-abbb59372347" connectedTo="705beb16-9862-4a64-b13d-788133c2d8e4 f477e332-24ad-40fd-90ee-41c94759dc60" name="In" id="9e699249-4d1e-4208-a623-d68b7d713bf4">
          <profile xsi:type="esdl:InfluxDBProfile" filters="" endDate="2019-12-31T22:00:00.000000+0000" database="energy_profiles" multiplier="50.0" startDate="2018-12-31T23:00:00.000000+0000" host="http://influxdb" port="8086" measurement="standard_profiles" field="G1A" id="bdda8e79-c341-4afc-bd14-509ca39db2d7">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="eb07bccb-203f-407e-af98-e687656a221d"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" lon="10.375078171491623" lat="54.39312891036144"/>
        <KPIs xsi:type="esdl:KPIs" id="6182bb8a-5cdd-4f15-a2c4-56b6d4fe4c76" description="KPI_CARGA">
          <kpi xsi:type="esdl:DoubleKPI" id="4472c6d2-085b-4007-9801-8e4fedd4f735" name="NewDoubleKPI">
            <target xsi:type="esdl:DoubleTargetKPI"/>
            <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5f54feab-34d9-4efa-a59d-5cd05977d42e" perTimeUnit="HOUR" perUnit="WATT" perMultiplier="KILO" unit="WATT" multiplier="KILO"/>
          </kpi>
        </KPIs>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="822ec47b-ec43-48d7-9d03-e74227dcfa8f" power="6000.0" efficiency="0.9" name="GasHeater_822e">
        <geometry xsi:type="esdl:Point" lon="10.374970883131029" lat="54.39312110217563"/>
        <port xsi:type="esdl:InPort" carrier="f2314a7c-fdf2-49dc-b04e-83510db5a3c4" connectedTo="f0d3c0bb-ef73-4073-848f-5e44ccea3888" name="In" id="57732dda-2ccc-40df-8dd6-1023fd3cebdf"/>
        <port xsi:type="esdl:OutPort" carrier="4b2ee6e1-ac58-4ff4-b5a2-abbb59372347" connectedTo="9e699249-4d1e-4208-a623-d68b7d713bf4" name="Out" id="705beb16-9862-4a64-b13d-788133c2d8e4"/>
      </asset>
      <asset xsi:type="esdl:Import" id="62861baf-624a-4293-9d47-4b71ce4d7d31" name="Import_6286">
        <port xsi:type="esdl:OutPort" carrier="4f047b03-5419-43fb-add6-433306b78f95" connectedTo="30e04597-ceec-4575-979c-210a4bc33583" name="Out" id="4050ad8c-1d99-4d04-80ad-b94384f26c94"/>
        <geometry xsi:type="esdl:Point" lon="10.374752283096315" lat="54.39308674614053"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="1024d8e6-d9ce-41ed-925a-9b062197cc13" name="HeatPump_1024">
        <port xsi:type="esdl:InPort" carrier="4f047b03-5419-43fb-add6-433306b78f95" connectedTo="4050ad8c-1d99-4d04-80ad-b94384f26c94" name="In" id="30e04597-ceec-4575-979c-210a4bc33583"/>
        <port xsi:type="esdl:OutPort" carrier="4b2ee6e1-ac58-4ff4-b5a2-abbb59372347" connectedTo="9e699249-4d1e-4208-a623-d68b7d713bf4" name="Out" id="f477e332-24ad-40fd-90ee-41c94759dc60"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="10.374985635280611" lat="54.39317419780967"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="a50884b2-300c-45fe-ab41-3a7567f0dd46">
    <carriers xsi:type="esdl:Carriers" id="25d2188a-9bd2-41a2-b81e-fa88b314f3b1">
      <carrier xsi:type="esdl:GasCommodity" id="f2314a7c-fdf2-49dc-b04e-83510db5a3c4" name="gas"/>
      <carrier xsi:type="esdl:HeatCommodity" id="4b2ee6e1-ac58-4ff4-b5a2-abbb59372347" name="heat"/>
      <carrier xsi:type="esdl:ElectricityCommodity" id="4f047b03-5419-43fb-add6-433306b78f95" name="electricity"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="45dba02b-db4b-4adf-ba04-7cb771a4aff8">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eb07bccb-203f-407e-af98-e687656a221d" multiplier="GIGA" description="Energy in GJ" unit="JOULE" physicalQuantity="ENERGY"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
