# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/wine/20030911/Attic/build.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $
#
# wine pkgbuilder script
#

include do_info
include do_fetch

include do_patch

include do_build

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar zxvf $FETCH_DIR/Wine-$PKG_VERSION.tar.gz
    
    return $?
}

do_configure() {
    cd $PKG_SRC

    #compilando
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX \
        --disable-debug \
        --disable-trace 
    
    return $?
}

do_install() {
    cd $PKG_SRC 

    make prefix=$PKG_DEST$PKG_PREFIX install
    
    return $?
}

