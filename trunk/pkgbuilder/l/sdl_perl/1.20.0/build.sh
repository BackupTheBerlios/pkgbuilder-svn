# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/sdl_perl/1.20.0/Attic/build.sh,v 1.2 2003/10/22 22:03:22 tomby Exp $
#
# sdl_perl pkgbuilder script
#

include do_info
include do_fetch

include do_build
include do_install

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar zxvf $FETCH_DIR/SDL_perl-$PKG_VERSION.tar.gz
    
    return $?
}

do_patch() {
    cd $PKG_SRC
    
    patch -p0 < $PKG_HOME/files/Makefile.linux.diff
    patch -p0 < $PKG_HOME/files/SDL_perl.xs.diff
    
    return $?
}

do_configure() {
    cd $PKG_SRC
    
    ./configure
    
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
    rmdir $PKG_DEST$PKG_PREFIX/share

    #Eliminando simbolos en binarios
    strip_all $PKG_DEST

    #Comprimiendo paginas man
    gzip_man $PKG_DEST$PKG_PREFIX/man

    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}

