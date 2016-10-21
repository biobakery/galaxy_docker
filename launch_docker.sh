#!/bin/bash

sudo docker run --net bridge -m 0b \
       -e NONUSE=nodejs,proftp,reports,slurmd,slurmctld,docker \
       -e ENABLE_TTS_INSTALL=True \
       -e GALAXY_LOGGING=full \
       -e GALAXY_CONFIG_MASTER_API_KEY=b875b6690e015705ae456ff47d2110e3c9e1eca80dd97af5 \
       -e GALAXY_CONFIG_INTEGRATED_TOOL_PANEL_CONFIG=/export/galaxy-central/integrated_tool_panel.xml \
       -e GALAXY_CONFIG_JOB_CONFIG_FILE=/export/galaxy-central/config/job_conf.xml \
       -e GALAXY_CONFIG_BRAND=Hutlab \
       -e UWSGI_PROCESSES=4 \
       -e UWSGI_THREADS=4 \
       -e GALAXY_HANDLER_NUMPROCS=1 \
       -e GALAXY_VIRTUALENV=/export/galaxy-central/venv \
       -e GALAXY_CONFIG_ENABLE_QUOTAS=True \
       -e "GALAXY_CONFIG_ADMIN_USERS=admin@galaxy.org,chuttenh@hsph.harvard.edu,schwager@hsph.harvard.edu,george.weingart@gmail.com,simonychang.hutlab@gmail.com" \
       -p 80:80 \
       -p 9002:9002 \
       -v /usr/local/galaxy-dist/:/export/ \
       -v /var/localgalaxy/:/var/localgalaxy \
       --restart=always \
       --privileged=true \
       --cpu-shares 512 \
       --name galaxy \
       b9633f8348ea
