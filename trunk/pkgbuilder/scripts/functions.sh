# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.3 2003/11/01 13:49:11 tomby Exp $

version() {
    echo "build.sh $VERSION"
}

usage() {
    echo
    echo "usage: build.sh [package] [action]"
    echo
    echo "    general actions: [help|info|clean]"
    echo "    build actions:   [auto|fetch|uncompress|patch|configure|build|install|postinstall]"
    echo "    pkg actions:     [buildpkg|installpkg|upgradepkg]"
    echo
    echo "    example: build.sh xap/aterm/0.4.2 fetch"
}

include() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    source $PKGBUILDER_HOME/common/$1.sh
    
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
