# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/umbrello/1.1.1/Attic/config.sh,v 1.1 2003/10/21 19:26:19 tomby Exp $

PKG_NAME="umbrello"
PKG_VERSION="1.1.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.bz2"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.sourceforge.net/uml/$PKG_FILE_NAME"

PKG_HOMESITE="umbrello.sourceforge.net"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING INSTALL README TODO uml.lsm"

PKG_PREFIX="/opt/kde"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
