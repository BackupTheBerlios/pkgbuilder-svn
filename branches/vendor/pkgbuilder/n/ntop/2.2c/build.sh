# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/ntop/2.2c/Attic/build.sh,v 1.1 2003/10/21 18:19:50 tomby Exp $
#
# ntop pkgbuilder script
#

include do_info
include do_fetch

include do_patch

include do_build
include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP

    tar zxvf $FETCH_DIR/$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION
    
    return $?
}
