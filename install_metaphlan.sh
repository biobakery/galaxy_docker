#!/bin/bash
cd /galaxy-central/tools
git clone https://github.com/biobakery/metaphlan2.git
git clone https://github.com/biobakery/galaxy_metaphlan2.git
cp galaxy_metaphlan2/metaphlan2.xml metaphlan2
chown -Rf galaxy:galaxy /galaxy-central/tools /galaxy-central/lib