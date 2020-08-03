#!/bin/bash
cd /galaxy-central/tools
git clone https://github.com/biobakery/graphlan.git
git clone https://github.com/biobakery/galaxy_graphlan.git
cp -r graphlan/pyphlan /galaxy-central/lib/
cp -r galaxy_graphlan/* graphlan/
chown -Rf galaxy:galaxy /galaxy-central/tools /galaxy-central/lib
