#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/build.sh,v 1.7 2003/11/15 18:22:38 tomby Exp $
#
# Copyright (C) 2003 Antonio G. Muñoz Conejo <tomby (AT) tomby.homelinux.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# General script to build and create new packages
#

#config file
source build.rc

#global functions
source scripts/functions.sh

#print version number
version

#package to build
PKG="$1"

#actions to execute
shift
ACTION="$@"

#verify script to execute
if [ "$PKG" == "" -o "$PKG" == "help" ] ; then
    usage
    exit 1
fi

#verify actions to execute
if [ "$ACTION" == "" ] ; then
    ACTION="auto"
fi

#temporal directory defined?
if [ "$TMP" = "" ]; then
    TMP="/tmp"
fi

#create temporal directory if not exist
if [ ! -d $TMP ]; then
    mkdir -p $TMP
fi

#build script included
source $PKG

#where is the package home
PKG_HOME="$PKGBUILDER_HOME/`dirname $PKG`"

#execute action
for i in $ACTION ; do
    execute_action $i
    
    RETVAL="$?"
    
    echo "pkgbuilder: $i action result: $RETVAL"
    
    [ $RETVAL -eq 0 ] || break
done

#print result
if [ $RETVAL -eq 0 ] ; then
    echo "pkgbuilder: overall result for $PKG: SUCCESS"
else    
    echo "pkgbuilder: overall result for $PKG: ERROR"
fi

exit $RETVAL

