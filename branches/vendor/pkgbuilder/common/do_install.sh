# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_install.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_install() {
    cd $PKG_SRC
    
    if [ "$PKG_INSTALL_OPTIONS" = "" ] ; then
        PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
    fi
    
    make $PKG_INSTALL_OPTIONS install
    
    return $?
}
