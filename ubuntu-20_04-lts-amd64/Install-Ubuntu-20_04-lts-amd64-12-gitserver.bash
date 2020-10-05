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
#sudo apt-get install git-core

HAS_GIT_USER=`grep '^git:' /etc/passwd`
if [ "$HAS_GIT_USER" == "" ]; then
	echo "adding git user"
	sudo adduser git
else
	echo "git user already exists"
fi
unset HAS_GET_USER

if [ ! -d /srv/git ]; then
	echo "creating /srv/git repository area"
	sudo mkdir /srv/git
	sudo chown git.git /srv/git
	sudo chmod 775 /srv/git
else
	echo "git repository at /srv/git already exists"
fi

