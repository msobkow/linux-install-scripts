#!/bin/bash
#	linux-install-scripts
#
#	Copyright 2020 Mark Stephen Sobkow msobkow@sasktel.net
#
#		Licensed under the Apache License, Version 2.0 (the "License");
#		you may not use this file except in compliance with the License.
#		You may obtain a copy of the License at
#
#		http://www.apache.org/licenses/LICENSE-2.0
#
#		Unless required by applicable law or agreed to in writing, software
#		distributed under the License is distributed on an "AS IS" BASIS,
#		WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#		See the License for the specific language governing permissions and
#		limitations under the License.
#
./Install-Ubuntu-20_04-lts-amd64-01-base.bash
./Install-Ubuntu-20_04-lts-amd64-02-gui.bash
# Invoked by the openldap-srv setup
#./Install-Ubuntu-20_04-lts-amd64-15-openldap-dev.bash 
./Install-Ubuntu-20_04-lts-amd64-openldap-srv.bash
