#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/Attic/install-info.sh,v 1.1 2003/12/30 12:05:08 tomby Exp $
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

usage() {
    echo
    echo "usage: ./install-info.sh [metapkg/pkgname/<script>]"
    echo
    echo "    example: ./install.sh xap/aterm"
    echo "    example: ./install.sh xap/aterm/aterm-0.4.2.build"
}

#config file
source build.rc

#global functions
source scripts/functions.sh

#verify script to execute
if [ "$1" == "" -o "$1" == "help" ] ; then
    usage
    exit 1
fi

METAPKG_BASENAME="`dirname $1`"
PKG_BASENAME="`basename $1 .build`"

METAPKG="`extract_meta "$METAPKG_BASENAME"`"

PKG_NAME="`extract_name "$PKG_BASENAME"`"

PKG_VERSION="`extract_version "$PKG_BASENAME"`"

if [ "$METAPKG" == "" -o "$PKG_NAME" == "" ] ; then
    echo "pkgbuilder: invalid package"
    exit 1
fi

if [ "$PKG_VERSION" == "" ] ; then
    PKG_VERSION="`latest_version "$METAPKG" "$PKG_NAME"`"
fi

PKG="$METAPKG/$PKG_NAME/$PKG_NAME-$PKG_VERSION.build"

if [ ! -r "$PKG" ] ; then
    echo "pkgbuilder: invalid package"
    exit 1
fi

#the build script
source $PKG

if is_installed "$PKG_NAME" "$PKG_VERSION" "$PKG_BUILD" ; then
    echo "pkgbuilder: Package \"$PKG_NAME-$PKG_VERSION-$PKG_BUILD\" allready installed"
    exit 1
fi

#resolving dependencies
for DEP in $PKG_DEPENDS ; do
    
    DEP_METAPKG_BASENAME="`dirname $DEP`"
    DEP_PKG_BASENAME="`basename $DEP`"
    
    #metapkg
    DEP_METAPKG="`extract_meta "$DEP_METAPKG_BASENAME"`"

    #pkg
    DEP_PKG_NAME="`extract_name "$DEP_PKG_BASENAME"`"

    #version
    DEP_PKG_VERSION="`extract_version "$DEP_PKG_BASENAME"`"
    
    # superhipermega error
    test "$DEP_METAPKG" = "" -o "$DEP_PKG_NAME" == "" && exit 1
    
    # reset variables
    DEP_PKG_LATEST_VERSION=""
    DEP_PKG_INSTALLED_VERSION=""
    
    if [ "$DEP_PKG_VERSION" != "" ] ; then
        if [ `echo $DEP | grep '^!'` ] ; then
            #pkg must not installed

            is_installed $DEP_PKG_NAME $DEP_PKG_VERSION && exit 1 || continue
        elif [ `echo $DEP | grep '^>='` ] ; then
            #pkg must installed greater or equal version

            DEP_PKG_LATEST_VERSION="`latest_version $DEP_METAPKG $DEP_PKG_NAME`"

            if is_installed $DEP_PKG_NAME ; then
                DEP_PKG_INSTALLED_VERSION="`installed_version $DEP_PKG_NAME`"

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

            is_installed $DEP_PKG_NAME && exit 1 || continue
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

    # if not installed we must install the dependency
    if is_installed $DEP_PKG_NAME $DEP_PKG_VERSION ; then
        true
    else
        ( cd $PKGBUILDER_HOME ; ./install-info.sh $DEP_PKG )
        RETVAL="$?"
    
        test $RETVAL -ne 0 && exit $RETVAL
        
        # update environment
        . /etc/profile
    fi
done

if is_installed "$PKG_NAME" ; then
    echo "pkgbuilder: upgrading $PKG"
else
    echo "pkgbuilder: installing $PKG"
fi

exit $RETVAL
