# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.4 2003/11/08 16:50:10 tomby Exp $

version() {
    echo "build.sh $VERSION"
}

usage() {
    echo
    echo "usage: build.sh [script] [action]"
    echo
    echo "    general actions: [help|info|cleanup]"
    echo "    build actions:   [auto|fetch|unpack|patch|configure|build|install|postinstall]"
    echo "    pkg actions:     [buildpkg|installpkg|upgradepkg]"
    echo
    echo "    example: build.sh xap/aterm/aterm-0.4.2.build fetch"
}

include() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    source $PKGBUILDER_HOME/common/$1
    
    return $?
}

fetch() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if [ ! -d $FETCH_DIR ] ; then
        mkdir -p $FETCH_DIR
    fi
    
    if [ `echo $1 | grep "^ftp"` ] ; then
        FETCH_OPTIONS="--passive-ftp $FETCH_OPTIONS"
    fi
    
    wget -c $FETCH_OPTIONS $1

    return $?
}

gzip_man() {
    if [ "$1" = "" ] ; then
        return 1
    fi
    
    if [ ! -d $1 ]; then
        return 1
    fi
    
    gzip -9 $1/man?/*
        
    return $?
}

strip_all() {
    if [ "$1" = "" ] ; then
        return 1
    fi

    find $1 -type f | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded

    return $?
}
