#!/bin/sh
# Environment variables for the Qt package:
QTDIR=/usr/lib/qt

if [ ! "$CPLUS_INCLUDE_PATH" = "" ]; then
  CPLUS_INCLUDE_PATH=$QTDIR/include:$CPLUS_INCLUDE_PATH
else
  CPLUS_INCLUDE_PATH=$QTDIR/include
fi

MANPATH="$MANPATH:$QTDIR/doc/man"
PATH="$PATH:$QTDIR/bin"

export QTDIR
export CPLUS_INCLUDE_PATH
export MANPATH
