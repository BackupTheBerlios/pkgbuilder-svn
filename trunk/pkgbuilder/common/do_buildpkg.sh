# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_buildpkg.sh,v 1.2 2003/11/01 13:48:52 tomby Exp $

do_buildpkg() {
    cd $PKG_DEST
    
    if [ "$PKG_ARCH" = "" ] ; then
        $PKG_ARCH=$ARCH
    fi
    
    makepkg -l y -c n ../$PKG_NAME-$PKG_VERSION-$PKG_ARCH-$PKG_BUILD.tgz
    
    return $?
}
