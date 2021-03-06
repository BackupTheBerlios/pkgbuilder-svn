#!/bin/sh
#
# Copyright 2003-2005 Antonio G. Mu�oz Conejo <tomby (AT) users.berlios.de>
# Distributed under the terms of the GNU General Public License v2
#
# Este script crea el directorio correspondiente y copia los scripts
# y otros archivos de ejemplo para crear un nuevo paquete
#

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

FILES=""

for file in $PKG_URL ; do
    FILES="$FILES `basename $file`"
done

if [ "$FILES" = "" ] ; then
    for file in $PKG_FILE_NAME ; do
        FILES="$FILES `basename $file`"
    done
fi

if [ "$FILES" != "" ] ; then
    if [ ! -d $PKGBUILDER_HOME/`dirname $PKG`/files ] ; then
        mkdir -p $PKGBUILDER_HOME/`dirname $1`/files
    fi

    md5sum $FILES > $PKGBUILDER_HOME/`dirname $PKG`/files/md5sum-$PKG_VERSION
fi
