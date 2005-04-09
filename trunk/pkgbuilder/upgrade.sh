#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/update.sh,v 1.4 2004/03/14 15:51:44 tomby Exp $
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

#config file
source build.rc

#global functions
source scripts/functions.sh

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

if ! [ -r $PKGBUILDER_HOME/PACKAGES ] ; then
    echo "DB file \"PACKAGES\" not found"
    echo "Please build it with \"build_db.sh\" script"
    exit 1
fi

for PKG in `find $PACKAGES_LOGDIR -type f | sort` ; do
    BASEPKG="`basename $PKG | sed -e 's:\-[a-zA-Z0-9]\+\-[a-z]*[0-9]\+[a-z]*$::'`"
    
    PKG_NAME="`extract_name $BASEPKG`"
    
    if [ "$VERBOSE" = "Y" ] ; then
        echo $PKG_NAME
    fi

    if [ "$NOUPGRADE" != "" ] ; then
        # si el paquete est� en la lista de no actualizables, continuamos
        for NOUP in $NOUPGRADE ; do
            if [ "$NOUP" = "$PKG_NAME" ] ; then
                if [ "$VERBOSE" = "Y" ] ; then
                    echo "$PKG_NAME in black list"
                fi
                continue
            fi
        done
    fi
    
    PKG_DB_NAME="`grep "[a-z]\+/$PKG_NAME-[0-9]" $PKGBUILDER_HOME/PACKAGES`"

    # si el paquete existe en la base de datos de paquetes de pkgbuilder
    if [ "$PKG_DB_NAME" != "" ] ; then
        PKG_META="`extract_meta $PKG_DB_NAME`"
        PKG_VERSION="`latest_version $PKG_META $PKG_NAME`"
        
        PKG="$PKG_META/$PKG_NAME/$PKG_NAME-$PKG_VERSION.build"
        
        eval "`grep "PKG_BUILD=" $PKGBUILDER_HOME/$PKG`"
        
        if ! is_installed $PKG_NAME $PKG_VERSION $PKG_BUILD ; then
            if [ "$MODE" = "install" ] ; then
                ( cd $PKGBUILDER_HOME ; ./install.sh $OPTIONS $PKG )

                test "$?" -ne 0 && exit "$?"
            else
                echo ./install.sh "$PKG_META/$PKG_NAME/$PKG_NAME-$PKG_VERSION.build"
            fi
        fi
        
        
    fi
done
