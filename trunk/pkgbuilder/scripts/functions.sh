# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.16 2003/11/29 12:05:44 tomby Exp $

version() {
    echo "pkgbuilder $VERSION"
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
        'verify')
            do_verify
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
            do_verify &&
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
    
    find $1 -type f -name '*.?' | xargs gzip -9
        
    return $?
}

gzip_info() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    if [ ! -d $1 ]; then
        return 1
    fi
    
    gzip -9 $1/*
        
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
    
    local retval=""
    
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
    
    if [ ! -d "$PKGBUILDER_HOME/$1/$2" ] ; then
        return 2
    fi
    
    local buildfiles=`cd $PKGBUILDER_HOME/$1/$2 ; ls -1v *.build`
    
    if [ "$buildfiles" != "" ] ; then
        local latestbuildfile=""
        
        for i in $buildfiles ; do
            if [[ "$latestbuildfile" < "$i" ]] ; then
                latestbuildfile="$i"
            fi
        done
        
        latestbuildfile="`basename $latestbuildfile .build`"

        local pkgmayorversion=`expr match $latestbuildfile '[a-zA-Z0-9_\-]\+\-\([0-9]\+\)'`
        local pkgminorversion=`expr match $latestbuildfile '[a-zA-Z0-9_\-]\+\-[0-9]\+\([0-9a-z\.]\+\)'`

        echo "$pkgmayorversion$pkgminorversion"
    else
        return 1
    fi
}

installed_version() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    if ls $PACKAGES_LOGDIR/$1-*-*-* &> /dev/null ; then
        local pkgfile=`cd $PACKAGES_LOGDIR ; ls -1 $1-*-*-* | grep "$1\-[0-9]"`
    else
        return 2
    fi
    
    if [ -r "$PACKAGES_LOGDIR/$pkgfile" ] ; then
        local pkgmayorversion=`expr match $pkgfile '[a-zA-Z0-9_\-]\+\-\([0-9]\+\)'`
        local pkgminorversion=`expr match $pkgfile '[a-zA-Z0-9_\-]\+\-[0-9]\+\([0-9a-z\.]\+\)'`
        
        echo "$pkgmayorversion$pkgminorversion"
    else
        return 1
    fi
}

result_msg() {
    if [ "$1" -eq 0 ] ; then
        echo "SUCCESS"
    else    
        echo "ERROR"
    fi
}
