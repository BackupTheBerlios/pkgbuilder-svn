# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/evolution/1.4.5/Attic/build.sh,v 1.1 2003/10/30 21:23:29 tomby Exp $
#
# evolution pkgbuilder script
#

include do_info

include do_patch

include do_build
include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_fetch() {
    fetch $PKG_URL && fetch $PKG_DB3_URL
    
    return $?
}

do_uncompress() {
    cd $TMP
    
    tar jxvf $FETCH_DIR/$PKG_FILE_NAME &&
    cd $PKG_SRC &&
    tar zxvf $FETCH_DIR/$PKG_DB3_FILE_NAME
    
    return $?
}

do_configure() {
    do_build_db3
    
    cd $PKG_SRC
    
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX --with-db3=$PKG_SRC/db3 --sysconfdir=/etc
    
    return $?
}

do_build_db3() {
    cd $PKG_SRC/db-$PKG_DB3_VERSION/build_unix
    
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ../dist/configure --prefix=$PKG_SRC/db3 &&
    make &&
    make prefix=$PKG_SRC/db3 install
    
    return $?
}
