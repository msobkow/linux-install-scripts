# linux-install-scripts
Linux install scripts for the environments I use, broken down by toolkit and product line per platform

I only support Ubuntu VMs and hardware installs at this time; I do not support WSL1 installations any more.

Each subdirectory contains the scripts used to initialize the tool chains
required for the bind9, base, gui, java, postgresql, and mysql tool chains.
Python 3 is just an entry in the tool chains.

The base installation installs key non-graphical utilities and libraries
for C/C++ development using a GNU tool chain that supports the c++2a
pre-release implementation of the upcoming C++20 standard editions.  In
the case of Ubuntu 18.04 release based installations, an upgraded GCC 8
installation is required as opposed to the GCC 7 distribution default.
