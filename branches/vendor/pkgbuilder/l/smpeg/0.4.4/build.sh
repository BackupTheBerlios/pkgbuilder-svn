# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/smpeg/0.4.4/Attic/build.sh,v 1.1 2003/10/21 18:19:48 tomby Exp $
#
# smpeg pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch

include do_build
include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_configure() {
    cd $PKG_SRC

    #compilando
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    CC=g++ \
    ./configure --prefix=$PKG_PREFIX \
        --disable-sdltest \
        --disable-gtktest \
        --disable-gtk-player \
        --disable-opengl-player \
        --without-x

    return $?        
}
