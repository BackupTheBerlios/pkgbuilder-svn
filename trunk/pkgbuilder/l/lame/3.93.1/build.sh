# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/lame/3.93.1/Attic/build.sh,v 1.1 2003/10/21 18:19:48 tomby Exp $
#
# lame pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip

include do_build

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    cp configure configure.old
    
    sed "s/gtk12-config/gtk-config/g" configure.old > configure
    
    return $?
}

do_configure() {
    cd $PKG_SRC

    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX \
        --enable-shared \
        --enable-nasm \
        --enable-mp3rtp \
        --enable-mp3x

    return $?
}

do_install() {
    cd $PKG_SRC
    
    make DESTDIR=$PKG_DEST pkghtmldir=/usr/doc/$PKG_NAME-$PKG_VERSION/html install
    
    return $?
}
