# A Multiagent System for the Distributed Control in Networked Microgrids using ESDL

![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04.4.LTS-8A2BE2.svg)
![Anaconda](https://img.shields.io/badge/Anaconda3-2024.02.1-yellow.svg)
![Python](https://img.shields.io/badge/Python-3.11.7-orange.svg)
![Visual Studio Code](https://img.shields.io/badge/Visual_Studio_Code-1.88.1-blue.svg)

The work addresses the challenges posed by the evolution of power generation systems towards renewable energy resources and decentralized energy networks. It focuses on coordinating energy flows between Networked Microgrids (NMGs) using distributed control strategies based on multi-agent techniques, specifically the Response Threshold Model (RTM) inspired by the behavior of ants to solve the energy *coordination problem* in NMGs. The study utilizes the Energy System Description Language (ESDL) for simulation, allowing the evaluation of various Microgrid topologies to analyze load balance and energy exchange between neighboring Microgrids. Results demonstrate an improvement in resilience, indicating the effectiveness of the proposed distributed control strategies. The use of ESDL for simulation provides an open and accessible platform to analyze microgrid scenarios, contributing to reproducibility and transparency in research, through a theoretical framework and a comprehensive methodology, supported by detailed documentation of the simulation configurations, the code source and the parameters used to ensure the reproducibility of the scenarios, as well as contribute to future research for the development of the proposal.

# Installation

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
> If you get this problem "Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?". Here is a possible ![SOLUTION](https://stackoverflow.com/questions/44678725/cannot-connect-to-the-docker-daemon-at-unix-var-run-docker-sock-is-the-docker)

* Install the Energy System Description Language [ESDL](https://github.com/ESDLMapEditorESSIM/docker-toolsuite). The installation and configuration procedure is summarized below.

    ```
    mkdir /home/$USER/esdl
    cd /home/$USER/esdl
    git clone https://github.com/ESDLMapEditorESSIM/docker-toolsuite.git
    cd docker-toolsuite/

    # Step 1. Starting the software for the base infrastructure
    cd BaseInfrastructure
    sudo docker compose up

    # Step 2. Import the keycloak settings for the MapEditor
    cd BaseInfrastructure
    sudo docker cp keycloak/esdl-mapeditor-realm.json keycloak:/tmp/esdl-mapeditor-realm.json
    sudo docker compose restart keycloak
    ```

  _ Step 3. Creating user accounts
    _ Using you webbrowser, go to http://localhost:8080 to open keycloak
    

* Install the Anaconda distribution. For more information consult the following ![LINK](https://www.liberiangeek.net/2024/01/install-anaconda-ubuntu-tutorial-for-beginners/)
* Install the following dependencies
  _ ![pyESDL 24.2](https://pypi.org/project/pyESDL/)

    ```
    pip install pyESDL[all]
    ```
  _ 
  _ 


![]()

pip install pyESDL[all]



#https://github.com/EnergyTransition/ESDL-PyEcore-Tutorial/blob/master/ESDLTutorials.ipynb
#https://github.com/redekok/startanalyse-esdl/blob/master/parse_data.py
#https://energytransition.github.io/
#https://github.com/EnergyTransition/ESDL-Geometry-Information
#https://github.com/EnergyTransition/excel-2-esdl
#https://github.com/EnergyTransition/Flask-ESDL-service
#https://github.com/EnergyTransition/shapefile-2-esdl

#https://www.timestamp-converter.com/

https://subscription.packtpub.com/book/hardware+and+creative/9781786466518/1/ch01lvl1sec12/building-a-smart-temperature-controller-for-your-room

https://github.com/ivmech/ivPID/blob/master/PID.py

https://github.com/m-lundberg/simple-pid/blob/master/simple_pid/pid.py

https://github.com/magnusoy/Python-PID/blob/master/src/pid.py

#https://www.geeksforgeeks.org/adding-new-column-to-existing-dataframe-in-pandas/





https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax