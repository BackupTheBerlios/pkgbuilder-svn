#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/install.sh,v 1.1 2003/11/15 18:22:38 tomby Exp $
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
# Install a package resolving dependencies

#config file
source build.rc

#global functions
source scripts/functions.sh

#package to build
PKG="$1"

#verify script to execute
if [ "$PKG" == "" -o "$PKG" == "help" ] ; then
    echo "tas equivocao"
    exit 1
fi

#the build script
source $PKG

echo "PKG_DEPENDS=\"$PKG_DEPENDS\""

#resolving dependencies
for i in $PKG_DEPENDS ; do
    #metapkg
    DEP_METAPKG=`expr match "$i" '>\?=\([a-z]\+\)/'`

    #pkg
    DEP_PKG_NAME=`expr match "$i" '>\?=[a-z]\+/\([a-zA-Z0-9_\-]\+\)\-[0-9]\+'`

    #version
    DEP_PKG_VERSION=`expr match "$i" '>\?=\?[a-z]\+/[a-zA-Z0-9_\-]\+\-\([0-9a-z\.]\+\)'`

    if [ `echo $i | grep "^="` ] ; then
        BUILD_SCRIPT=$DEP_METAPKG/$DEP_PKG_NAME/$DEP_PKG_NAME-$DEP_PKG_VERSION.build
    elif [ `echo $i | grep "^>="` ] ; then
        #TODO: determine last version
        
        BUILD_SCRIPT=$DEP_METAPKG/$DEP_PKG_NAME/$DEP_PKG_NAME-$DEP_PKG_VERSION.build
    fi
    
    ( cd $PKGBUILDER_HOME ; ./install.sh $BUILD_SCRIPT )
    
    RETVAL=$?
    
    echo "pkgbuilder: instalation for $i result: $RETVAL"
    
    [ $RETVAL -ne 0 ] && exit 1
done

#TODO: install or upgrade??
#if [ install_pkg $DEP_PKG_NAME $DEP_PKG_VERSION ] ; then
    # ( cd $PKGBUILDER_HOME ; ./build.sh $BUILD_SCRIPT auto installpkg )
#elif [ upgrade_pkg $DEP_PKG_NAME $DEP_PKG_VERSION ] ; then
    # ( cd $PKGBUILDER_HOME ; ./build.sh $BUILD_SCRIPT auto upgradepkg )
#fi

( cd $PKGBUILDER_HOME ; ./build.sh $PKG info )
