#!/bin/bash
cd /galaxy-central/tools
git clone git://github.com/picrust/picrust.git picrust
git clone https://github.com/biobakery/picrust-cmd.git
git clone https://github.com/biobakery/galaxy_picrust
cp /galaxy-central/tools/galaxy_picrust/*.xml /galaxy-central/tools/picrust
cd /galaxy-central/tools/picrust/data
wget ftp://ftp.microbio.me/pub/picrust-references/picrust-1.0.0/16S_13_5_precalculated.tab.gz
wget ftp://ftp.microbio.me/pub/picrust-references/picrust-1.0.0/ko_13_5_precalculated.tab.gz
cd /galaxy-central/tools/picrust
python setup.py install
chown -Rf galaxy:galaxy /galaxy-central/tools /galaxy-central/lib