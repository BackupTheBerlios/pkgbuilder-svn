# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/ap/nano/1.2.2/Attic/config.sh,v 1.1 2003/10/21 18:19:52 tomby Exp $

PKG_NAME="nano"
PKG_VERSION="1.2.2"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://www.nano-editor.org/dist/v1.2/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS BUGS C* INSTALL NEWS README T* UPGRADE faq.html"

PKG_PREFIX="/usr"
