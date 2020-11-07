# linux-install-scripts
Linux install scripts for the environments I use, broken down by toolkit and product line per platform

I only support Ubuntu VMs and hardware installs at this time; I do not support
WSL1 installations any more. You could use the Ubuntu 20.04 scripts
with WSL2, and treat WSL2 as a VM you connect to with an X11 server under
Windows 10, such as VcXSrv.  That is how I used to run a GUI with WSL1.

Microsoft underestimates the power of Open Source when they let people
think there was no way to run a GUI with WSL1.  I don't think they wanted
it to achieve wide adoption until they had their IDE integration for
debugging their tool chain running clean.  Microsft only supports open
source to the extent it benefits them, but it beats the old days when
they actively fought against it.

Each subdirectory contains the scripts used to initialize the tool chains
required for the bind9, base, gui, java, postgresql, and mysql tool chains.
Python 3 is just an entry in the tool chains.

The base installation installs key non-graphical utilities and libraries
for C/C++ development using a GNU tool chain that supports the c++2a
pre-release implementation of the upcoming C++20 standard editions.  In
the case of Ubuntu 18.04 release based installations, an upgraded GCC 8
installation is required as opposed to the GCC 7 distribution default.


Desktop Display Options

VcXSrv for Windows 10 takes advantage of hardware acceleration and
provides about as full-featured an X-Server as you could ask for.
Performance over an unsecured local connection to my VMs outperforms
the UI performance under the Microsoft V-Sphere virtual consoles,
which don't provide hardware acceleration, but rely on a bitmap
frame buffer display wedge.  The difference is very noticeable, right
down to key presses displaying characters faster.  At 70-80 WPM on my
best days, the Microsoft stack used to lag just enough to be irritating.
Now I effectively have REAL Linux services to work with.

Remoting a desktop via an SSL tunnel is too slow to be usable.

Launching a Gnome console as the startup program with an X11 server
such as VcXSrv performs terribly as well.  I don't know how Gnome
is displaying in that case, but I suspect it is pushing bitmaps of the
entire display as frame buffers.

You can remote X11 desktops and applications easily enough over SSL,
but it requires some messing around with vendor-specific X11 server
setup to be easy to use.  I've added some sample scripts useful for
working with cloud environments in similar fashion, but they require
that your X11 server be running on a named node recognized by the
target server; you would need to know your public DNS name and mapping
to your local VM session in order to somehow do the same with a local
"regular consumer" connection that doesn't have useful public DNS naming.

The best option for remoting a desktop is x11vnc, which provide decent
display performance.  But the problem with that implementation is it requires
an X.org server running on the target machine that it can take over as a 
remote session.  That also means anyone who turns on your monitor at the
other end can see what you're doing moment by moment.  If there is some
way to set up x11vnc to use a *virtual* display that doesn't actually
present itself anywhere except via remoting, then it would be a near
ideal solution for desktop remoting.  Given the popularity of the
package, I'm hoping to find such an option.  I seem to recall a "-start"
option that might be related.
