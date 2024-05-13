# Swarm Robotics
ACM SIGSOFT Summer School on Software Engineering for Robotics in Brussels

## Requirements

Ubuntu 20.04 Focal Fossa

## Installation instructions

To start, let's check we meet all dependencies:

```
sudo apt-get install git cmake libfreeimage-dev libfreeimageplus-dev qt5-default freeglut3-dev libxi-dev libxmu-dev liblua5.2-dev lua5.2 doxygen graphviz graphviz-dev asciidoc npm
```

Then, clone this repository in $HOME:

```
git clone https://github.com/dagarzonr/sigsoft-swarms.git
```

Enter the directory and source the relevant environmental variables:

```
cd ~/sigsoft-swarms
source argos3-env.sh
```

Compiling and installing the ARGoS3 simulator:

```
cd ~/sigsoft-swarms
mkdir argos3-dist
cd argos3
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release -DARGOS_INSTALL_LDSOCONF=OFF ../src
make -j4
make doc
make install
```

Remove legacy versions of the e-puck library

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

## Final comments and testing

If you saw no error during the installation, it means everything went fine
To test, enter to the directory:

```
cd ~/argos3-installation/tuttifrutti/experiments-loop-functions/scenarios/tuttifrutti
```

change the paths in the files tuttiAggregation.argos , tuttiStop.argos , tuttiForaging.argos
Then, run the experiments with the following command

```
argos3 -c tuttiAggregation.argos
```




