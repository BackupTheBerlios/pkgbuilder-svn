# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/airtraf/1.1/Attic/build.sh,v 1.1 2003/10/21 18:19:51 tomby Exp $
#
# airtraf pkgbuilder script
# 

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch

include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_configure() {
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
