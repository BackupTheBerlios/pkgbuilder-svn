# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/mplayer/1.0pre2/Attic/build.sh,v 1.2 2003/10/22 22:03:22 tomby Exp $
#
# mplayer pkgbuilder script
#

include do_info
include do_patch
include do_build
include do_install

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_fetch() {
    fetch $PKG_URL && 
    fetch $PKG_FONT_URL && 
    fetch $PKG_SKIN_URL
    
    return $?
}

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar jxvf $FETCH_DIR/MPlayer-$PKG_VERSION.tar.bz2
    
    return $?
}

do_configure() {
    cd $PKG_SRC

    #compilando
    ./configure --prefix=$PKG_PREFIX \
        --confdir=/etc/mplayer \
        --datadir=/usr/share/mplayer \
        --disable-runtime-cpudetection \
        --enable-gui \
        --enable-menu \
        --enable-largefiles \
        --language=all
        
    return $? 
}

do_postinstall() {
    cd $PKG_SRC

    #Copiando documentacion
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    
    cp etc/codecs.conf $PKG_DEST/etc/mplayer
    cp etc/input.conf $PKG_DEST/etc/mplayer

    #Eliminando simbolos en binarios
    strip_all $PKG_DEST

    #Comprimiendo paginas man
    gzip_man $PKG_DEST$PKG_PREFIX/man

    rm $PKG_DEST$PKG_PREFIX/man/man1/mencoder.1
    cd $PKG_DEST$PKG_PREFIX/man/man1
    ln -s mplayer.1.gz mencoder.1.gz
    
    cd $PKG_DEST$PKG_PREFIX/share/mplayer/Skin
    tar jxvf $FETCH_DIR/Blue-1.0.tar.bz2
    mv Blue default
    chmod 755 default
    chmod 644 default/*
    rm -f default/README
    chown -R root.root default
    
    cd $PKG_DEST$PKG_PREFIX/share/mplayer/font
    tar jxvf $FETCH_DIR/font-arial-iso-8859-1.tar.bz2
    find ./ -type f -exec chmod 644 {} \;
    find ./ -type d -exec chmod 755 {} \;
    chown -R root.root font-arial-iso-8859-1
    
    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
