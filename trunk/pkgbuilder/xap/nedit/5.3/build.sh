# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/nedit/5.3/Attic/build.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $
#
# nedit pkgbuilder script
#

include do_info
include do_fetch
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar jxvf $FETCH_DIR/$PKG_NAME-$PKG_VERSION-source.tar.bz2
    
    return $?
}

do_patch() {
    cd $PKG_SRC
    
    patch -p1 < $PKG_HOME/files/$PKG_NAME-$PKG_VERSION-gentoo.diff
    
    cp makefiles/Makefile.linux makefiles/Makefile.linux.old
	sed "s:-O:$CFLAGS -D__LINUX__:" \
		makefiles/Makefile.linux.old > makefiles/Makefile.linux
    
    return $?
}

do_configure() {
    echo "configure: nothing to do"
}

do_build() {
    cd $PKG_SRC
    
    make linux
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    mkdir -p $PKG_DEST$PKG_PREFIX/bin
    cp -a source/nedit $PKG_DEST$PKG_PREFIX/bin
    cp -a source/nc $PKG_DEST$PKG_PREFIX/bin/neditc
    
    mkdir -p $PKG_DEST$PKG_PREFIX/man/man1
    cp -a doc/nedit.man $PKG_DEST$PKG_PREFIX/man/man1/nedit.1
    cp -a doc/nc.man $PKG_DEST$PKG_PREFIX/man/man1/neditc.1
    
    return $?
}
