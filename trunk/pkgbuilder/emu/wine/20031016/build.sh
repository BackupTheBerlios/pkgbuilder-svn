# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/wine/20031016/Attic/build.sh,v 1.1 2003/10/21 19:29:05 tomby Exp $
#
# wine pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch
include do_configure
include do_build
include do_install

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_postinstall() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DOC

    cp -a $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    
    rmdir $PKG_DEST/usr/man/man3w

    strip_all $PKG_DEST

    gzip_man $PKG_DEST$PKG_PREFIX/man

    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
   
}
