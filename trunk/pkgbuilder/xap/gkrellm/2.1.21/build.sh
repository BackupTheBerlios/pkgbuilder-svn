# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/gkrellm/2.1.21/Attic/build.sh,v 1.1 2003/10/24 19:40:08 tomby Exp $
#
# gkrellm pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_bzip2

include do_configure_null

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    cp Makefile Makefile.old
    sed "s/share\/man/man/g" Makefile.old > Makefile
    
    return $?
}

do_build() {
    cd $PKG_SRC

    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    make PREFIX=$PKG_PREFIX
    
    return $?
}

do_install() {
    cd $PKG_SRC

    make DESTDIR=$PKG_DEST PREFIX=$PKG_PREFIX install
    
    return $?
}
