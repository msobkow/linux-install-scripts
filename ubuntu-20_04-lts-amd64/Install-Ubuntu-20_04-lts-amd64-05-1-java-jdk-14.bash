#!/bin/bash
#	linux-install-scripts
#
#	Copyright 2020-2021 Mark Stephen Sobkow mark.sobkow@gmail.com
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
sudo apt-get install openjdk-14-jdk
sudo update-alternatives --config java
CHANGE_PROMPTED="n"
ENV_VAR_FOUND=`grep "JSEP=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JSEP=":"' >>add-to-env.ex
	echo 'JAVA="java"' >>add-to-env.ex
	echo 'JAVA_HOME="/usr/lib/jvm/java-14-openjdk-amd64"' >>add-to-env.ex
	echo 'JDK_HOME="/usr/lib/jvm/java-14-openjdk-amd64"' >>add-to-env.ex
	echo 'JAVAC="javac"' >>add-to-env.ex
	echo 'JAVACMD="/usr/lib/jvm/java-14-openjdk-amd64/bin/java"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
	rm -f add-to-env.ex 
	if [ "$CHANGE_PROMPTED" != "y" ]; then
		echo "WARNING: /etc/environment has been changed, you'll need to log out and back in again for the changes to take effect" && CHANGE_PROMPTED="y"
	fi
fi

ENV_PATH_CONTAINS_JDK_HOME_BIN=`grep "PATH=" /etc/environment | grep "/usr/lib/jvm/java-14-openjdk-amd64/bin"`
if [ "$ENV_PATH_CONTAINS_JDK_HOME_BIN" == "" ]; then
	echo '1,$s,^PATH=.*$,PATH="/usr/local/sbin:/usr/local/bin:/usr/lib/jvm/java-14-openjdk-amd64/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin",g' >update-env-path.ex
	echo 'w' >>update-env-path.ex
	echo 'q' >>update-env-path.ex
	echo '' >>update-env-path.ex
	sudo ex /etc/environment <update-env-path.ex
	rm -f update-env-path.ex
	if [ "$CHANGE_PROMPTED" != "y" ]; then
		echo "WARNING: /etc/environment has been changed, you'll need to log out and back in again for the changes to take effect" && CHANGE_PROMPTED="y"
	fi
fi
unset ENV_PATH_CONTAINS_JDK_HOME_BIN

ENV_JAVACMD_IS_CORRECT=`grep "JAVACMD=" /etc/environment | grep "/usr/lib/jvm/java-14-openjdk-amd64/bin/java"`
if [ "$ENV_JAVACMD_IS_CORRECT" == "" ]; then
	echo '1,$s,^JAVACMD=.*$,JAVACMD="/usr/lib/jvm/java-14-openjdk-amd64/bin/java",' >update-env-javacmd.ex
	echo 'w' >>update-env-javacmd.ex
	echo 'q' >>update-env-javacmd.ex
	echo '' >>update-env-javacmd.ex
	sudo ex /etc/environment <update-env-javacmd.ex
	rm -f update-env-javacmd.ex
	if [ "$CHANGE_PROMPTED" != "y" ]; then
		echo "WARNING: /etc/environment has been changed, you'll need to log out and back in again for the changes to take effect" && CHANGE_PROMPTED="y"
	fi
fi
unset ENV_JAVACMD_IS_CORRECT

unset CHANGE_PROMPTED
