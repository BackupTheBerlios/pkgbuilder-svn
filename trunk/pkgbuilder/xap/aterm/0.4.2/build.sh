# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/aterm/0.4.2/Attic/build.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $
#
# aterm pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch
include do_configure
include do_build

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_install() {
    cd $PKG_SRC
    
    make prefix=$PKG_DEST$PKG_PREFIX install
    
    return $?
}
