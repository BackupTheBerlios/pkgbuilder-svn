# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/fluxbox/cvs/Attic/build.sh,v 1.1 2003/10/21 19:34:39 tomby Exp $
#
# fluxbox cvs version pkgbuilder script
#

include do_info
include do_fetch_cvs
include do_uncompress_null

include do_configure
include do_build
include do_install

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    ./autogen.sh
    
    return $?
}

do_postinstall() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DEST/etc/X11/xinit
    
    cat $PKG_HOME/files/xinitrc.fluxbox > $PKG_DEST/etc/X11/xinit/xinitrc.fluxbox
    
    #Copiando documentacion
    mkdir -p $PKG_DOC

    cp -a $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    find $PKG_DOC -type d -exec chmod 755 {} \;

    #Eliminando simbolos en binarios
    strip_all $PKG_DEST

    #Comprimiendo paginas man
    gzip_man $PKG_DEST$PKG_PREFIX/man

    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}

