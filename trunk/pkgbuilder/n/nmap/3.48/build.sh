# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/nmap/3.48/Attic/build.sh,v 1.1 2003/10/21 18:19:50 tomby Exp $
#
# nmap pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_bzip2
include do_patch

include do_build

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_configure() {
    cd $PKG_SRC

    #compilando
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX \
        --with-nmapfe

    return $? 
}

do_install() {
    cd $PKG_SRC
    
    make prefix=$PKG_DEST$PKG_PREFIX nmapdatadir=$PKG_DEST$PKG_PREFIX/share/nmap install
    
    return $? 
}
