# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_clean.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_clean() {
    if [ -d $PKG_SRC ] ; then
        rm -rf $PKG_SRC
    fi
    
    if [ -d $PKG_DEST ] ; then
        rm -rf $PKG_DEST
    fi

    echo
    echo "clean for $PKG_NAME-$PKG_VERSION done"
}
