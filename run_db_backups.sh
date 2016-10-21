#!/bin/bash

backupdir="/export/galaxy-central/database/backups"
day=`date +%A`

if [ ! -d $backupdir ]; then
  mkdir -p $backupdir
  chown root:root $backupdir
fi
sudo -u postgres pg_dump --format=t galaxy | gzip > $backupdir/pg_dump_$day.tar.gz
