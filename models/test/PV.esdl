<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2111" name="PV" description="Solar energy" id="6922da68-75ba-4c49-8385-34ff22da299c" version="1">
  <energySystemInformation id="29af0918-9f34-452f-816b-219f4c866236">
    <carriers id="d40b8f36-4b5a-47ea-aa2b-0ddbcfd23904">
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electricidad" voltage="24.0" id="fd8b2e01-5a2f-4169-8ab6-d31d7d259e8b"/>
    </carriers>
  </energySystemInformation>
  <instance name="Test01_1" id="2dae69f7-cf19-47b6-96d7-8f1fd59b4f0a">
    <area id="fd633663-d882-495d-b488-13aed4cbc773" name="Untitled area">
      <asset xsi:type="esdl:PVInstallation" id="315cb5f7-ea5f-4512-adb0-d5619ee9a55b" name="PVInstallation_315c">
        <port xsi:type="esdl:OutPort" name="Out" carrier="fd8b2e01-5a2f-4169-8ab6-d31d7d259e8b" id="0f050043-5f34-43fa-9713-20b10343e788" connectedTo="df4495a9-b71a-4923-bf6a-1da007ac003e"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.15502438271903" lon="4.864454269409181"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="949310d6-6515-4db1-905e-a5c671c9ba40" name="ElectricityDemand_9493">
        <port xsi:type="esdl:InPort" name="In" carrier="fd8b2e01-5a2f-4169-8ab6-d31d7d259e8b" connectedTo="2052daa1-59a7-4feb-a7b1-443285885724" id="c409b1fc-af67-4775-b916-44ab86f8b2b1"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.15499640737493" lon="4.864253103733064"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="d5e8a584-1bfd-4c01-814a-f248ef672e2c" length="14.1" name="ElectricityCable_d5e8">
        <port xsi:type="esdl:InPort" name="In" carrier="fd8b2e01-5a2f-4169-8ab6-d31d7d259e8b" connectedTo="0f050043-5f34-43fa-9713-20b10343e788" id="df4495a9-b71a-4923-bf6a-1da007ac003e"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="fd8b2e01-5a2f-4169-8ab6-d31d7d259e8b" id="2052daa1-59a7-4feb-a7b1-443285885724" connectedTo="c409b1fc-af67-4775-b916-44ab86f8b2b1"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point lat="52.15502438271903" lon="4.864454269409181"/>
          <point lat="52.15499640737493" lon="4.864253103733064"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:PowerToX" id="powerToH" name="Power to Heat"/>
      <asset xsi:type="esdl:PowerToX" id="powerToH" name="Power to Heat"/>
    </area>
  </instance>
</esdl:EnergySystem>
