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

export forceInstall="$*"

# If the virtuoso user doesn't exist, create it

VIRTUOSO_USER_EXISTS=`grep '^virtuoso:' /etc/passwd`
if [ "$VIRTUOSO_USER_EXISTS" == "" ]; then
	sudo adduser virtuoso
fi

# Install prerequisites
sudo apt-get install autoconf automake libtool flex bison gperf gawk m4 make openssl dh-make bzr-builddeb

# Make sure the Downloads directory exists
if [ ! -d $HOME/Downloads ]; then
	mkdir $HOME/Downloads
fi

# If "force" was specified, delete any existing download

if [ "$forceInstall" == "force" ]; then
	echo "Forcing redownload"
	rm -f $HOME/Downloads/virtuoso-opensource.x86_64-generic_glibc25-linux-gnu.tar.gz
fi

# 
if [ ! -f $HOME/Downloads/virtuoso-opensource.x86_64-generic_glibc25-linux-gnu.tar.gz ]; then
	pushd $HOME/Downloads
	rm -f download
	wget https://sourceforge.net/projects/virtuoso/files/virtuoso/7.2.5/virtuoso-opensource.x86_64-generic_glibc25-linux-gnu.tar.gz/download
	if [ -f download ]; then
		mv download virtuoso-opensource.x86_64-generic_glibc25-linux-gnu.tar.gz
	fi
	popd
fi
if [ -f $HOME/Downloads/virtuoso-opensource.x86_64-generic_glibc25-linux-gnu.tar.gz ]; then
	if [ "$forceInstall" == "force" ]; then
		echo "Removing any existing installation of Virtuoso 7.2.5 ..."
		sudo rm -Rf /opt/virtuoso/7.2.5
	fi
	if [ ! -d /opt/virtuoso ]; then
		sudo mkdir /opt/virtuoso
		sudo chown virtuoso.virtuoso /opt/virtuoso
		sudo chmod 755 /opt/virtuoso
	fi
	if [ ! -d /opt/virtuoso/7.2.5 ]; then
		sudo mkdir /opt/virtuoso/7.2.5
		sudo chown virtuoso.virtuoso /opt/virtuoso/7.2.5
		sudo chmod 755 /opt/virtuoso/7.2.5
		pushd /opt/virtuoso/7.2.5
		sudo tar xvfz $HOME/Downloads/virtuoso-opensource.x86_64-generic_glibc25-linux-gnu.tar.gz
		popd
		sudo chown -R virtuoso.virtuoso /opt/virtuoso/7.2.5
	fi
fi

