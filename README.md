# linux-install-scripts
Linux install scripts for the environments I use, broken down by toolkit and product line per platform

Each subdirectory contains the scripts used to initialize the tool chains
required for the base, gui, java, postgresql, and mysql tool chains.  Python 3
is just an entry in the tool chains.  The base installation installs key non-graphical
utilities and libraries for C/C++ development using a GNU tool chain that supports
the c++2a pre-release implementation of the upcoming C++20 standard editions.  In the case
of Ubuntu 18.04 release based installations, an upgraded GCC installation is required as
opposed to the distribution default.

The WSL tool chains use a minimal xfce4 GUI instead of a full Gnome stack, because Gnome won't
run under WSL-1 installations, only WSL-2 installations, and I don't want to maintain two
seperate sets.  For WSL-2 installations, you can use the ubuntu* installation scripts. WSL-1
environments should use the wsl-ubuntu* installation scripts.
