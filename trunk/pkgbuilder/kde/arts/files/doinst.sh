#!/bin/sh
# Add KDE library directory to /etc/ld.so.conf:
if fgrep "/opt/kde-3.2/lib" etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/opt/kde-3.2/lib" >> etc/ld.so.conf
fi
