<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="97e864e7-cf50-4ead-8c53-3976c5eacdf6" description="Campus University" esdlVersion="v2111" version="20" name="UNET">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="029e3da1-b9e3-4620-a05f-6c8915a4df13">
    <notes xsi:type="esdl:Notes" id="d10a9820-9b38-4fef-a11a-ceecda72bea3"/>
    <sectors xsi:type="esdl:Sectors" id="c2ed3f4e-3d06-4446-80e4-c370be896721">
      <sector xsi:type="esdl:Sector" code="" description="" name="Education" id="1d1a1839-a9ae-428a-866f-8f99e5770a80"/>
    </sectors>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="74541f64-333e-4a61-838a-7d93fb669d24">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" multiplier="KILO" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1a" description="Power in kW" physicalQuantity="POWER"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="288800e6-4ed5-46de-bd36-ba25d0a624ee">
      <carrier xsi:type="esdl:ElectricityCommodity" id="b37625d7-f15d-45fd-9574-68571befcd4c" name="Electricity"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="0d61c1d8-81c3-4717-95be-9cea8597cb44" name="Universidad Nacional Experimental del Tachira">
    <area xsi:type="esdl:Area" name="UNET" scope="STREET" id="6bccfd2b-fc20-4c92-9a50-5ebe85510295">
      <area xsi:type="esdl:Area" name="Microgrid 1" scope="BUILDING" id="c90f2fb0-3015-4f3a-a88b-4b82abfae790">
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="7.793061268675681" lon="-72.20076651707576"/>
            <point xsi:type="esdl:Point" lat="7.792968260813821" lon="-72.20020308824445"/>
            <point xsi:type="esdl:Point" lat="7.793486447209669" lon="-72.20012528140583"/>
            <point xsi:type="esdl:Point" lat="7.793574140228603" lon="-72.20069407622601"/>
            <point xsi:type="esdl:Point" lat="7.793047981839532" lon="-72.20077456605907"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:GenericConsumer" id="6a9c526f-a880-4aaa-afe1-fcc72da22ccc" name="PL1">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="6c73cece-3a69-4bff-bae2-efc8ba5f23cc" name="In" id="d6430805-7d60-4fb3-9df8-483c12eeea0b">
            <profile xsi:type="esdl:InfluxDBProfile" id="5be0ed44-c916-464c-bd5e-b6c05247d0e7" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg1_dataset" field="PL">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793056005564313" lon="-72.20028160902977"/>
        </asset>
        <asset xsi:type="esdl:GenericProducer" id="2bb06dab-ef1d-4202-97c8-997f1008caf4" name="PT1">
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="2fd54926-132b-446d-bae9-625aee6e0ee7" name="Out" id="b0509935-95f1-46e0-a064-55f0d15b8550">
            <profile xsi:type="esdl:InfluxDBProfile" id="eaf52485-88b1-4bf8-8c23-96eca58cd127" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg1_dataset" field="PT">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793122442386878" lon="-72.20067860345367"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_1-2" id="6380bb4c-3bda-4de0-86e4-9bbbeefcf9ff">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="6c73cece-3a69-4bff-bae2-efc8ba5f23cc" name="In" id="fa0108af-3a46-4b16-977e-51620b0e5b3a"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="767fac84-5d78-46ab-8f2e-980f3dcf16fe" name="Out" id="983f46d8-4b6d-4516-ba3f-8b36eb5c2d0d"/>
          <geometry xsi:type="esdl:Point" lat="7.793499797358881" lon="-72.20064908108984"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_1-4" id="c1bac24c-4ef8-4f25-b41b-2738952429c9">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="6c73cece-3a69-4bff-bae2-efc8ba5f23cc" name="In" id="46d70c33-8c74-402e-8cd6-9e8e931e40f9"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="13f6886f-cd00-4b71-9c93-f4579431b9ac" name="Out" id="b558b97f-0adc-4c50-9c00-781a011efabb"/>
          <geometry xsi:type="esdl:Point" lat="7.793497138601127" lon="-72.20025213379112"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_1-3" id="6941d592-6724-419b-8459-753c456f42fe">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="6c73cece-3a69-4bff-bae2-efc8ba5f23cc" name="In" id="381c5a9d-06ff-4334-b645-2fc40cde5007"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="cd801221-7ccb-40a4-917d-96feb85dd12b" name="Out" id="006d483d-ac2d-4887-b466-834b7a75ec68"/>
          <geometry xsi:type="esdl:Point" lat="7.793257971763996" lon="-72.20019042256288"/>
        </asset>
        <asset xsi:type="esdl:ElectricityNetwork" name="ElectricityNetwork1" id="59b3bb70-14d9-4ba8-94bc-7d192f70ad08">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="b0509935-95f1-46e0-a064-55f0d15b8550 d467d201-78e3-4431-adff-18b1d2a0efcf a87b93ce-65f6-4933-89e0-238816ebab80 2fcecefa-2a9f-4b7a-b6e5-e2f46766c98d" name="In" id="2fd54926-132b-446d-bae9-625aee6e0ee7"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="d6430805-7d60-4fb3-9df8-483c12eeea0b fa0108af-3a46-4b16-977e-51620b0e5b3a 46d70c33-8c74-402e-8cd6-9e8e931e40f9 381c5a9d-06ff-4334-b645-2fc40cde5007" name="Out" id="6c73cece-3a69-4bff-bae2-efc8ba5f23cc"/>
          <geometry xsi:type="esdl:Point" lat="7.79332703763535" lon="-72.20046062664964" CRS="WGS84"/>
        </asset>
        <potential xsi:type="esdl:GeothermalEnergyPotential" shortName="PTmax1" name="GeothermalEnergyPotential1" id="a25ae275-1f24-4203-8932-2ae5da21292e"/>
      </area>
      <area xsi:type="esdl:Area" name="Microgrid 3" scope="BUILDING" id="b4fe9959-63ae-497b-996f-83e413af6eba">
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="7.792763643444947" lon="-72.19910306052617"/>
            <point xsi:type="esdl:Point" lat="7.792691894473758" lon="-72.19865231746115"/>
            <point xsi:type="esdl:Point" lat="7.793210081211693" lon="-72.1985879255947"/>
            <point xsi:type="esdl:Point" lat="7.793268543264955" lon="-72.19893403187679"/>
            <point xsi:type="esdl:Point" lat="7.793034695002963" lon="-72.19906281560965"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:GenericConsumer" id="b14f2a31-0b85-4460-8a21-4458119e3960" name="PL3">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="7c643176-2fc2-4aa2-9c37-33216db44870" name="In" id="3fcf4f11-e15d-4982-b335-a5822b527850">
            <profile xsi:type="esdl:InfluxDBProfile" id="05a1371f-e812-4c97-93e1-e9cfac21ad35" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg3_dataset" field="PL">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793159635558063" lon="-72.19864813745633"/>
        </asset>
        <asset xsi:type="esdl:GenericProducer" id="22c9b7bd-c9fa-4a6f-8f9e-9f56f728c3e2" name="PT3">
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="cd801221-7ccb-40a4-917d-96feb85dd12b" name="Out" id="eab16b1d-a5e4-4fd3-823c-8f144954e833">
            <profile xsi:type="esdl:InfluxDBProfile" id="f3d7d358-034f-4ccf-b4ec-468e6a98b833" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg3_dataset" field="PT">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.792816836454841" lon="-72.19870975914672"/>
        </asset>
        <asset xsi:type="esdl:ElectricityNetwork" name="ElectricityNetwork3" id="b72d2074-2024-4aad-9f6a-be1935951cac">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="006d483d-ac2d-4887-b466-834b7a75ec68 eab16b1d-a5e4-4fd3-823c-8f144954e833 5a472894-bbeb-406b-9b80-ff9509d54af2 68d1ab41-8fed-40f0-9c8c-8c96a5500596" name="In" id="cd801221-7ccb-40a4-917d-96feb85dd12b"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="3fcf4f11-e15d-4982-b335-a5822b527850 b2a372e3-c4e6-45f4-88bb-145e9de827bb ef8e482e-b471-4b8e-a675-023c442841c6 9a5386cf-4980-4ca4-9ed4-7a5912fa0d94" name="Out" id="7c643176-2fc2-4aa2-9c37-33216db44870"/>
          <geometry xsi:type="esdl:Point" lat="7.793021458883354" lon="-72.19879567937308"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_3-1" id="3376daef-1668-402c-a1e7-31e876ff0ddb">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="7c643176-2fc2-4aa2-9c37-33216db44870" name="In" id="b2a372e3-c4e6-45f4-88bb-145e9de827bb"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="2fd54926-132b-446d-bae9-625aee6e0ee7" name="Out" id="2fcecefa-2a9f-4b7a-b6e5-e2f46766c98d"/>
          <geometry xsi:type="esdl:Point" lat="7.793042718867319" lon="-72.19903171141011"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_3-2" id="feef3937-2919-4c0a-a4ba-21da37cfb8c7">
          <geometry xsi:type="esdl:Point" lat="7.7930799247946165" lon="-72.19892173534258"/>
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="7c643176-2fc2-4aa2-9c37-33216db44870" name="In" id="ef8e482e-b471-4b8e-a675-023c442841c6"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="767fac84-5d78-46ab-8f2e-980f3dcf16fe" name="Out" id="325a990a-67f3-4bbd-9795-99409eb4cd1c"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_3-4" id="7779863e-eb39-4f73-9ea3-96a5013301ec">
          <geometry xsi:type="esdl:Point" CRS="WGS84" lat="7.793218088143692" lon="-72.19885085198052"/>
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="7c643176-2fc2-4aa2-9c37-33216db44870" name="In" id="9a5386cf-4980-4ca4-9ed4-7a5912fa0d94"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="13f6886f-cd00-4b71-9c93-f4579431b9ac" name="Out" id="e49884d9-4795-45d2-8c8a-b96cddf1bc48"/>
        </asset>
        <potential xsi:type="esdl:SolarPotential" solarPotentialType="ROOFTOP_PV" name="SolarPotential3" shortName="PTmax3" id="3280889a-bc80-4b5c-b119-82c4afbfdb8b"/>
      </area>
      <area xsi:type="esdl:Area" name="Microgrid 4" scope="BUILDING" id="ddff315b-1b14-435d-90b2-9c787b98e9fd">
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="7.794230508605038" lon="-72.20002601061175"/>
            <point xsi:type="esdl:Point" lat="7.794047150741113" lon="-72.19908427956514"/>
            <point xsi:type="esdl:Point" lat="7.794105612677471" lon="-72.19907086459297"/>
            <point xsi:type="esdl:Point" lat="7.794060437545546" lon="-72.19881598012167"/>
            <point xsi:type="esdl:Point" lat="7.793951485736764" lon="-72.19882939509384"/>
            <point xsi:type="esdl:Point" lat="7.793887709055049" lon="-72.19847255683399"/>
            <point xsi:type="esdl:Point" lat="7.794025891853141" lon="-72.19845109287853"/>
            <point xsi:type="esdl:Point" lat="7.794065752267201" lon="-72.19863085350565"/>
            <point xsi:type="esdl:Point" lat="7.794241138043948" lon="-72.19860670655575"/>
            <point xsi:type="esdl:Point" lat="7.794294285234516" lon="-72.19896086182113"/>
            <point xsi:type="esdl:Point" lat="7.794219879165835" lon="-72.19896086182113"/>
            <point xsi:type="esdl:Point" lat="7.794227851245253" lon="-72.19905744962078"/>
            <point xsi:type="esdl:Point" lat="7.794432467898426" lon="-72.19902257069313"/>
            <point xsi:type="esdl:Point" lat="7.7944696709155155" lon="-72.19929087013662"/>
            <point xsi:type="esdl:Point" lat="7.794344775059307" lon="-72.19930160211436"/>
            <point xsi:type="esdl:Point" lat="7.794376663366572" lon="-72.19943843483054"/>
            <point xsi:type="esdl:Point" lat="7.794334145623031" lon="-72.19944648381384"/>
            <point xsi:type="esdl:Point" lat="7.794366033931084" lon="-72.1996530743853"/>
            <point xsi:type="esdl:Point" lat="7.794416523747211" lon="-72.19965039139089"/>
            <point xsi:type="esdl:Point" lat="7.7944696709155155" lon="-72.19999381467852"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:GenericProducer" id="c1479e40-43de-4670-b760-6fb56c58a62c" name="PT4">
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="13f6886f-cd00-4b71-9c93-f4579431b9ac" name="Out" id="98f79376-8998-43f8-9502-6fc46f01816e">
            <profile xsi:type="esdl:InfluxDBProfile" id="96270589-b135-4037-b87e-af73cb1edfbf" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg4_dataset" field="PT">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.794126952095917" lon="-72.19868838865621"/>
        </asset>
        <asset xsi:type="esdl:GenericConsumer" id="b83a3c87-96b6-4c19-b088-ae015c0bc8f9" name="PL4">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="0684629d-a246-4232-a592-d4e4ad82cc8d" name="In" id="b3d4c8f3-6bc7-44ee-b67c-5a2ee16dcc5b">
            <profile xsi:type="esdl:InfluxDBProfile" id="5da0ae28-8eb6-4d8c-a4db-647d0872edf0" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg4_dataset" field="PL">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.794413953750394" lon="-72.19921143198084"/>
        </asset>
        <asset xsi:type="esdl:ElectricityNetwork" name="ElectricityNetwork4" id="c1b3eb4c-e23a-4485-9432-cbb30abaf293">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="b558b97f-0adc-4c50-9c00-781a011efabb 98f79376-8998-43f8-9502-6fc46f01816e e49884d9-4795-45d2-8c8a-b96cddf1bc48 7eb952f1-a0af-45c7-b6af-51d78a034805" name="In" id="13f6886f-cd00-4b71-9c93-f4579431b9ac"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="b3d4c8f3-6bc7-44ee-b67c-5a2ee16dcc5b 1479051d-ac83-46b9-83b8-5961c09ddcd8 34888b5a-bae2-4fa2-89e5-df42a5ddf8e3 bff525ba-ac49-4876-b271-2dd97eba7a2a" name="Out" id="0684629d-a246-4232-a592-d4e4ad82cc8d"/>
          <geometry xsi:type="esdl:Point" lat="7.794246536572139" lon="-72.19924898604873"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_4-1" id="82851ae3-b35a-419a-8376-14bf3700d36a">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="0684629d-a246-4232-a592-d4e4ad82cc8d" name="In" id="1479051d-ac83-46b9-83b8-5961c09ddcd8"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="2fd54926-132b-446d-bae9-625aee6e0ee7" name="Out" id="a87b93ce-65f6-4933-89e0-238816ebab80"/>
          <geometry xsi:type="esdl:Point" lat="7.794129610361982" lon="-72.19937228283806"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_4-3" id="3f32d8dc-34f2-4d64-9b05-56347c27bb1f">
          <geometry xsi:type="esdl:Point" lat="7.794092405642673" lon="-72.1991685158512"/>
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="0684629d-a246-4232-a592-d4e4ad82cc8d" name="In" id="34888b5a-bae2-4fa2-89e5-df42a5ddf8e3"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="cd801221-7ccb-40a4-917d-96feb85dd12b" name="Out" id="68d1ab41-8fed-40f0-9c8c-8c96a5500596"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_4-2" id="addbca6e-dfa9-4f66-8777-14f04839c812">
          <geometry xsi:type="esdl:Point" CRS="WGS84" lat="7.794193336219948" lon="-72.19960747683206"/>
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="0684629d-a246-4232-a592-d4e4ad82cc8d" name="In" id="bff525ba-ac49-4876-b271-2dd97eba7a2a"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="767fac84-5d78-46ab-8f2e-980f3dcf16fe" name="Out" id="f23f336a-4498-4767-b8e4-0f79a967614f"/>
        </asset>
        <potential xsi:type="esdl:WindPotential" shortName="PTmax4" name="WindPotential4" id="fbce92ac-2dfd-43c5-9b8e-53d9e47b3291"/>
      </area>
      <area xsi:type="esdl:Area" name="Microgrid 2" scope="BUILDING" id="7a980e7b-654e-4402-ad2d-32e51c41ee78">
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
        <asset xsi:type="esdl:EConnection" name="PEU_2-1" id="1d3603b4-7dfd-4f86-b236-33a0a389202c">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="dee2018b-d276-494d-880b-d94d0907ea80" name="In" id="5c8efeed-4db9-4e78-8b6f-89755fdcce1d"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="2fd54926-132b-446d-bae9-625aee6e0ee7" name="Out" id="d467d201-78e3-4431-adff-18b1d2a0efcf"/>
          <geometry xsi:type="esdl:Point" lat="7.79390904235393" lon="-72.20116937780101"/>
        </asset>
        <asset xsi:type="esdl:ElectricityNetwork" name="ElectricityNetwork2" id="130bd5b6-737a-4d6f-9929-95eacee9cb29">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="983f46d8-4b6d-4516-ba3f-8b36eb5c2d0d 6d4d8d1b-fc23-4249-982e-8f4c937360c2 325a990a-67f3-4bbd-9795-99409eb4cd1c f23f336a-4498-4767-b8e4-0f79a967614f" name="In" id="767fac84-5d78-46ab-8f2e-980f3dcf16fe"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="5c8efeed-4db9-4e78-8b6f-89755fdcce1d ba5385cb-8512-4623-990e-b31596cf7daf 7557fbb2-6961-4e85-8267-87df2b321909 74e56eb0-e2c1-42ac-93be-b704ae6c1f54" name="Out" id="dee2018b-d276-494d-880b-d94d0907ea80"/>
          <geometry xsi:type="esdl:Point" lat="7.794063173281258" lon="-72.20133033626078"/>
        </asset>
        <asset xsi:type="esdl:GenericProducer" name="PT2" id="76a2b9f1-1be7-4646-a21d-ff2e8f7c6b4b">
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="767fac84-5d78-46ab-8f2e-980f3dcf16fe" name="Out" id="6d4d8d1b-fc23-4249-982e-8f4c937360c2">
            <profile xsi:type="esdl:InfluxDBProfile" id="e4c08286-3d2c-4e51-ad32-ed5797060796" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg2_dataset" field="PT">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.794257163572326" lon="-72.20152076367579"/>
        </asset>
        <asset xsi:type="esdl:GenericConsumer" name="PL2" id="5b30e111-1e6a-4a08-8bff-db239bb29d5d">
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="dee2018b-d276-494d-880b-d94d0907ea80" name="In" id="ba5385cb-8512-4623-990e-b31596cf7daf">
            <profile xsi:type="esdl:InfluxDBProfile" id="b03af24a-ebe7-43ce-8b71-004b90371db4" filters="" database="energy_profiles" endDate="2019-01-02T23:50:00.000000+0000" port="8086" host="http://influxdb" multiplier="0.0" startDate="2019-01-01T00:00:00.000000+0000" measurement="cs3_mg2_dataset" field="PL">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1a"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="7.793951569754641" lon="-72.20153690798217"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_2-3" id="0c08e976-16ec-417c-9ea3-e9892bcae17f">
          <geometry xsi:type="esdl:Point" lat="7.793930302362501" lon="-72.20098167736394"/>
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="dee2018b-d276-494d-880b-d94d0907ea80" name="In" id="7557fbb2-6961-4e85-8267-87df2b321909"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="cd801221-7ccb-40a4-917d-96feb85dd12b" name="Out" id="5a472894-bbeb-406b-9b80-ff9509d54af2"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="PEU_2-4" id="721165a5-194a-4410-bf94-a615e4ff27b9">
          <geometry xsi:type="esdl:Point" lat="7.794065830293752" lon="-72.20108628273012"/>
          <port xsi:type="esdl:InPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="dee2018b-d276-494d-880b-d94d0907ea80" name="In" id="74e56eb0-e2c1-42ac-93be-b704ae6c1f54"/>
          <port xsi:type="esdl:OutPort" carrier="b37625d7-f15d-45fd-9574-68571befcd4c" connectedTo="13f6886f-cd00-4b71-9c93-f4579431b9ac" name="Out" id="7eb952f1-a0af-45c7-b6af-51d78a034805"/>
        </asset>
        <potential xsi:type="esdl:SolarPotential" solarPotentialType="ROOFTOP_PV" name="SolarPotential2" shortName="PTmax2" id="eb7d9690-78d0-4a07-bbf2-0119ca499d82"/>
      </area>
    </area>
  </instance>
</esdl:EnergySystem>
