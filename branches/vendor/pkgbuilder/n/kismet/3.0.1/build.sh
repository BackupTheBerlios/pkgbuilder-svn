# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/kismet/3.0.1/Attic/build.sh,v 1.1 2003/10/21 18:19:51 tomby Exp $
#
# kismet pkgbuilder script
#

include do_info

include do_patch

include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_fetch() {
    fetch $PKG_URL && fetch $PKG_ETHEREAL_URL
    
    return $?
}

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar zxvf $FETCH_DIR/$PKG_NAME-$PKG_VERSION.tar.gz &&
    cd $PKG_SRC &&
    tar jxvf $FETCH_DIR/ethereal-$PKG_ETHEREAL_VERSION.tar.bz2
    
    return $?
}

do_configure() {
    #hay que tener compilado ethereal
    do_build_ethereal
    
    cd $PKG_SRC
    
    cd libpcap-0.7.2 && autoconf && cd ..
    
    #compilando
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX \
        --sysconfdir=/etc/kismet \
        --datadir=/usr/share \
        --with-ethereal=$PKG_ETHEREAL_SRC

    return $?
}

do_build_ethereal() {
    cd $PKG_ETHEREAL_SRC
    
    ./configure && cd wiretap && make
    
    return $?
}

do_build() {
    cd $PKG_SRC

    make dep && make

    return $?        
}
