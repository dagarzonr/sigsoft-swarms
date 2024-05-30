# Swarm Robotics
2024 ACM SIGSOFT Summer School on Software Engineering for Robotics

## Requirements

Ubuntu 20.04 Focal Fossa (or Ubuntu 22.04 Jammy Jellyfish, experimental)

If you are use **Ubuntu 20.04**, install the following dependencies and required packages:

```
sudo apt-get install git cmake libfreeimage-dev libfreeimageplus-dev qt5-default freeglut3-dev libxi-dev libxmu-dev liblua5.2-dev lua5.2 doxygen graphviz graphviz-dev asciidoc npm
```

If you are use **Ubuntu 22.04**, install the following dependencies and required packages:

```
sudo apt-get install git cmake libfreeimage-dev libfreeimageplus-dev libqt6opengl6-dev freeglut3-dev libxi-dev libxmu-dev liblua5.2-dev lua5.2 doxygen graphviz graphviz-dev asciidoc npm
```

## Installation instructions

Clone this repository in $HOME:

```
cd ~
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

## References

If you found this repo useful, check out the related papers!

1. D. Garzón Ramos and M. Birattari (2020). “Automatic design of collective behaviors for robots that can display and perceive colors”. In: Applied Sciences 10.13, p. 4654. DOi: 10.3390/app10134654

2. D. Garzón Ramos, F. Pagnozzi, T. Stützle, and M. Birattari (2024). “Automatic design of robot swarms under concurrent design criteria: a study based on Iterated F-Race”. 

3. J. Kuckling, K. Hasselmann, V. Van Pelt, C. Kiere, and Mauro Birattari (2021). AutoMoDe Editor: a visualization tool for AutoMoDe. Technical Report TR/IRIDIA/2021-009, IRIDIA, Universit´e Libre de Bruxelles, Brussels, Belgium.

4. C. Pinciroli, V. Trianni, R. O’Grady, G. Pini, A. Brutschy, M. Brambilla, N. Mathews, E. Ferrante, G. A. Di Caro, F. Ducatelle, M. Birattari, L. M. Gambardella, and M. Dorigo (2012). ARGoS: a modular, parallel, multi-engine simulator for multi-robot systems. In: Swarm Intelligence 6.4. p. 271–295. DOi: 10.1007/s11721-012-0072-5.

## Contact

David Garzón Ramos
Research Associate - University of Bristol
<david.garzonramos@bristol.ac.uk>