# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/ntop/2.2c/Attic/build.sh,v 1.3 2003/11/01 12:22:25 tomby Exp $
#
# ntop pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip

include do_build

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC/ntop
    
    patch -p0 < $PKG_HOME/files/pthread_atfork.diff
    
    return $?
}

do_configure() {
    do_build_gdchart &&
    do_configure_ntop
    
    return $?
}

do_configure_ntop() {
    cd $PKG_SRC/ntop
    
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX --sysconfdir=/etc
    
    return $?
}

do_build_gdchart() {
    cd $PKG_SRC/gdchart0.94c
    
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure || return $?
    
    cd gd-1.8.3/libpng-1.2.4
    make -f scripts/makefile.linux || return $?
    
    cd ../../zlib-1.1.4
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure &&
    make || return $?
    
    cd ../
    make || return $?
}

do_build() {
    cd $PKG_SRC/ntop
    
    make
    
    return $?
}

do_install() {
    cd $PKG_SRC/ntop
    
    make DESTDIR=$PKG_DEST install
    
    return $?
}

do_postinstall() {
    cd $PKG_SRC/ntop
    
    mkdir -p $PKG_DEST/var/lib/ntop
    
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;

    strip_all $PKG_DEST

    gzip_man $PKG_DEST$PKG_PREFIX/man

    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
