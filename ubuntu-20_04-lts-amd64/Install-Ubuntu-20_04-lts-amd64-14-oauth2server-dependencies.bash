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
sudo apt-get install sqlite3 liboath0 libconfig9 libjansson4 libcurl3-gnutls libldap-2.4-2 libmicrohttpd12 libsqlite3-0 libpq5 default-mysql-client zlib1g libcbor0 pkg-config sqlite3-doc libmicrohttpd-dev libsqlite3-dev default-libmysqlclient-dev libpq-dev libgnutls28-dev libconfig-dev libldap2-dev liboath-dev libcbor-dev libsystemd-dev libjansson-dev libcurl4-gnutls-dev cmake

#
#	Do source builds instead of installing the broken 20.04.1 packages
#
#sudo apt-get install glewlwyd glewlwyd-common
