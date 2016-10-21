#!/bin/bash
export GALAXY_VIRTUAL_ENV=/galaxy_venv
source $GALAXY_VIRTUAL_ENV/bin/activate

script="/galaxy-central/scripts/cleanup_datasets/cleanup_datasets.py"
config="/etc/galaxy/galaxy.ini"
logdir="/usr/local/galaxy-dist/logs"
days=30

if [[ ! -d $logdir ]]; then
    mkdir -p $logdir
fi

for num in {1..6}; do
  sudo -u galaxy $script $config -d $days -$num >> $logs/cleanup$num.log
done
