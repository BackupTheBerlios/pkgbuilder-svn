# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/games/frozen-bubble/1.0.0/Attic/build.sh,v 1.3 2003/10/22 22:03:22 tomby Exp $
#
# frozen-bubble pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_bzip2

include do_configure_null

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    cp c_stuff/Makefile c_stuff/Makefile.bak
    sed -e "s:INSTALLDIRS=.*:PREFIX=${PKG_DEST}/usr:" c_stuff/Makefile.bak > c_stuff/Makefile

    return $?
}

do_build() {
    cd $PKG_SRC
    
    make OPTIMIZE="$CFLAGS" PREFIX="$PKG_PREFIX"
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    make install PREFIX="$PKG_DEST$PKG_PREFIX"
    
    return $?
}

do_postinstall() {
    cd $PKG_SRC
    
    #Copiando documentacion
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    find $PKG_DOC -type d -exec chmod 755 {} \;
    
    mv $PKG_DEST$PKG_PREFIX/share/man $PKG_DEST$PKG_PREFIX/man
    
    chown -R root.root $PKG_DEST$PKG_PREFIX/share

    #Eliminando simbolos en binarios
    strip_all $PKG_DEST

    #Comprimiendo paginas man
    gzip_man $PKG_DEST$PKG_PREFIX/man

    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
