# Environmental variables for ARGoS3
export ARGOS_INSTALL_PATH=~/sigsoft-swarms/argos3-installation
export PKG_CONFIG_PATH=$ARGOS_INSTALL_PATH/argos3-dist/lib/pkgconfig
export ARGOS_PLUGIN_PATH=$ARGOS_INSTALL_PATH/argos3-dist/lib/argos3
export LD_LIBRARY_PATH=$ARGOS_PLUGIN_PATH:$LD_LIBRARY_PATH
export PATH=$ARGOS_INSTALL_PATH/argos3-dist/bin/:$PATH
