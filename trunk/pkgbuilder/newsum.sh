#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/newsum.sh,v 1.2 2004/01/02 12:49:24 tomby Exp $
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
# Este script crea el directorio correspondiente y copia los scripts
# y otros archivos de ejemplo para crear un nuevo paquete

source build.rc
source scripts/functions.sh
source scripts/pkgfunctions.sh

if [ "$1" = "" ] ; then
    echo "$0 buildfile"
    exit 1
fi

PKG="$1"

include base

source $PKG

cd $FETCH_DIR

if [ ! -d $PKGBUILDER_HOME/`dirname $1`/files ] ; then
    mkdir -p $PKGBUILDER_HOME/`dirname $1`/files
fi

md5sum $PKG_FILE_NAME > $PKGBUILDER_HOME/`dirname $1`/files/md5sum-$PKG_VERSION
