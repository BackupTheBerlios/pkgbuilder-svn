# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/cyrus-sasl/2.1.15/Attic/config.sh,v 1.1 2003/10/21 18:19:49 tomby Exp $

PKG_NAME="cyrus-sasl"
PKG_VERSION="2.1.15"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING INSTALL NEWS README doc/*"

PKG_PREFIX="/usr"
