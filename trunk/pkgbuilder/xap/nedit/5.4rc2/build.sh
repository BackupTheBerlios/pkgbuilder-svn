# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/nedit/5.4rc2/Attic/build.sh,v 1.1 2003/10/25 15:34:50 tomby Exp $
#
# nedit pkgbuilder script
#

include do_info
include do_fetch

include do_uncompress_bzip2
include do_configure_null

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    cp makefiles/Makefile.linux makefiles/Makefile.linux.old
	sed "s:-O:$CFLAGS -DBUILD_UNTESTED_NEDIT -D__LINUX__:" \
		makefiles/Makefile.linux.old > makefiles/Makefile.linux
    
    return $?
}

do_build() {
    cd $PKG_SRC
    
    make linux
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DEST$PKG_PREFIX/bin
    cp source/nedit $PKG_DEST$PKG_PREFIX/bin
    cp source/nc $PKG_DEST$PKG_PREFIX/bin/neditc
    
    mkdir -p $PKG_DEST$PKG_PREFIX/man/man1
    cp doc/nedit.man $PKG_DEST$PKG_PREFIX/man/man1/nedit.1
    cp doc/nc.man $PKG_DEST$PKG_PREFIX/man/man1/neditc.1
    
    return $?
}
