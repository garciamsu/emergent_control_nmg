<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Test energy system">
  <instance name="My new instance">
    <area name="My area">
      <asset xsi:type="esdl:PVPark" name="PV park">
        <port xsi:type="esdl:OutPort" id="outPort1" connectedTo="inPort1"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="E demand">
        <port xsi:type="esdl:InPort" connectedTo="outPort1" id="inPort1"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
