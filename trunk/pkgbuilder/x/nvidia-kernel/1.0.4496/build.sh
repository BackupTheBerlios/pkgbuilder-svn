# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/x/nvidia-kernel/1.0.4496/Attic/build.sh,v 1.2 2003/10/22 22:03:22 tomby Exp $
#
# nvidia-kernel pkgbuilder script
#

include do_info
include do_fetch

include do_patch

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP
    
    sh $FETCH_DIR/NVIDIA-Linux-x86-1.0-4496-pkg0.run --extract-only
    
    return $?
}

do_configure() {
    echo "nothing to do"
}

do_build() {
    cd $PKG_SRC/usr/src/nv
    
    make IGNORE_CC_MISMATCH="yes" KERNDIR="/usr/src/linux" clean nvidia.o
    
    return $?
}

do_install() {
    mkdir -p $NV_DEST
    
    gzip -9 $PKG_SRC/usr/src/nv/nvidia.o
    
    cp $PKG_SRC/usr/src/nv/nvidia.o.gz $NV_DEST
    
    mkdir -p $PKG_DEST/sbin
    
    cp $PKG_SRC/usr/src/nv/makedevices.sh $PKG_DEST/sbin/NVmakedevices.sh
}

do_postinstall() {
    cd $PKG_SRC/usr/src/nv
    
    mkdir -p $PKG_DOC
    
    cp README $PKG_DOC
    
    mkdir -p $PKG_DEST/install
    
    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
    cat $PKG_HOME/files/doinst.sh > $PKG_DEST/install/doinst.sh
}
