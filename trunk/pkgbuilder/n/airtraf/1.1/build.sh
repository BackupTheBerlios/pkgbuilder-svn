# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/airtraf/1.1/Attic/build.sh,v 1.2 2003/11/01 13:31:47 tomby Exp $
#
# airtraf pkgbuilder script
# 

include do_info
include do_fetch
include do_uncompress_gzip

include do_configure_null

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC/src
    
    cp Makefile.rules Makefile.rules.old
    
    sed "s/-O2/$CFLAGS/g" Makefile.rules.old > Makefile.rules
    
    return $?
}

do_build() {
    cd $PKG_SRC/src
    
    make
    
    return $?
}

do_install() {
    cd $PKG_SRC/src
    
    mkdir -p $PKG_DEST$PKG_PREFIX/bin
    
    cp airtraf $PKG_DEST$PKG_PREFIX/bin
    
    return $?
}
