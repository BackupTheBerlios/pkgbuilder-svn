#!/bin/csh
# Environment path variables for the Qt package:
setenv QTDIR /usr/lib/qt

set path = ( $path $QTDIR/bin )

if ( $?CPLUS_INCLUDE_PATH ) then
    setenv CPLUS_INCLUDE_PATH $QTDIR/include:$CPLUS_INCLUDE_PATH
else
    setenv CPLUS_INCLUDE_PATH $QTDIR/include
endif

setenv MANPATH ${MANPATH}:$QTDIR/doc/man
