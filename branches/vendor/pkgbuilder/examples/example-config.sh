# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/examples/Attic/example-config.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

PKG_NAME="example"
PKG_VERSION="0.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_URL="http://download.example.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"

PKG_HOMESITE="www.example.net"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="ChangeLog COPYING INSTALL README"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sisconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
