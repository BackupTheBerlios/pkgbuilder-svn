# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/ruby/1.8.0/Attic/build.sh,v 1.2 2003/10/22 21:22:28 tomby Exp $
#
# ruby pkgbuilder script
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
    find $PKG_DEST -type d -exec chown root.root {} \;
    
    cd $PKG_SRC
    
    mkdir -p $PKG_DOC

    cp -a $PKG_DOC_FILES $PKG_DOC
    
    strip_all $PKG_DEST

    gzip_man $PKG_DEST$PKG_PREFIX/man

    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
