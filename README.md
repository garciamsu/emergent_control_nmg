# A Multiagent System for the Distributed Control in Networked Microgrids using ESDL

![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04.4.LTS-E95420.svg)
![Docker](https://img.shields.io/badge/Docker-26.1.0-1D63ED.svg)
![Anaconda](https://img.shields.io/badge/Anaconda3-2024.02.1-43B049.svg)
![Python](https://img.shields.io/badge/Python-3.11.7-FFE469.svg)
![Visual Studio Code](https://img.shields.io/badge/Visual_Studio_Code-1.88.1-22A4F1.svg)

<p align="justify"> The work addresses the challenges posed by the evolution of power generation systems towards renewable energy resources and decentralized energy networks. It focuses on coordinating energy flows between Networked Microgrids (NMGs) using distributed control strategies based on multi-agent techniques, specifically the Response Threshold Model (RTM) inspired by the behavior of ants to solve the energy <b>coordination problem</b> in NMGs. The study utilizes the Energy System Description Language (ESDL) for simulation, allowing the evaluation of various Microgrid topologies to analyze load balance and energy exchange between neighboring Microgrids. Results demonstrate an improvement in resilience, indicating the effectiveness of the proposed distributed control strategies. The use of ESDL for simulation provides an open and accessible platform to analyze microgrid scenarios, contributing to reproducibility and transparency in research, through a theoretical framework and a comprehensive methodology, supported by detailed documentation of the simulation configurations, the code source and the parameters used to ensure the reproducibility of the scenarios, as well as contribute to future research for the development of the proposal. </p>

## Installation

This section describes the installation process of the application under a Linux environment and framework as previously described.

* Install [Docker](https://docs.docker.com/engine/install/ubuntu/). The installation and configuration procedure is summarized below.

    ```
    sudo su
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    sudo rm get-docker.sh
    systemctl start docker
    ```

> [!WARNING]
> If you get this problem "Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?". Here is a possible [SOLUTION](https://stackoverflow.com/questions/44678725/cannot-connect-to-the-docker-daemon-at-unix-var-run-docker-sock-is-the-docker)

* Install the **Energy System Description Language** [ESDL](https://github.com/ESDLMapEditorESSIM/docker-toolsuite).

> [!TIP]
> Replace the *docker compose-up* command with *docker compose up*, and run with sudo.

* ESDL Map Editor: Upload some profiles in View/Settings/Upload profiles, for which we will find the files in directory /datasets

* Install GUI management tool for the InfluxDB time series database like [InfluxDB WorkBench
](https://github.com/JorgeMaker/InfluxDBWorkBench) or [Time Series Admin](https://timeseriesadmin.github.io/)

> [!NOTE]
> **Connection configuration parameters:**

    ```
    address: localhost
    port: 8086
    user: admin
    password: admin
    database: energy_profiles
    ```

* Install the Anaconda distribution. For more information consult the following [LINK](https://www.liberiangeek.net/2024/01/install-anaconda-ubuntu-tutorial-for-beginners/)
* Install the following dependencies
  - [pyESDL 24.2](https://pypi.org/project/pyESDL/)
    ```
    pip install pyESDL[all]
    ```

## Deploying the Networked Microgrids in ESDL

<p align="justify"> For the development of this work, ESDL was used as the simulation tool, motivated by its ability to extend non-native functionalities, through programming languages such as Python, which has innumerable libraries that facilitate the incorporation of new features and functionalities as our control strategy and our energy exchange agent as a DER. This section will describe the utilization of ESDL in our case. </p>

![Flow Chart](https://github.com/garciamsu/emergent_control_nmg/assets/38272114/13e2e368-f6d9-4f40-b56c-644687fdf5a6)

### Modelling:

[^1]: The components of an NMG are disaggregated into MGs made up of multiple DERs and interconnected through the exchange agent.
[^2]: The variables of interest of each MG were extracted, such as PT,i PL,i, etc.
[^3]: The variables of each MG are loaded into the ESDL database (influxDB).
[^4]: It was assumed that the exchange fluid between the MGs was energy.
[^5]: Using the MapEditor of ESDL is defined a “.esdl” file with the information that describes the MGs, the relationships between them, and the directions to the databases with the variables of each one.
[^6]: The Map Editor of ESDL can define the regions of each MG, called MG1, MG2, etc.
[^7]: The MapEditor of ESDL allows defining the components of each MG and the NMGs using generic producers , generic consumers ,  energy networks , and electricity connections .
[^8]: Each component is named according to its role and associated to a given MG. 
[^9]: The relationships among MGs are defined using PEUs (PEU_1-2 defines an energy exchange agent between the connection from MG1 to MG2). 
[^10]: An example of NMG is:
  - MG 1: PT1, PL1, ElectricityNetwork1, PEU_1-2, PEU_1-3 and PEU_1-4.
  - MG 2: PT2, PL2, ElectricityNetwork2, PEU_2-1, PEU_2-3 and PEU_2-4.
  - MG 3: PT3, PL3, ElectricityNetwork3, PEU_3-1, PEU_3-2 and PEU_3-4.
  - MG 4: PT4, PL4, ElectricityNetwork4, PEU_4-1, PEU_4-2 and PEU_4-3.
[^10]: The NMG can be graphed. Different .esdl files were created for each case study.

### Simulation:

[^11]: The ESDL MapEditor was used to model the NMG, and the .esdl file generated is the input for our Python application, where the control logic is executed.
[^12]: The Python program is executed using the data recorded in the ESDL database (influxDB) of the modelled components.
[^13]: The dynamic behaviour of the components of the NMG are analysed using their data in order to generate the control actions for the distributed coordination of the MGs community.

## References

* [ESDL Documentation](https://energytransition.gitbook.io/esdl).
* [ESDL Model Reference documentation](https://energytransition.github.io/).
* [Programming with Energy System Description Language](https://github.com/EnergyTransition/ESDL-PyEcore-Tutorial/blob/master/ESDLTutorials.ipynb).
* [Example de ESDL and Python](https://github.com/redekok/startanalyse-esdl/tree/master).
* [Example script to process an ESDL file and print all geometry information](https://github.com/EnergyTransition/ESDL-Geometry-Information).
* [Example Flask ESDL service](https://github.com/EnergyTransition/Flask-ESDL-service).
* [Create ESDL from Excel](https://github.com/EnergyTransition/excel-2-esdl).
* [Heat Network Shapefile to ESDL conversion](https://github.com/EnergyTransition/shapefile-2-esdl).