# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/xmame/0.74.1/Attic/build.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $
#
# xmame pkgbuilder script
# 

include do_info
include do_fetch
include do_uncompress_bzip2

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    patch -p0 < $PKG_HOME/files/makefile.unix.diff
    
    return $?
}

do_configure() {
    echo "configure: nothing to do"
}

do_build() {
    cd $PKG_SRC
    
    #compilando
    CFLAGS=$CFLAGS \
    make PREFIX=$PKG_PREFIX
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    make PREFIX=$PKG_DEST$PKG_PREFIX MANDIR=$PKG_DEST$PKG_PREFIX/man/man6 install
    
    return $?
}
