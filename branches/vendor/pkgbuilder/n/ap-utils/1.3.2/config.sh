# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/ap-utils/1.3.2/Attic/config.sh,v 1.1 2003/10/21 18:19:51 tomby Exp $

PKG_NAME="ap-utils"
PKG_VERSION="1.3.2"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="A* C* INSTALL NEWS README THANKS TODO Documentation/FAQ"

PKG_PREFIX="/usr"
