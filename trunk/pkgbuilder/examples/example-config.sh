# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/examples/Attic/example-config.sh,v 1.2 2003/10/21 19:21:23 tomby Exp $

PKG_NAME="example"
PKG_VERSION="0.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.example.net/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMESITE="www.example.net"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="ChangeLog COPYING INSTALL README"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
