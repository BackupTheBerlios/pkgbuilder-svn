# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.6 2003/11/23 00:58:25 tomby Exp $

version() {
    echo "build.sh $VERSION"
}

usage() {
    echo
    echo "usage: build.sh [script] [action]"
    echo
    echo "    general actions: [info|cleanup]"
    echo "    build actions:   [auto|fetch|unpack|patch|configure|build|install|postinstall]"
    echo "    pkg actions:     [buildpkg|installpkg|upgradepkg]"
    echo
    echo "    example: build.sh xap/aterm/aterm-0.4.2.build fetch"
}

include() {
    if [ "$1" == "" ] ; then
        return 1  
    fi
    
    source $PKGBUILDER_HOME/common/$1
    
    return $?
}

use() {
    if [ "$1" == "" ] ; then
        return 1  
    fi
    
    echo $USE | grep $1 &> /dev/null

    return $?
}

execute_action() {
    if [ "$1" == "" ] ; then
        return 1  
    fi
    
    RETVAL="0"

    #execution
    case "$1" in
        'info')
            do_info
            RETVAL="$?"
        ;;
        'fetch')
            do_fetch
            RETVAL="$?"
        ;;
        'unpack')
            do_unpack
            RETVAL="$?"
        ;;
        'patch')
            do_patch
            RETVAL="$?"
        ;;
        'configure')
            do_configure
            RETVAL="$?"
        ;;
        'build')
            do_build
            RETVAL="$?"
        ;;
        'install')
            do_install
            RETVAL="$?"
        ;;
        'postinstall')
            do_postinstall
            RETVAL="$?"
        ;;
        'buildpkg')
            do_buildpkg
            RETVAL="$?"
        ;;
        'installpkg')
            do_installpkg
            RETVAL="$?"
        ;;
        'upgradepkg')
            do_upgradepkg
            RETVAL="$?"
        ;;
        'cleanup')
            do_cleanup
            RETVAL="$?"
        ;;
        'auto')
            do_fetch && 
            do_unpack &&
            do_patch && 
            do_configure &&
            do_build &&
            do_install &&  
            do_postinstall && 
            do_buildpkg
            RETVAL="$?"
        ;;
        *)
            RETVAL="1"
    esac
    
    return $RETVAL
}

fetch() {
    if [ "$1" == "" ] ; then
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
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    if [ ! -d $1 ]; then
        return 1
    fi
    
    gzip -9 $1/man?/*
        
    return $?
}

strip_all() {
    if [ "$1" == "" ] ; then
        return 1
    fi

    find $1 -type f | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded

    return $?
}

is_installed() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    local retval
    
    if [ "$2" == "" ] ; then
        ls $PACKAGES_LOGDIR/$1-*-*-* &> /dev/null
        retval="$?"
    else
        ls $PACKAGES_LOGDIR/$1-$2-*-* &> /dev/null
        retval="$?"
    fi    
    
    return $retval
}

latest_version() {
    if [ "$1" == "" -o "$2" == "" ] ; then
        return 1
    fi
    
    local buildfiles=`cd $PKGBUILDER_HOME/$1/$2 ; ls -1v *.build`
    
    if [ "$buildfiles" != "" ] ; then
        local latestbuildfile=""
        
        for i in $buildfiles ; do
            latestbuildfile="$i"
        done

        local pkgmayorversion=`expr match $latestbuildfile '[a-zA-Z0-9_\-]\+\-\([0-9]\+\)'`
        local pkgminorversion=`expr match $latestbuildfile '[a-zA-Z0-9_\-]\+\-[0-9]\+\([0-9a-z\.]\+\)\.build'`

        echo "$pkgmayorversion$pkgminorversion"
    else
        return 1
    fi
}

installed_version() {
    if [ "$1" == "" ] ; then
        return 1
    fi

    local pkgfile=`cd $PACKAGES_LOGDIR ; ls $1-*-*-*`
    
    if [ -f "$PACKAGES_LOGDIR/$pkgfile" ] ; then
        local pkgmayorversion=`expr match $pkgfile '[a-zA-Z0-9_\-]\+\-\([0-9]\+\)'`
        local pkgminorversion=`expr match $pkgfile '[a-zA-Z0-9_\-]\+\-[0-9]\+\([0-9a-z\.]\+\)'`
        
        echo "$pkgmayorversion$pkgminorversion"
    else
        return 1
    fi
}
