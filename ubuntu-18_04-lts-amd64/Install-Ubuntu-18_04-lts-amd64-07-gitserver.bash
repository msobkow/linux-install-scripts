#!/bin/bash
#	linux-install-scripts
#
#	Packages required to build and install virtuoso-opensource
#
sudo apt-get install git-core

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

