<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="UNET" id="97e864e7-cf50-4ead-8c53-3976c5eacdf6" esdlVersion="v2111" description="Campus University" version="23">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="029e3da1-b9e3-4620-a05f-6c8915a4df13">
    <sectors xsi:type="esdl:Sectors" id="c2ed3f4e-3d06-4446-80e4-c370be896721">
      <sector xsi:type="esdl:Sector" name="Education" code="" description="" id="1d1a1839-a9ae-428a-866f-8f99e5770a80"/>
    </sectors>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="0e694cc8-dc05-4078-9001-e4822d4684ff">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" unit="WATT" multiplier="KILO" id="e9405fc8-5e57-4df5-8584-4babee7cdf1a" description="Power in kW"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="288800e6-4ed5-46de-bd36-ba25d0a624ee">
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electricity" id="b37625d7-f15d-45fd-9574-68571befcd4c"/>
    </carriers>
    <notes xsi:type="esdl:Notes" id="d10a9820-9b38-4fef-a11a-ceecda72bea3"/>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="0d61c1d8-81c3-4717-95be-9cea8597cb44" name="Universidad Nacional Experimental del Tachira">
    <area xsi:type="esdl:Area" id="6bccfd2b-fc20-4c92-9a50-5ebe85510295" scope="STREET" name="UNET">
      <area xsi:type="esdl:Area" scope="BUILDING" name="Microgrid 1" id="c90f2fb0-3015-4f3a-a88b-4b82abfae790">
        <asset xsi:type="esdl:GenericConsumer" id="6a9c526f-a880-4aaa-afe1-fcc72da22ccc" name="PL1">
          <port xsi:type="esdl:InPort" name="In" id="d6430805-7d60-4fb3-9df8-483c12eeea0b" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="6c73cece-3a69-4bff-bae2-efc8ba5f23cc">
            <profile xsi:type="esdl:InfluxDBProfile" field="PL" id="a7f15da8-aacb-4541-b8fb-cb220f3d6976" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" host="http://influxdb" port="8086" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs1_mg1_dataset">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793056005564313" lon="-72.20028160902977"/>
        </asset>
        <asset xsi:type="esdl:GenericProducer" id="2bb06dab-ef1d-4202-97c8-997f1008caf4" name="PT1">
          <port xsi:type="esdl:OutPort" name="Out" id="b0509935-95f1-46e0-a064-55f0d15b8550" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="2fd54926-132b-446d-bae9-625aee6e0ee7">
            <profile xsi:type="esdl:InfluxDBProfile" field="PT" id="26f62ac7-ce0c-4650-962a-6ac4e02d0d56" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" host="http://influxdb" port="8086" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs1_mg1_dataset">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793122442386878" lon="-72.20067860345367"/>
        </asset>
        <asset xsi:type="esdl:EConnection" id="6380bb4c-3bda-4de0-86e4-9bbbeefcf9ff" name="PEU_1-2">
          <port xsi:type="esdl:InPort" name="In" id="fa0108af-3a46-4b16-977e-51620b0e5b3a" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="6c73cece-3a69-4bff-bae2-efc8ba5f23cc"/>
          <port xsi:type="esdl:OutPort" name="Out" id="983f46d8-4b6d-4516-ba3f-8b36eb5c2d0d" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="767fac84-5d78-46ab-8f2e-980f3dcf16fe"/>
          <geometry xsi:type="esdl:Point" lat="7.793499797358881" lon="-72.20064908108984"/>
        </asset>
        <asset xsi:type="esdl:ElectricityNetwork" id="59b3bb70-14d9-4ba8-94bc-7d192f70ad08" name="ElectricityNetwork1">
          <port xsi:type="esdl:InPort" name="In" id="2fd54926-132b-446d-bae9-625aee6e0ee7" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="b0509935-95f1-46e0-a064-55f0d15b8550 d467d201-78e3-4431-adff-18b1d2a0efcf"/>
          <port xsi:type="esdl:OutPort" name="Out" id="6c73cece-3a69-4bff-bae2-efc8ba5f23cc" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="d6430805-7d60-4fb3-9df8-483c12eeea0b fa0108af-3a46-4b16-977e-51620b0e5b3a"/>
          <geometry xsi:type="esdl:Point" lat="7.79332703763535" lon="-72.20046062664964" CRS="WGS84"/>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="7.793061268675681" lon="-72.20076651707576"/>
            <point xsi:type="esdl:Point" lat="7.792968260813821" lon="-72.20020308824445"/>
            <point xsi:type="esdl:Point" lat="7.793486447209669" lon="-72.20012528140583"/>
            <point xsi:type="esdl:Point" lat="7.793574140228603" lon="-72.20069407622601"/>
            <point xsi:type="esdl:Point" lat="7.793047981839532" lon="-72.20077456605907"/>
          </exterior>
        </geometry>
        <potential xsi:type="esdl:GeothermalEnergyPotential" shortName="PTmax1" name="GeothermalEnergyPotential1" id="a25ae275-1f24-4203-8932-2ae5da21292e"/>
      </area>
      <area xsi:type="esdl:Area" scope="BUILDING" name="Microgrid 2" id="7a980e7b-654e-4402-ad2d-32e51c41ee78">
        <asset xsi:type="esdl:EConnection" id="1d3603b4-7dfd-4f86-b236-33a0a389202c" name="PEU_2-1">
          <port xsi:type="esdl:InPort" name="In" id="5c8efeed-4db9-4e78-8b6f-89755fdcce1d" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="dee2018b-d276-494d-880b-d94d0907ea80"/>
          <port xsi:type="esdl:OutPort" name="Out" id="d467d201-78e3-4431-adff-18b1d2a0efcf" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="2fd54926-132b-446d-bae9-625aee6e0ee7"/>
          <geometry xsi:type="esdl:Point" lat="7.79390904235393" lon="-72.20116937780101"/>
        </asset>
        <asset xsi:type="esdl:ElectricityNetwork" id="130bd5b6-737a-4d6f-9929-95eacee9cb29" name="ElectricityNetwork2">
          <port xsi:type="esdl:InPort" name="In" id="767fac84-5d78-46ab-8f2e-980f3dcf16fe" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="983f46d8-4b6d-4516-ba3f-8b36eb5c2d0d 6d4d8d1b-fc23-4249-982e-8f4c937360c2"/>
          <port xsi:type="esdl:OutPort" name="Out" id="dee2018b-d276-494d-880b-d94d0907ea80" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="5c8efeed-4db9-4e78-8b6f-89755fdcce1d ba5385cb-8512-4623-990e-b31596cf7daf"/>
          <geometry xsi:type="esdl:Point" lat="7.794063173281258" lon="-72.20133033626078"/>
        </asset>
        <asset xsi:type="esdl:GenericProducer" id="76a2b9f1-1be7-4646-a21d-ff2e8f7c6b4b" name="PT2">
          <port xsi:type="esdl:OutPort" name="Out" id="6d4d8d1b-fc23-4249-982e-8f4c937360c2" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="767fac84-5d78-46ab-8f2e-980f3dcf16fe">
            <profile xsi:type="esdl:InfluxDBProfile" field="PT" id="f187286e-1feb-4ab9-a462-f35f0fdfba6a" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" host="http://influxdb" port="8086" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs1_mg2_dataset">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.794257163572326" lon="-72.20152076367579"/>
        </asset>
        <asset xsi:type="esdl:GenericConsumer" id="5b30e111-1e6a-4a08-8bff-db239bb29d5d" name="PL2">
          <port xsi:type="esdl:InPort" name="In" id="ba5385cb-8512-4623-990e-b31596cf7daf" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="dee2018b-d276-494d-880b-d94d0907ea80">
            <profile xsi:type="esdl:InfluxDBProfile" field="PL" id="aa6fab61-d60d-4f6d-b601-3a27db93d5c0" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" host="http://influxdb" port="8086" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs1_mg2_dataset">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793951569754641" lon="-72.20153690798217"/>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="7.794203935006542" lon="-72.20169751614463"/>
            <point xsi:type="esdl:Point" lat="7.794336802982116" lon="-72.20148824257872"/>
            <point xsi:type="esdl:Point" lat="7.794145473083911" lon="-72.20135140986254"/>
            <point xsi:type="esdl:Point" lat="7.794118899480046" lon="-72.20128433500167"/>
            <point xsi:type="esdl:Point" lat="7.79408169643175" lon="-72.20128165200724"/>
            <point xsi:type="esdl:Point" lat="7.79408169643175" lon="-72.2012548220629"/>
            <point xsi:type="esdl:Point" lat="7.794100297956311" lon="-72.20121994313523"/>
            <point xsi:type="esdl:Point" lat="7.79408169643175" lon="-72.20102140154707"/>
            <point xsi:type="esdl:Point" lat="7.794039178658248" lon="-72.20099188860829"/>
            <point xsi:type="esdl:Point" lat="7.794033863936261" lon="-72.20090066679751"/>
            <point xsi:type="esdl:Point" lat="7.793842533899601" lon="-72.20093554572514"/>
            <point xsi:type="esdl:Point" lat="7.793871764883084" lon="-72.20106701245246"/>
            <point xsi:type="esdl:Point" lat="7.793821275001247" lon="-72.20111262335786"/>
            <point xsi:type="esdl:Point" lat="7.793869107521048" lon="-72.20143726568448"/>
            <point xsi:type="esdl:Point" lat="7.7939328842056" lon="-72.20147214461213"/>
            <point xsi:type="esdl:Point" lat="7.793861135434798" lon="-72.20156604941734"/>
            <point xsi:type="esdl:Point" lat="7.793962115182761" lon="-72.2016250752949"/>
            <point xsi:type="esdl:Point" lat="7.794017919769881" lon="-72.20154190246744"/>
          </exterior>
        </geometry>
        <potential xsi:type="esdl:SolarPotential" shortName="PTmax2" id="eb7d9690-78d0-4a07-bbf2-0119ca499d82" name="SolarPotential2" solarPotentialType="ROOFTOP_PV">
          <dataSource xsi:type="esdl:DataSource" name="NewDataSource" id="7fb19aee-ca2d-4e2b-bb6a-9ebabbb3be59"/>
        </potential>
      </area>
    </area>
  </instance>
</esdl:EnergySystem>
