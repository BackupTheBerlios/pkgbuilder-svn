# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/functions.sh,v 1.42 2004/03/13 17:38:49 tomby Exp $

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
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    source $PKGBUILDER_HOME/common/$1.build
    
    return $?
}

#
# Include a build file
#
# @param $1 parent build file
#
inherit() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    include $1
    
    PKG_PARENT="$1"
    
    #call constructor
    if declare ${PKG_PARENT}_init ; then
        ${PKG_PARENT}_init
    fi
    
    return $?
}

#
# Returns if in use variable exists use parameter
#
# @param $1 use parameter
#
use() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    echo $USE | grep -o "\b$1\b" &> /dev/null

    return $?
}

#
# Print the dependency if use flag is activated
#
# @param $1 use parameter
# @param $2 dependency
#
use_dep() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if [ "$2" = "" ] ; then
        return 1  
    fi
    
    if `use $1` ; then
        echo $2
    fi
}

#
# Print the enable option if use flag is activated
#
# @param $1 use parameter
# @param $2 enable option (optional)
#
use_enable() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if `use $1` ; then
        if [ "$2" = "" ] ; then
            echo -n "--enable-$1"
        else
            echo -n "--enable-$2"
        fi
    else
        if [ "$2" = "" ] ; then
            echo -n "--disable-$1"
        else
            echo -n "--disable-$2"
        fi
    fi
}

#
# Print the with option if use flag is activated
#
# @param $1 use parameter
# @param $2 with option (optional)
#
use_with() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if `use $1` ; then
        if [ "$2" = "" ] ; then
            echo -n "--with-$1"
        else
            echo -n "--with-$2"
        fi
    else
        if [ "$2" = "" ] ; then
            echo -n "--without-$1"
        else
            echo -n "--without-$2"
        fi
    fi
}


#
# Call the action function if exists
#
# @param $1 action function
#
call_action() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if [ -d "$PKG_SRC" ] ; then
        cd $PKG_SRC
    fi

    if declare -f $1 &> /dev/null ; then
        $1
        RETVAL="$?"
    elif declare -f ${PKG_PARENT}_$1 &> /dev/null ; then
        ${PKG_PARENT}_$1
        RETVAL="$?"
    elif declare -f pkg_$1 &> /dev/null ; then
        pkg_$1
        RETVAL="$?"
    else
        echo "pkgbuilder: $1 function not defined in build script"
        RETVAL="$?"
    fi
    
    return $RETVAL
}

#
# Execute the given action and returns the result of the action
#
# @param $1 action name
#
execute_action() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    RETVAL="0"

    #execution
    case "$1" in
        'info')
            call_action do_info
            RETVAL="$?"
        ;;
        'fetch')
            call_action do_fetch
            RETVAL="$?"
        ;;
        'verify')
            call_action do_verify
            RETVAL="$?"
        ;;
        'unpack')
            call_action do_unpack
            RETVAL="$?"
        ;;
        'patch')
            call_action do_patch
            RETVAL="$?"
        ;;
        'configure')
            call_action do_configure
            RETVAL="$?"
        ;;
        'build')
            call_action do_build
            RETVAL="$?"
        ;;
        'install')
            call_action do_install
            RETVAL="$?"
        ;;
        'postinstall')
            call_action do_postinstall
            RETVAL="$?"
        ;;
        'buildpkg')
            call_action do_buildpkg
            RETVAL="$?"
        ;;
        'installpkg')
            call_action do_installpkg
            RETVAL="$?"
        ;;
        'upgradepkg')
            call_action do_upgradepkg
            RETVAL="$?"
        ;;
        'cleanup')
            call_action do_cleanup
            RETVAL="$?"
        ;;
        'auto')
            call_action do_fetch && 
            call_action do_verify &&
            call_action do_unpack &&
            call_action do_patch && 
            call_action do_configure &&
            call_action do_build &&
            call_action do_install &&  
            call_action do_postinstall && 
            call_action do_buildpkg
            RETVAL="$?"
        ;;
        *)
            RETVAL="1"
    esac
    
    return $RETVAL
}

#
# Fetch a file using wget. Firt try in local mirror, if fail then try with 
# the original URL
#
# @param $1 url
#
fetch() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if [ ! -d $FETCH_DIR ] ; then
        mkdir -p $FETCH_DIR
    fi
    
    if [ `echo $1 | grep "^ftp"` ] ; then
        FETCH_OPTIONS="$FETCH_FTP_OPTIONS $FETCH_OPTIONS"
    fi
    
    if [ "$MIRROR_URL" != "" ] ; then
        if [ `echo $MIRROR_URL | grep "^ftp"` ] ; then
            MIRROR_FETCH_OPTIONS="$FETCH_FTP_OPTIONS $FETCH_OPTIONS"
        fi

        local base="`basename "$1"`"

        wget -c $MIRROR_FETCH_OPTIONS $MIRROR_URL/$base || wget -c $FETCH_OPTIONS $1
    else 
        wget -c $FETCH_OPTIONS $1
    fi

    return $?
}

#
# Unpack a file
#
# @param $1 file name
#
unpack() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    local file
    
    if [ "$CDROM_DIR" != "" -a -r $CDROM_DIR/$1 ] ; then
        file="$CDROM_DIR/$1"
    else
        file="$FETCH_DIR/$1"
    fi
    
    if echo $1 | grep -q ".tar.gz$" ; then
        tar zxvf $file
        RETVAL="$?"
    elif echo $1 | grep -q ".tgz$" ; then
        tar zxvf $file
        RETVAL="$?"
    elif echo $1 | grep -q ".tar.bz2$" ; then
        tar jxvf $file
        RETVAL="$?"
    elif echo $1 | grep -q ".tbz2$" ; then
        tar jxvf $file
        RETVAL="$?"
    elif echo $1 | grep -q ".zip$" ; then
        unzip $file
        RETVAL="$?"
    else
        tar zxvf $file
        RETVAL="$?"
    fi
        
    return $RETVAL
}

#
# Apply a patch. First search the patch in CDROM_DIR, else in FETCH_DIR, and finally
# in $PKG_HOME files directory.
#
# @param $1 patch file name
# @param $@ patch options
#
apply_patch() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    local file
    
    if [ "$CDROM_DIR" != "" -a -r "$CDROM_DIR/$1" ] ; then
        file="$CDROM_DIR/$1"
    elif [ -r "$FETCH_DIR/$1" ] ; then
        file="$FETCH_DIR/$1"
    elif [ -r "$PKG_HOME/files/$1" ] ; then
        file="$PKG_HOME/files/$1"
    else
        file="$1"
    fi
    
    shift
    
    if echo $file | grep -q ".gz$" ; then
        zcat $file | patch "$@"
    elif echo $file | grep -q ".bz2$" ; then
        bzcat $file | patch "$@"
    else
        cat $file | patch "$@"
    fi
    
    return $?
}

#
# Verify a package file md5sum
#
# @param $1 package file name
# @param $2 md5sum file name
#
verify() {
    if [ "$1" = "" ] ; then
        return 1  
    fi
    
    if [ "$2" = "" -a -r "$2" ] ; then
        return 1  
    fi
    
    local base="`basename "$1"`"
    
    if [ -r "$FETCH_DIR/$base" ] ; then
        if ! grep -q "`md5sum $FETCH_DIR/$base | cut -d" " -f1`  `basename "$1"`" $2  ; then
            return 1
        fi
    elif [ -r "$CDROM_DIR/$base" ] ; then
        if ! grep -q "`md5sum $CDROM_DIR/$base | cut -d" " -f1`  `basename "$1"`" $2  ; then
            return 1
        fi
    else
        return 1
    fi
}

#
# Gzip all the man pages under the given directory
#
# @param $1 base directory
#
gzip_man() {
    if [ "$1" = "" ] ; then
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
    if [ "$1" = "" ] ; then
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
    if [ "$1" = "" ] ; then
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
# @param $3 package build (optional)
#
is_installed() {
    if [ "$1" = "" ] ; then
        return 1
    fi
    
    local retval=""
    
    if [ "$2" = "" ] ; then
        ls $PACKAGES_LOGDIR/$1-*-*-* 2> /dev/null | grep "$1\-[0-9]" &> /dev/null
        retval="$?"
    elif [ "$3" = "" ] ; then
        ls $PACKAGES_LOGDIR/$1-$2-*-* &> /dev/null
        retval="$?"
	else
		ls $PACKAGES_LOGDIR/$1-$2-*-$3 &> /dev/null
        retval="$?"
    fi    
    
    return $retval
}

#
# Compare version numbers. Returns 0 if equals, 1 if b < a and 2 if b > a
#
# @param $1 package a
# @param $2 package b
#
compare_versions() {
    if [ "$1" = "" -o "$2" = "" ] ; then
        return 1
    fi
    
    local v1="`extract_version $1`"
    local v2="`extract_version $2`"
    
    local tmp1
    local tmp2
    
    for field in 1 2 3 4 5 6 7 8 9 10 ; do
        tmp1="`echo $v1 | cut -d. -f$field`"
        tmp2="`echo $v2 | cut -d. -f$field`"
        
        if [ "$tmp1" = "" -a "$tmp2" = "" ] ; then
            break
        elif [ "$tmp1" = "" -a "$tmp2" != "" ] ; then
            #greater
            return 2
        elif [ "$tmp1" != "" -a "$tmp2" = "" ] ; then
            #lesser
            return 1
        fi

        if echo $tmp1 | grep -q "[a-zA-Z]\+" ||
           echo $tmp2 | grep -q "[a-zA-Z]\+" ; then
            if [[ "$tmp2" < "$tmp1" ]] ; then
                return 1
            elif [[ "$tmp2" > "$tmp1" ]] ; then
                return 2
            else
                continue
            fi
        else  
            if [ "$tmp2" -lt "$tmp1" ] ; then
                return 1
            elif [ "$tmp2" -gt "$tmp1" ] ; then
                return 2
            else
                continue
            fi
        fi
    done
    
    return 0;
}

#
# Print the latest version of a package
#
# @param $1 meta package
# @param $2 package name
#
latest_version() {
    if [ "$1" = "" -o "$2" = "" ] ; then
        return 1
    fi
    
    if [ ! -d "$PKGBUILDER_HOME/$1/$2" ] ; then
        return 2
    fi
    
    local buildfiles=`cd $PKGBUILDER_HOME/$1/$2 ; ls -v1 *.build`
    
    if [ "$buildfiles" != "" ] ; then
        local latestbuildfile=""
        
        for i in $buildfiles ; do
            if [ "$latestbuildfile" = "" ] ; then
                latestbuildfile="$i"
                continue
            fi
            
            compare_versions `basename $latestbuildfile .build` `basename $i .build`
            local RESULT="$?"
            
            if [ "$RESULT" -eq "2" ] ; then
                latestbuildfile="$i"
            fi
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
    if [ "$1" = "" ] ; then
        return 1
    fi
    
    if ls $PACKAGES_LOGDIR/$1-*-*-* &> /dev/null ; then
        local pkgfile=`cd $PACKAGES_LOGDIR ; ls -1 $1-*-*-* | grep "^$1\-[0-9]"`
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
# Print instaled build of package
#
# @param $1 package name
#
installed_build() {
    if [ "$1" = "" ] ; then
        return 1
    fi
    
    if ls $PACKAGES_LOGDIR/$1-*-*-* &> /dev/null ; then
        local pkgfile=`cd $PACKAGES_LOGDIR ; ls -1 $1-*-*-* | grep "^$1\-[0-9]"`
    else
        return 2
    fi
    
    if [ -r "$PACKAGES_LOGDIR/$pkgfile" ] ; then
		local pkgbuild="`expr match "$pkgfile" '.*\-\([a-z]*[0-9]\+[a-z]*\)'`"
        
        echo "$pkgbuild"
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
    if [ "$1" = "" ] ; then
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
    if [ "$1" = "" ] ; then
        return 1
    fi
    
    local pkgname="`expr match "$1" '\([a-zA-Z0-9_+\-]\+\)\-[0-9][a-zA-Z0-9_\.]\+'`"
    
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
    if [ "$1" = "" ] ; then
        return 1
    fi
    
    local pkgmayorversion="`expr match "$1" '[a-zA-Z0-9_+\-]\+\-\([0-9]\)[a-zA-Z0-9_\.]\+'`"
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
