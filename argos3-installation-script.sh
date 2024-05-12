#!/bin/bash


### Prepare files and directories
echo "Started preparing files"
mkdir argos3-installation
cd argos3-installation
wget "https://iridia.ulb.ac.be/supp/IridiaSupp2019-008/docs/tuttifrutti-software.tar.gz" 
tar -xvf tuttifrutti-software.tar.gz
cd tuttifrutti
git clone https://github.com/ilpincy/argos3.git -b 3.0.0-beta48
mkdir argos3-dist
export ARGOS_INSTALL_PATH=~/argos3-installation/tuttifrutti
echo "Finished preparing files"


### Compile and install locally ARGoS3 v48

echo "Started compiling and installing ARGoS3 V48"
cd argos3
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release -DARGOS_INSTALL_LDSOCONF=OFF ../src
make -j4
make doc
make install
echo "Finished compiling and installing ARGoS3 V48"


### Remove old versions of the e-puck library

echo "Started removing old versions of the e-puck library"
rm -rf $ARGOS_INSTALL_PATH/argos3-dist/include/argos3/plugins/robots/e-puck
rm -rf $ARGOS_INSTALL_PATH/argos3-dist/lib/argos3/lib*epuck*.so
echo "Finished removing old versions of the e-puck library"


### Create enviroment variables

echo "Started creating environment variables"
echo "" >> ~/.bashrc
echo "# Environmental variables for ARGoS3" >> ~/.bashrc
echo "export ARGOS_INSTALL_PATH=~/argos3-installation/tuttifrutti" >> ~/.bashrc
echo "export PKG_CONFIG_PATH=$ARGOS_INSTALL_PATH/argos3-dist/lib/pkgconfig" >> ~/.bashrc
echo "export ARGOS_PLUGIN_PATH=$ARGOS_INSTALL_PATH/argos3-dist/lib/argos3" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$ARGOS_PLUGIN_PATH:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export PATH=$ARGOS_INSTALL_PATH/argos3-dist/bin/:$PATH" >> ~/.bashrc
source ~/.bashrc
echo "Finished creating environment variables"


### Compile and install locally the e-puck libraries v48

echo "Started compiling and installing the e-puck libraries v48"
cd ../../argos3-epuck
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ../src
make -j4
make install
echo "Finished compiling and installing the e-puck libraries v48"


### Compile and install locally the MoCA libraries

echo "Started compiling and installing the MoCA libraries"
cd ../../argos3-arena
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ../src
make -j4
make install
echo "Finished compiling and installing the MoCA libraries"


### Compile and install locally the loop-functions libraries

echo "Started compiling and installing the loop-functions libraries"
cd ../../experiments-loop-functions
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ..
make -j4
make install
echo "Finished compiling and installing the loop-functions libraries"


### Compile and install locally the e-puck DAO libraries

echo "Started compiling and installing the e-puck DAO libraries"
cd ../../demiurge-epuck-dao
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$ARGOS_INSTALL_PATH/argos3-dist -DCMAKE_BUILD_TYPE=Release ..
make -j4
make install
echo "Finished compiling and installing the e-puck DAO libraries"


### Compile AutoMoDe TuttiFrutti

echo "Started compiling AutoMoDe TuttiFrutti"
cd ../../AutoMoDe-tuttifrutti
mkdir build && cd build
cmake ..
make -j4
echo "Finished compiling AutoMoDe TuttiFrutti"


### Final comments and testing

echo ""
echo "If you saw no error during the installation, it means everything went fine"
echo "To test, source the new environment variables:"
echo ""
echo "source ~/.bashrc"
echo ""
echo "Enter to the directory:"
echo ""
echo "cd ~/argos3-installation/tuttifrutti/experiments-loop-functions/scenarios/tuttifrutti"
echo ""
echo "change the paths in the files tuttiAggregation.argos , tuttiStop.argos , tuttiForaging.argos"
echo "Then, run the experiments with the following command"
echo ""
echo "argos3 -c tuttiAggregation.argos"
echo ""
