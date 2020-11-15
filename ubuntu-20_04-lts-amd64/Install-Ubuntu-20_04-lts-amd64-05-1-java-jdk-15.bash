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
#	WARNING: The extraction depends on the location of your JDK 15.0.1
#	download directory, and on whether or not I had to rename the extracted
#	directory before making the rest of my symlinks and such.  I don't think
#	the original extract identifies the JDK quite in normal Ubuntu-format
#	fashion.
#
if [ ! -d /usr/lib/jvm/openjdk-15.0.1-openjdk-amd64 ]; then
	sudo '( cd /usr/lib/jvm && tar xfz ~msobkow/Downloads/jdk.java.net/15/openjdk-15.0.1_linux-x64_bin.tar.gz )'
sudo ln -s /usr/lib/jvm/java-15.0.1-openjdk-amd64 /usr/lib/jvm/openjdk-15
	sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/openjdk-15/bin/java 1500
fi
#
echo "Please make sure you select openjdk-15 from the options as the default system JDK/VM"
sudo update-alternatives --config java
#
ENV_VAR_FOUND=`grep "JSEP=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JSEP=":"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
fi

ENV_VAR_FOUND=`grep "JAVA=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JAVA="java"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
fi

ENV_VAR_FOUND=`grep "JAVAC=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JAVAC="javac"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
fi

ENV_VAR_FOUND=`grep "JAVA_HOME=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JAVA_HOME="/usr/lib/jvm/java-15.0.1-openjdk-amd64"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
else
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo '1,$s:^JAVA_HOME=.*$:JAVA_HOME="/usr/lib/jvm/java-15.0.1-openjdk-amd64:g"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
fi

ENV_VAR_FOUND=`grep "JDK_HOME=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JDK_HOME="/usr/lib/jvm/java-15.0.1-openjdk-amd64"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
else
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo '1,$s:^JDK_HOME=.*$:JDK_HOME="/usr/lib/jvm/java-15.0.1-openjdk-amd64:g"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
fi

ENV_VAR_FOUND=`grep "JAVA_CMD=" /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JAVA_CMD="/usr/lib/jvm/java-15.0.1-openjdk-amd64/bin/java"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
else
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo '1,$s:^JAVA_CMD=.*$:JAVA_CMD="/usr/lib/jvm/java-15.0.1-openjdk-amd64/bin/java:g"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
fi
rm -f add-to-env.ex 

ENV_PATH_CONTAINS_JDK_HOME_BIN=`grep "PATH=" /etc/environment | grep "/usr/lib/jvm/java-15.0.1-openjdk-amd64/bin"`
if [ "$ENV_PATH_CONTAINS_JDK_HOME_BIN" == "" ]; then
	echo '1,$s,^PATH=.*$,PATH="/usr/local/sbin:/usr/local/bin:/usr/lib/jvm/java-15.0.1-openjdk-amd64/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin",g' >update-env-path.ex
	echo 'w' >>update-env-path.ex
	echo 'q' >>update-env-path.ex
	echo '' >>update-env-path.ex
	sudo ex /etc/environment <update-env-path.ex
	rm -f update-env-path.ex
fi
unset ENV_PATH_CONTAINS_JDK_HOME_BIN

ENV_JAVACMD_IS_CORRECT=`grep "JAVACMD=" /etc/environment | grep "/usr/lib/jvm/java-15.0.1-openjdk-amd64/bin/java"`
if [ "$ENV_JAVACMD_IS_CORRECT" == "" ]; then
	echo '1,$s,^JAVACMD=.*$,JAVACMD="/usr/lib/jvm/java-15.0.1-openjdk-amd64/bin/java",' >update-env-javacmd.ex
	echo 'w' >>update-env-javacmd.ex
	echo 'q' >>update-env-javacmd.ex
	echo '' >>update-env-javacmd.ex
	sudo ex /etc/environment <update-env-javacmd.ex
	rm -f update-env-javacmd.ex
fi
unset ENV_JAVACMD_IS_CORRECT

echo "WARNING: /etc/environment has been changed, you'll need to log out and back in again for the changes to take effect"
