# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

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
    
    source $BUILDPKG_HOME/common/$1.sh
    
    return $?
}

fetch() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if [ ! -d $FETCH_DIR ] ; then
        mkdir -p $FETCH_DIR
    fi
    
    wget -c --tries=$FETCH_TRIES --limit-rate=$FETCH_RATE --directory-prefix=$FETCH_DIR $1

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
