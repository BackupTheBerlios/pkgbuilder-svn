# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.28 2003/12/24 16:33:32 tomby Exp $

#
# Generic functions
#

#
# Print pkgbuilder version number
#
version() {
    echo "pkgbuilder $VERSION"
}

#
# Include a file of the common directory
#
# @param $1 file name to include
#
include() {
    if [ "$1" == "" ] ; then
        return 1  
    fi
    
    source $PKGBUILDER_HOME/common/$1
    
    return $?
}

#
# Returns if in use variable exists use parameter
#
# @param $1 use parameter
#
use() {
    if [ "$1" == "" ] ; then
        return 1  
    fi
    
    echo $USE | grep $1 &> /dev/null

    return $?
}

#
# Execute the given action and returns the result of the action
#
# @param $1 action name
#
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

#
# Fetch a file using wget
#
# @param $1 url
#
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

#
# Gzip all the man pages under the given directory
#
# @param $1 base directory
#
gzip_man() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    if [ ! -d $1 ]; then
        return 0
    fi
    
    find $1 -type f | xargs gzip -9
        
    return $?
}

#
# Gzip all the info files under the given directory
#
# @param $1 base directory
#
gzip_info() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    if [ ! -d $1 ]; then
        return 0
    fi
    
    find $1 -type f | xargs gzip -9
        
    return $?
}

#
# Strip all the files under the given directory
#
# @param $1 base directory
#
strip_all() {
    if [ "$1" == "" ] ; then
        return 1
    fi

    find $1 -type f | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded

    return $?
}

#
# Returns if a package is installed
#
# @param $1 package name
# @param $2 package version (optional)
#
is_installed() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    local retval=""
    
    if [ "$2" == "" ] ; then
        ls $PACKAGES_LOGDIR/$1-*-*-* 2> /dev/null | grep "$1\-[0-9]" &> /dev/null
        retval="$?"
    else
        ls $PACKAGES_LOGDIR/$1-$2-*-* &> /dev/null
        retval="$?"
    fi    
    
    return $retval
}

#
# Print the latest version of a package
#
# @param $1 meta package
# @param $2 package name
#
latest_version() {
    if [ "$1" == "" -o "$2" == "" ] ; then
        return 1
    fi
    
    if [ ! -d "$PKGBUILDER_HOME/$1/$2" ] ; then
        return 2
    fi
    
    local buildfiles=`cd $PKGBUILDER_HOME/$1/$2 ; ls -v1 *.build`
    
    if [ "$buildfiles" != "" ] ; then
        local latestbuildfile=""
        
        for i in $buildfiles ; do
            latestbuildfile="$i"
        done
        
        latestbuildfile="`basename $latestbuildfile .build`"

        local pkgversion="`extract_version $latestbuildfile`"
        
        echo "$pkgversion"
    else
        return 1
    fi
}

#
# Print instaled version of package
#
# @param $1 package name
#
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
        pkgfile="`echo $pkgfile | sed -e 's:\-[a-zA-Z0-9]\+\-[a-z]*[0-9]\+$::'`"
        
        local pkgversion="`extract_version $pkgfile`"
        
        echo "$pkgversion"
    else
        return 1
    fi
}

#
# Print meta package name
#
# @param $1 package dep in format >=meta/pkgname-1.2
#
extract_meta() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    local metapkg="`expr match "$1" '\!\?>\?=\?\([a-z]\+\)/\?'`"
    
    echo "$metapkg"
}

#
# Print name of package
#
# @param $1 pkgfile in format pkgname-1.2
#
extract_name() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    local pkgname="`expr match "$1" '\([a-zA-Z0-9_+\-]\+\)\-[0-9]\+'`"
    
    if [ "$pkgname" != "" ] ; then
        echo "$pkgname"
    else
        echo "$1"
    fi
}

#
# Print version of package
#
# @param $1 pkgfile in format pkgname-1.2
#
extract_version() {
    if [ "$1" == "" ] ; then
        return 1
    fi
    
    local pkgmayorversion="`expr match "$1" '[a-zA-Z0-9_+\-]\+\-\([0-9]\)'`"
    local pkgminorversion="`expr match "$1" '[a-zA-Z0-9_+\-]\+\-[0-9]\([a-zA-Z0-9_\.]\+\)'`"

    echo "$pkgmayorversion$pkgminorversion"
}

#
# Print result message
#
# @param $1 result value
#
result_msg() {
    if [ "$1" -eq 0 ] ; then
        echo "SUCCESS"
    else    
        echo "ERROR"
    fi
}
