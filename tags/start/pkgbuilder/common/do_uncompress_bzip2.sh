# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_uncompress_bzip2.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_uncompress() {
    cd $TMP
    
    if [ "$PKG_EXTENSION" = "" ] ; then
        PKG_EXTENSION="tar.bz2"
    fi

    tar jxvf $FETCH_DIR/$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION
    
    return $?
}
