# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_upgradepkg.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_upgradepkg() {
    cd $TMP
    
    upgradepkg $PKG_NAME-$PKG_VERSION-$PKG_ARCH-$PKG_BUILD.tgz
    
    return $?
}
