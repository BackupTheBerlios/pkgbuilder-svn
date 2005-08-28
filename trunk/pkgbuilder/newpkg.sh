#!/bin/sh
#
# Copyright 2003-2005 Antonio G. Muñoz Conejo <tomby (AT) users.berlios.de>
# Distributed under the terms of the GNU General Public License v2
#
# Este script crea el directorio correspondiente y copia los scripts
# y otros archivos de ejemplo para crear un nuevo paquete
#

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
