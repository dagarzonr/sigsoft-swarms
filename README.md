# Swarm Robotics
2024 ACM SIGSOFT Summer School on Software Engineering for Robotics

## Requirements

Ubuntu 20.04 Focal Fossa

## Installation instructions

Install the dependencies and required packages:

```
sudo apt-get install git cmake libfreeimage-dev libfreeimageplus-dev qt5-default freeglut3-dev libxi-dev libxmu-dev liblua5.2-dev lua5.2 doxygen graphviz graphviz-dev asciidoc npm
```

Clone this repository in $HOME:

```
git clone https://github.com/dagarzonr/sigsoft-swarms.git
```

Enter the work directory and source the relevant environmental variables:

```
cd ~/sigsoft-swarms
source argos3-env.sh
```

Clone, compile and locallt install the ARGoS3 simulator:

```
cd ~/sigsoft-swarms
mkdir argos3-dist
cd ~/sigsoft-swarms/argos3-installation
git clone https://github.com/ilpincy/argos3.git -b 3.0.0-beta48
cd ~/sigsoft-swarms/argos3-installation/argos3
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release -DARGOS_INSTALL_LDSOCONF=OFF ../src
make -j4
make doc
make install
```

Remove the legacy versions of the e-puck library

```
rm -rf $ARGOS_INSTALL_PATH/argos3-dist/include/argos3/plugins/robots/e-puck
rm -rf $ARGOS_INSTALL_PATH/argos3-dist/lib/argos3/lib*epuck*.so
```

Compile and install locally the e-puck libraries v48

```
cd ~/sigsoft-swarms/argos3-installation/argos3-epuck
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ../src
make -j4
make install
```

Compile and install locally the MoCA libraries

```
cd ~/sigsoft-swarms/argos3-installation/argos3-arena
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ../src
make -j4
make install
```

Compile and install locally the loop-functions libraries

```
cd ~/sigsoft-swarms/argos3-installation/experiments-loop-functions
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ..
make -j4
make install
```

Compile and install locally the e-puck DAO libraries

```
cd ~/sigsoft-swarms/argos3-installation/demiurge-epuck-dao
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ..
make -j4
make install
```

Compile AutoMoDe TuttiFrutti

```
cd ~/sigsoft-swarms/argos3-installation/AutoMoDe-tuttifrutti
mkdir build && cd build
cmake ..
make -j4
```

Install AutoMoDe-Editor to graphically design FSM

```
cd ~/sigsoft-swarms/automode-editor
npm install
```

## Running experiments

Enter the work directory and source the relevant environmental variables:

```
cd ~/sigsoft-swarms
source argos3-env.sh
```

Run an experiment by executing the following script. Replace ID by the number of the mission you want to test, between 1 and 21:

```
bash start_experiment.sh ID
```

Open a browser and search for the following URL:

```
http://localhost:8088
```

This will spawn an interface that allows to create Finite State Machines to program the robots and run simulations in ARGoS3. More information on the editor is available at

```
https://demiurge.be/publications/pdf_author_versions/KucHasVan-etal2021techrep.pdf
```
