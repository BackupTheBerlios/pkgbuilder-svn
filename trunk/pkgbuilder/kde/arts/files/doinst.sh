#!/bin/sh
# Add KDE library directory to /etc/ld.so.conf:
if fgrep "/opt/kde/lib" etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/opt/kde/lib" >> etc/ld.so.conf
fi
