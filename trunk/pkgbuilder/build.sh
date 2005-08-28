#!/bin/sh
#
# Copyright 2003-2005 Antonio G. Muñoz Conejo <tomby (AT) users.berlios.de>
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

usage() {
    echo
    echo "usage: ./build.sh [script] [action]"
    echo
    echo "    general actions: [info|cleanup]"
    echo "    build actions:   [auto|fetch|verify|unpack|patch|configure|build|install|postinstall]"
    echo "    pkg actions:     [buildpkg|installpkg|upgradepkg]"
    echo
    echo "    example: ./build.sh xap/aterm/aterm-0.4.2.build fetch"
}

#config file
source build.rc

#global functions
source scripts/functions.sh
source scripts/pkgfunctions.sh

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

if [ ! -f "$PKG" ] ; then
    echo "pkgbuilder: $PKG script not found"
    exit 1
fi

#where is the package home
PKG_HOME="$PKGBUILDER_HOME/`dirname $PKG`"

#load base build script
include base

#load build script
source $PKG

#execute action
for i in $ACTION ; do
    execute_action $i
    
    RETVAL="$?"
    
    echo "pkgbuilder: $i action result: `result_msg $RETVAL`"
    
    [ $RETVAL -eq 0 ] || break
done

#print result
echo "pkgbuilder: overall result for $PKG: `result_msg $RETVAL`"

exit $RETVAL

