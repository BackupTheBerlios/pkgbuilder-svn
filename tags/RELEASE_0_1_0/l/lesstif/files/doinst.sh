#!/bin/sh
# Add the LessTif stuff to host.def if it isn't already there:
if [ -r usr/X11R6/lib/X11/config/host.def ]; then
  if ! grep LessTif usr/X11R6/lib/X11/config/host.def 1> /dev/null 2> /dev/null ; then
    cat usr/X11R6/lib/X11/config/host.def-lesstif >> usr/X11R6/lib/X11/config/host.def
  fi
else
  cat usr/X11R6/lib/X11/config/host.def-lesstif >> usr/X11R6/lib/X11/config/host.def
fi
# Standard symlink creation section begins:
