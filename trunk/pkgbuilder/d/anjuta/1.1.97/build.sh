# Copyright 2003 Antonio G. Mu�oz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/anjuta/1.1.97/Attic/build.sh,v 1.1 2003/10/30 22:53:53 tomby Exp $
#
# anjuta pkgbuilder script
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
    
    rm -rf $PKG_DEST/usr/share/doc/anjuta
    rmdir $PKG_DEST/usr/share/doc
    
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    find $PKG_DOC -type d -exec chmod 755 {} \;

    strip_all $PKG_DEST

    gzip_man $PKG_DEST$PKG_PREFIX/man

    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
    
    if [ -f $PKG_HOME/files/doinst.sh ] ; then
        cat $PKG_HOME/files/doinst.sh > $PKG_DEST/install/doinst.sh
    fi
}
