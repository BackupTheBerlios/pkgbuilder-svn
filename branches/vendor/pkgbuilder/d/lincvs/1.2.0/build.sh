# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/lincvs/1.2.0/Attic/build.sh,v 1.1 2003/10/21 18:19:47 tomby Exp $
#
# lincvs pkgbuilder script
#

include do_info
include do_fetch

include do_build

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar zxvf $FETCH_DIR/$PKG_NAME-$PKG_VERSION-0-generic-src.tgz
    
    return $?
}

do_patch() {
    cd $PKG_SRC
    
    patch -p0 < $PKG_HOME/files/$PKG_NAME-$PKG_VERSION-gentoo.diff
}

do_configure() {
    cd $PKG_SRC
    
    QTDIR=$PKG_QTDIR qmake -o Makefile lincvs.pro
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    make install
    
    return $?
}

do_postinstall() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DEST/usr/share
    mkdir -p $PKG_DEST/usr/bin
    
    cp -pR LinCVS $PKG_DEST/usr/share
    cp -a LinCVS/lincvs $PKG_DEST/usr/bin
    rm -f $PKG_DEST/usr/share/LinCVS/lincvs
    
    #Copiando documentacion
    mkdir -p $PKG_DOC

    cp -a $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    
    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
