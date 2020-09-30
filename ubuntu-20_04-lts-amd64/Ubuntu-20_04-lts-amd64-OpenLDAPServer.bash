#!/bin/bash
./Install-Ubuntu-20_04-lts-amd64-01-base.bash
./Install-Ubuntu-20_04-lts-amd64-02-gui.bash
# Invoked by the openldap-srv setup
#./Install-Ubuntu-20_04-lts-amd64-15-openldap-dev.bash 
./Install-Ubuntu-20_04-lts-amd64-openldap-srv.bash
