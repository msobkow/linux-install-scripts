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
sudo apt-get install git aptitude synaptic ssh zip unzip bzip2 gzip unrar lzip lrzip p7zip-rar rar dpkg dpkg-dev apt libc-bin libc-dev-bin linux-libc-dev dh-make gnu-standards autoconf automake autoconf-archive autoconf-doc libtool libtool-doc g++-multilib gdb gdb-doc libxerces-c-dev libxerces-c-doc libxerces-c3.2 libdb1-compat uuid uuid-dev libmpfr-dev gmp-doc libmpfr-doc libmpfrc++-dev devscripts bash findutils libssl-dev libssl-doc gnupg2 gnupg-agent libcap-ng0 libcap2 libcap2-bin libpam-cap libpthread-stubs0-dev vim-common manpages manpages-dev gcc autotools-dev make libapr1-dev libaprutil1-dev cmake doxygen binutils-doc cmake-doc cpp-doc gcc-8-locales debtags autopkgtest gcc-8-doc lib32stdc++6-8-dbg libx32stdc++6-8-dbg flex bison gcc-doc gettext-doc bzr libgmp10-doc icu-doc libcrypt-ssleay-perl libstdc++-8-doc devhelp binutils-multiarch m4-doc make-doc gettext texlive-binaries docbook-xsl-doc-html docbook-xsl-doc-pdf docbook-xsl-doc-text docbook-xsl-saxon libxml-libxml-perl libfile-fcntllock-perl libmime-tools-perl libtext-autoformat-perl libmojolicious-perl libunicode-map8-perl libunicode-string-perl libxml-sax-expatxs-perl libdbi-perl libencode-detect-perl libnet-patricia-perl libbsd-resource-perl libmldbm-perl libnet-daemon-perl weblint-perl libtest-fatal-perl geotiff-bin gdal-bin gmpc tree aspell-doc spellutils libxml-libxml-perl libhwloc-contrib-plugins libfile-fcntllock-perl libmime-tools-perl libtext-autoformat-perl libmojolicious-perl libparted-dev libunicode-map8-perl libunicode-string-perl fancontrol read-edid i2c-tools exfat-utils f2fs-tools setserial ir-keytable cifs-utils tcl-tclreadline psutils uuid-dev libmpfr-dev libxerces-c-dev sysstat valgrind valgrind-dbg samba smbclient ssh-askpass csh dnsutils

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8
