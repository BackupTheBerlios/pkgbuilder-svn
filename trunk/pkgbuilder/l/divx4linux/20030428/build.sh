# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/divx4linux/20030428/Attic/build.sh,v 1.2 2003/10/21 19:21:23 tomby Exp $
#
# divx4linux pkgbuilder script
#

include do_info
include do_fetch
include do_patch
include do_configure_null
include do_build_null

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP

    tar zxvf $FETCH_DIR/$PKG_NAME-std-$PKG_VERSION.tar.gz

    return $?
}

do_install() {
    cd $PKG_SRC

    mkdir -p $PKG_DEST$PKG_PREFIX/{lib,include}
    
    cp -a *.h $PKG_DEST$PKG_PREFIX/include

    cp -a *.so $PKG_DEST$PKG_PREFIX/lib
    
    cd $PKG_DEST$PKG_PREFIX/lib 
    
    ln -s libdivxencore.so libdivxencore.so.0
    
    ln -s libdivxencore.so libdivxdecore.so.0 
    
    chmod 755 libdivx*
}

do_postinstall() {
    cd $PKG_SRC

    #Copiando documentacion
    mkdir -p $PKG_DOC

    cp -a $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;

    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
