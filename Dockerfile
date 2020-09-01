# galaxy for hutlab

FROM bgruening/galaxy-stable

MAINTAINER biobakery, hutlab@googlegroups.com

ENV GALAXY_CONFIG_BRAND Hutlab

WORKDIR /galaxy-central

COPY ./job_conf.xml /galaxy-central/config/job_conf.xml
COPY ./install_galaxy_python_deps.sh /galaxy-central/install_galaxy_python_deps.sh
COPY ./install.R /galaxy-central/install.R
COPY ./dependency_resolvers_conf.xml /galaxy-central/config/dependency_resolvers_conf.xml
COPY ./integrated_tool_panel.xml.lefse_fixed_order /galaxy-central/integrated_tool_panel.xml.lefse_fixed_order
COPY ./welcome.html $GALAXY_CONFIG_DIR/web/welcome.html
COPY ./datatypes_conf.xml /galaxy-central/config/datatypes_conf.xml
COPY ./tool_conf.xml /galaxy-central/config/tool_conf.xml
COPY ./install_tools.sh /usr/local/bin/install_tools.sh
COPY ./run_cron.sh /usr/local/bin/run_cron.sh
COPY ./run_db_backups.sh /usr/local/bin/run_db_backups.sh
COPY ./crontab /etc/cron.d/galaxy

RUN    apt-get update -qq 
RUN    apt-get upgrade -y 
RUN    sudo -H -u galaxy /galaxy-central/install_galaxy_python_deps.sh 
RUN    chmod +x /usr/bin/startup 
RUN    chmod +x /usr/local/bin/install_tools.sh 
RUN    chmod g-w /var/log 
RUN    ln -s /galaxy-central /usr/local/galaxy-dist 
RUN    chmod +x /usr/bin/startup /usr/local/bin/install_* 
RUN    chmod g-w /var/log 
RUN    ln -s /galaxy-central /usr/local/galaxy-dist 
RUN    touch galaxy_install.log && chown galaxy:galaxy galaxy_install.log 
RUN    add-tool-shed --u 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed' && sleep 5 

# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]