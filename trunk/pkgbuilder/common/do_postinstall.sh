# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_postinstall.sh,v 1.3 2003/10/24 19:40:40 tomby Exp $

do_postinstall() {
    cd $PKG_SRC
    
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
