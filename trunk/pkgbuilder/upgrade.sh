#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/Attic/upgrade.sh,v 1.1 2003/11/23 16:55:35 tomby Exp $
#
# Copyright (C) 2003 Antonio G. Mu�oz Conejo <tomby (AT) tomby.homelinux.org>
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
    echo usage
    exit 1
fi

#the build script
source $PKG

echo
echo "PKG=\"$PKG\""

echo "PKG_DEPENDS=\"$PKG_DEPENDS\""

#resolving dependencies
for DEP in $PKG_DEPENDS ; do
    echo
    echo "DEP=\"$DEP\""
    
    #metapkg
    DEP_METAPKG=`expr match "$DEP" '\!\?>\?=\?\([a-z]\+\)/'`

    #pkg
    DEP_PKG_NAME=`expr match "$DEP" '\!\?>\?=\?[a-z]\+/\([a-zA-Z0-9_\-]\+\)\-[0-9]\+'`
    
    test "$DEP_PKG_NAME" == "" && 
        DEP_PKG_NAME=`expr match "$DEP" '\!\?>\?=\?[a-z]\+/\([a-zA-Z0-9_\-]\+\)'`

    #version
    mayorversion=`expr match "$DEP" '\!\?>\?=\?[a-z]\+/[a-zA-Z0-9_\-]\+\-\([0-9]\+\)'`
    minorversion=`expr match "$DEP" '\!\?>\?=\?[a-z]\+/[a-zA-Z0-9_\-]\+\-[0-9]\+\([0-9a-z\.]\+\)'`
    DEP_PKG_VERSION="$mayorversion$minorversion"
    
    echo "DEP_METAPKG=\"$DEP_METAPKG\""
    echo "DEP_PKG_NAME=\"$DEP_PKG_NAME\""
    echo "DEP_PKG_VERSION=\"$DEP_PKG_VERSION\""
    
    # superhipermega error
    test "$DEP_METAPKG" = "" -o "$DEP_PKG_NAME" == "" && exit 1
    
    if [ "$DEP_PKG_VERSION" != "" ] ; then
        if [ `echo $DEP | grep '^!'` ] ; then
            #pkg must not installed

            test is_installed $DEP_PKG_NAME $DEP_PKG_VERSION && exit 1
        elif [ `echo $DEP | grep '^>='` ] ; then
            #pkg must installed greater or equal version

            DEP_PKG_LATEST_VERSION="`latest_version $DEP_METAPKG $DEP_PKG_NAME`"
            
            echo "DEP_PKG_LATEST_VERSION=\"$DEP_PKG_LATEST_VERSION\""

            if is_installed $DEP_PKG_NAME ; then
                DEP_PKG_INSTALLED_VERSION="`installed_version $DEP_PKG_NAME`"
                
                echo "DEP_PKG_INSTALLED_VERSION=\"$DEP_PKG_INSTALLED_VERSION\""

                if [[ "$DEP_PKG_INSTALLED_VERSION" < "$DEP_PKG_VERSION" ]] ; then
                    DEP_PKG_VERSION="$DEP_PKG_LATEST_VERSION"
                else
                    DEP_PKG_VERSION="$DEP_PKG_INSTALLED_VERSION"
                fi
            else
                DEP_PKG_VERSION="$DEP_PKG_LATEST_VERSION"
            fi
        fi
    else 
        if [ `echo $DEP | grep '^!'` ] ; then
            #pkg must not installed

            test is_installed $DEP_PKG_NAME && exit 1
        else
            DEP_PKG_LATEST_VERSION="`latest_version $DEP_METAPKG $DEP_PKG_NAME`"

            if is_installed $DEP_PKG_NAME ; then
                DEP_PKG_VERSION="`installed_version $DEP_PKG_NAME`"
            else
                DEP_PKG_VERSION="$DEP_PKG_LATEST_VERSION"
            fi
        fi
    fi
    
    DEP_PKG=$DEP_METAPKG/$DEP_PKG_NAME/$DEP_PKG_NAME-$DEP_PKG_VERSION.build
    
    echo "DEP_PKG=\"$DEP_PKG\""

    # if not installed we must install the dependency
    if is_installed $DEP_PKG_NAME $DEP_PKG_VERSION ; then
        echo "pkgbuilder: $DEP allready installed"
    else
        
        if [ "$DEP_PKG_INSTALLED_VERSION" == "" ] ; then
            ( cd $PKGBUILDER_HOME ; ./install.sh $DEP_PKG )
            RETVAL="$?"
        else
            ( cd $PKGBUILDER_HOME ; ./upgrade.sh $DEP_PKG )
            RETVAL="$?"
        fi
        
        echo "pkgbuilder: instalation for $DEP result: $RETVAL"
    
        test $RETVAL -ne 0 && exit $RETVAL
    fi
done

echo "pkgbuilder: installing $PKG"
( cd $PKGBUILDER_HOME ; ./build.sh $PKG auto upgradepkg cleanup )

exit $?
