#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/install.sh,v 1.16 2003/12/31 16:41:52 tomby Exp $
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
    echo "usage: ./install.sh [options] [metapkg/pkgname/<script>]"
    echo
    echo "    options:"
    echo "        -v verbose mode"
    echo "        -d dummy mode"
    echo
    echo "    example: ./install.sh xap/aterm"
    echo "    example: ./install.sh xap/aterm/aterm-0.4.2.build"
}

#config file
source build.rc

#global functions
source scripts/functions.sh

# Parse options:
OPTIONS=""
MODE="install"

while [ 0 ]; do
  if [ "$1" = "-v" ]; then
    VERBOSE="Y"
    OPTIONS="$OPTIONS -v"
    shift 1
  elif [ "$1" = "-d" ]; then
    MODE="dummy"
    OPTIONS="$OPTIONS -d"
    shift 1
  else
    break
  fi
done

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

if [ "$VERBOSE" = "Y" ] ; then
    echo
    echo "PKG=\"$PKG\""

    echo "PKG_DEPENDS=\"$PKG_DEPENDS\""
fi

if is_installed "$PKG_NAME" "$PKG_VERSION" "$PKG_BUILD" ; then
    echo "pkgbuilder: Package \"$PKG_NAME-$PKG_VERSION-$PKG_BUILD\" allready installed"
    exit 1
fi

#resolving dependencies
for DEP in $PKG_DEPENDS ; do
    if [ "$VERBOSE" = "Y" ] ; then
        echo
        echo "DEP=\"$DEP\""
    fi
    
    DEP_METAPKG_BASENAME="`dirname $DEP`"
    DEP_PKG_BASENAME="`basename $DEP`"
    
    if [ "$VERBOSE" = "Y" ] ; then
        echo "DEP_METAPKG_BASENAME=\"$DEP_METAPKG_BASENAME\""
        echo "DEP_PKG_BASENAME=\"$DEP_PKG_BASENAME\""
    fi
    
    #metapkg
    DEP_METAPKG="`extract_meta "$DEP_METAPKG_BASENAME"`"

    #pkg
    DEP_PKG_NAME="`extract_name "$DEP_PKG_BASENAME"`"

    #version
    DEP_PKG_VERSION="`extract_version "$DEP_PKG_BASENAME"`"
    
    if [ "$VERBOSE" = "Y" ] ; then
        echo
        echo "DEP_METAPKG=\"$DEP_METAPKG\""
        echo "DEP_PKG_NAME=\"$DEP_PKG_NAME\""
        echo "DEP_PKG_VERSION=\"$DEP_PKG_VERSION\""
    fi
    
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
            
            if [ "$VERBOSE" = "Y" ] ; then
                echo "DEP_PKG_LATEST_VERSION=\"$DEP_PKG_LATEST_VERSION\""
            fi

            if is_installed $DEP_PKG_NAME ; then
                DEP_PKG_INSTALLED_VERSION="`installed_version $DEP_PKG_NAME`"
                
                if [ "$VERBOSE" = "Y" ] ; then
                    echo "DEP_PKG_INSTALLED_VERSION=\"$DEP_PKG_INSTALLED_VERSION\""
                fi

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
    
    DEP_PKG="$DEP_METAPKG/$DEP_PKG_NAME/$DEP_PKG_NAME-$DEP_PKG_VERSION.build"
    
    if [ "$VERBOSE" = "Y" ] ; then
        echo "DEP_PKG=\"$DEP_PKG\""
    fi

    # if not installed we must install the dependency
    if is_installed $DEP_PKG_NAME $DEP_PKG_VERSION ; then
        if [ "$VERBOSE" = "Y" ] ; then
            echo "pkgbuilder: $DEP allready installed"
        fi
    else
        ( cd $PKGBUILDER_HOME ; ./install.sh $OPTIONS $DEP_PKG )
        RETVAL="$?"
        
        if [ "$VERBOSE" = "Y" ] ; then
            echo
            echo "pkgbuilder: instalation for $DEP result: `result_msg $RETVAL`"
        fi
    
        test $RETVAL -ne 0 && exit $RETVAL
        
        # update environment
        if [ "$MODE" = "install" ] ; then
            source /etc/profile
        fi
    fi
done

if is_installed "$PKG_NAME" ; then
    echo "pkgbuilder: upgrading $PKG"
    
    if [ "$MODE" = "install" ] ; then
        ( cd $PKGBUILDER_HOME ; ./build.sh $PKG auto cleanup upgradepkg )
        RETVAL="$?"
    fi
else
    echo "pkgbuilder: installing $PKG"

    if [ "$MODE" = "install" ] ; then
        ( cd $PKGBUILDER_HOME ; ./build.sh $PKG auto cleanup installpkg )
        RETVAL="$?"
    fi
fi

exit $RETVAL
