# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/x/nvidia-kernel/1.0.4496/Attic/config.sh,v 1.1 2003/10/21 18:19:52 tomby Exp $

PKG_NAME="nvidia-kernel"
PKG_VERSION="1.0.4496"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="ftp://download.nvidia.com/XFree86/Linux-x86/1.0-4496/NVIDIA-Linux-x86-1.0-4496-pkg0.run"

PKG_SRC="$TMP/NVIDIA-Linux-x86-1.0-4496-pkg0"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"

NV_DEST="$PKG_DEST/lib/modules/`uname -r`/video"
