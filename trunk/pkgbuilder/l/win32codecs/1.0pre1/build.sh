# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/win32codecs/1.0pre1/Attic/build.sh,v 1.2 2003/10/21 19:21:23 tomby Exp $
#
# win32codecs pkgbuilder script
#

include do_info
include do_fetch
include do_patch
include do_buildpkg
include do_configure_null
include do_build_null

include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP
    
    tar jxvf $FETCH_DIR/extralite.tar.bz2
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DEST$PKG_PREFIX/lib/win32
    
    cp -a * $PKG_DEST$PKG_PREFIX/lib/win32
    
    chmod 755 $PKG_DEST$PKG_PREFIX/lib/win32/*
}

do_postinstall() {
    cd $PKG_SRC

    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
