# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/gtkhtml/3.0.9/Attic/build.sh,v 1.2 2003/10/29 21:56:06 tomby Exp $
#
# gtkhtml pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_bzip2

include do_configure
include do_build
include do_install

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    mv ltmain.sh ltmain.sh.orig &&
	sed s/relink=yes/relink=no/ ltmain.sh.orig > ltmain.sh
    
    return $?
}

do_postinstall() {
    cd $PKG_SRC
    
    rmdir $PKG_DEST$PKG_PREFIX/libexec
    
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
