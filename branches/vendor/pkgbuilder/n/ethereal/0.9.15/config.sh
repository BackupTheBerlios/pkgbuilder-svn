# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/ethereal/0.9.15/Attic/config.sh,v 1.1 2003/10/21 18:19:50 tomby Exp $

PKG_NAME="ethereal"
PKG_VERSION="0.9.15"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://www.ethereal.com/distribution/all-versions/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING FAQ* INSTALL* NEWS README* TODO doc/README*"

PKG_PREFIX="/usr"
