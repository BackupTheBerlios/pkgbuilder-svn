# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_uncompress_gzip.sh,v 1.2 2003/10/21 19:21:23 tomby Exp $

do_uncompress() {
    cd $TMP
    
    if [ "$PKG_EXTENSION" = "" ] ; then
        PKG_EXTENSION="tar.gz"
    fi
    
    if [ "$PKG_FILE_NAME" = "" ] ; then
        PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
    fi

    tar zxvf $FETCH_DIR/$PKG_FILE_NAME
    
    return $?
}
