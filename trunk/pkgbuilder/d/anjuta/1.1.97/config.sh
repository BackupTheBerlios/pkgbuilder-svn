# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/anjuta/1.1.97/Attic/config.sh,v 1.1 2003/10/30 22:53:53 tomby Exp $

PKG_NAME="anjuta"
PKG_VERSION="1.1.97"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMESITE="www.anjuta.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS C* FUTURE INSTALL NEWS README T* doc/ScintillaDoc.html"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
