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
sudo apt-get install openjdk-14-jdk
sudo update-alternatives --config java
ENV_VAR_FOUND=`grep JSEP /etc/environment`
if [ "$ENV_VAR_FOUND" == "" ]; then
	echo '$' >add-to-env.ex
	echo 'a' >>add-to-env.ex
	echo 'JSEP=":"' >>add-to-env.ex
	echo 'JAVA="java"' >>add-to-env.ex
	echo 'JAVA_HOME="/usr/lib/jvm/java-14-openjdk-amd64"' >>add-to-env.ex
	echo 'JDK_HOME="/usr/lib/jvm/java-14-openjdk-amd64"' >>add-to-env.ex
	echo 'JAVAC="javac"' >>add-to-env.ex
	echo 'JAVACMD="/usr/lib/jvm/java-14-openjdk-amd64/java"' >>add-to-env.ex
	echo '.' >>add-to-env.ex
	echo 'w' >>add-to-env.ex
	echo 'q' >>add-to-env.ex
	echo '' >>add-to-env.ex
	sudo ex /etc/environment <add-to-env.ex
	rm -f add-to-env.ex 
fi

