# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/ruby-gnome2/0.7.0/Attic/build.sh,v 1.3 2003/10/22 21:44:56 tomby Exp $
#
# example pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch

include do_build
include do_install

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_configure() {
    cd $PKG_SRC
    
    ruby extconf.rb
    
    return $?
}

do_postinstall() {
    find $PKG_DEST -exec chown root.root {} \;
    
    cd $PKG_SRC
    
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    
    strip_all $PKG_DEST

    gzip_man $PKG_DEST$PKG_PREFIX/man

    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
}
