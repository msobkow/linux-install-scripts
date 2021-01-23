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

# Install prerequisites
sudo apt-get install autoconf automake libtool flex bison gperf gawk m4 make openssl dh-make bzr-builddeb

#virtuoso-minimal - high-performance database - core dependency package

sudo apt-get install virtuoso-opensource virtuoso-opensource-6.1 virtuoso-opensource-6.1-bin virtuoso-opensource-6.1-common virtuoso-vad-bpel virtuoso-vad-conductor virtuoso-vad-demo virtuoso-vad-doc virtuoso-vad-isparql virtuoso-vad-ods virtuoso-vad-rdfmappers virtuoso-vad-sparqldemo virtuoso-vad-syncml virtuoso-vad-tutorial virtuoso-vsp-startpage

