# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_configure.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_configure() {
    cd $PKG_SRC

    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX $PKG_CONFIGURE_OPTIONS

    return $?        
}
