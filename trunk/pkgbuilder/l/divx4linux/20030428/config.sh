# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/divx4linux/20030428/Attic/config.sh,v 1.1 2003/10/21 18:19:48 tomby Exp $

PKG_NAME="divx4linux"
PKG_VERSION="20030428"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.divx.com/divx/$PKG_NAME-std-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="*.htm"

PKG_PREFIX="/usr"
