#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/newpkg.sh,v 1.2 2003/11/08 16:55:24 tomby Exp $
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

if [ "$1" = "" -o "$2" = "" -o "$3" = "" ] ; then
    echo "$0 metapkg pkgname pkgversion"
    exit 1
fi

PKG_DIR=$1/$2
PKG_FILE=$2-$3.build

mkdir -p $PKG_DIR/files

cp examples/example.build $PKG_DIR/$PKG_FILE
cp examples/slack-desc $PKG_DIR/files/slack-desc

chmod u+w $PKG_DIR/$PKG_FILE $PKG_DIR/files/slack-desc
