#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/build.sh,v 1.3 2003/11/08 16:55:24 tomby Exp $
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

#script to execute
if [ "$1" = "" ] ; then
    usage
    exit 1
fi

#where is the package home
PKG_HOME=$PKGBUILDER_HOME/`echo $1 | cut -d/ -f1`/`echo $1 | cut -d/ -f2`

#the build script
source $1

#action to execute
ACTION="auto"

if [ "$2" != "" ] ; then
    ACTION=$2
fi

#temporal directory defined?
if [ "$TMP" = "" ]; then
  TMP="/tmp"
fi

#create temporal directory if not exist
if [ ! -d $TMP ]; then
  mkdir -p $TMP
fi

#create package directory if not exist
if [ ! -d $PKG_DEST ]; then
  mkdir -p $PKG_DEST
fi

RETVAL="0"

#execution
case "$ACTION" in
    'info')
        do_info
        RETVAL="$?"
    ;;
    'fetch')
        do_fetch
    ;;
    'unpack')
        do_unpack
        RETVAL="$?"
    ;;
    'patch')
        do_patch
    ;;
    'configure')
        do_configure
        RETVAL="$?"
    ;;
    'build')
        do_build
        RETVAL="$?"
    ;;
    'install')
        do_install
        RETVAL="$?"
    ;;
    'postinstall')
        do_postinstall
        RETVAL="$?"
    ;;
    'buildpkg')
        do_buildpkg
        RETVAL="$?"
    ;;
    'installpkg')
        do_installpkg
        RETVAL="$?"
    ;;
    'upgradepkg')
        do_upgradepkg
        RETVAL="$?"
    ;;
    'cleanup')
        do_cleanup
        RETVAL="$?"
    ;;
    'auto')
        do_fetch && 
        do_unpack &&
        do_patch && 
        do_configure &&
        do_build &&
        do_install &&  
        do_postinstall && 
        do_buildpkg
        RETVAL="$?"
    ;;
    'help')
        usage
    ;;
    *)
        echo "pkgbuilder: unrecognized action"
        exit 1
esac

#print result
echo

if [ $RETVAL ] ; then
    echo "pkgbuilder: $ACTION for $1 result: SUCCESS"
else
    echo "pkgbuilder: $ACTION for $1 result: ERROR"
fi

