#!/bin/sh
# Add GNOME library directory to /etc/ld.so.conf:
if fgrep "/opt/gnome/lib" etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/opt/gnome/lib" >> etc/ld.so.conf
fi
