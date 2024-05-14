#!/bin/bash

if [ -z "$1" ]
  then
    echo "No mission ID supplied. Please try again with a number between 1 and 21:"
    echo "bash start_experiment.sh ID" 
  else
    MISSION=$1
    cd ~/sigsoft-swarms/automode-editor
    echo "AUTOMODE_PATH=$HOME/sigsoft-swarms/argos3-installation/AutoMoDe-tuttifrutti/bin/automode_main" > .env
    echo "EXPERIMENT_PATH=$HOME/sigsoft-swarms/experiments/m-$MISSION.argos" >> .env
    echo ""
    echo ""
    echo "Started experiment $MISSION"
    echo ""
    echo "Please open a browser in the following URL"
    echo ""
    echo "http://localhost:8080/"
    echo ""
    echo ""
    echo ""
    npm start 
fi

echo "Experiment $MISSION ended"


