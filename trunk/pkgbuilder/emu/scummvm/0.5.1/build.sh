# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/scummvm/0.5.1/Attic/build.sh,v 1.1 2003/10/25 21:50:02 tomby Exp $
#
# scummvm pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_bzip2

include do_configure
include do_build

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    cp Makefile Makefile.orig
    sed -e "s:-O:$CXXFLAGS:" \
        Makefile.orig > Makefile
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DEST$PKG_PREFIX/bin
    cp scummvm $PKG_DEST$PKG_PREFIX/bin
    
    mkdir -p $PKG_DEST$PKG_PREFIX/man/man6
    cp scummvm.6 $PKG_DEST$PKG_PREFIX/man/man6
    
    return $?
}
