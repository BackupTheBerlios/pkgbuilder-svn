# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/lm_sensors/2.6.5/Attic/build.sh,v 1.3 2003/10/22 22:03:22 tomby Exp $
#
# lm_sensors pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch
include do_configure_null

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_build() {
    cd $PKG_SRC
    
    make LINUX_HEADERS=/usr/include \
        I2C_INCLUDE=/usr/include \
        PREFIX=$PKG_PREFIX
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    make DESTDIR=$PKG_DEST LINUX_HEADERS=/usr/include \
        I2C_INCLUDE=/usr/include PREFIX=$PKG_PREFIX install
    
    return $?
}

do_postinstall() {
    cd $PKG_SRC
    
    gzip -9 $PKG_DEST/lib/modules/`uname -r`/misc/*.o
    
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    find $PKG_DOC -type d -exec chmod 755 {} \;

    strip_all $PKG_DEST$PKG_PREFIX/{bin,lib,sbin}

    gzip_man $PKG_DEST$PKG_PREFIX/man

    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
    cat $PKG_HOME/files/doinst.sh > $PKG_DEST/install/doinst.sh
}
