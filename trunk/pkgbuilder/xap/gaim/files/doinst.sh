#!/bin/sh
if fgrep "/usr/lib/mozilla-1.4" etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/usr/lib/mozilla-1.4" >> etc/ld.so.conf
fi
