# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/cyrus-sasl/2.1.15/Attic/build.sh,v 1.2 2003/10/22 22:03:22 tomby Exp $
#
# cyrus-sasl pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip

include do_build

include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_patch() {
    cd $PKG_SRC
    
    patch -p0 < $PKG_HOME/files/$PKG_NAME-$PKG_VERSION-saslauthd-man.diff
    
    return $?
}

do_configure() {
    cd $PKG_SRC
    
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX \
        --with-configdir=/etc/sasl2 \
        --with-openssh \
        --with-dblib=gdbm --with-gdbm=/usr \
        --enable-plain \
        --enable-cram \
        --enable-login \
        --enable-anon
}

do_install() {
    cd $PKG_SRC
    
    make DESTDIR=$PKG_DEST install
    
    mkdir -p $PKG_DEST/etc/{sasl2,rc.d}
    
    cp $PKG_HOME/files/rc.saslauthd $PKG_DEST/etc/rc.d
    
    mkdir -p $PKG_DEST/var/lib/saslauthd
    
    return $?
}
