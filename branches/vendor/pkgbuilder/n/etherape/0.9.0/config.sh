# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/etherape/0.9.0/Attic/config.sh,v 1.1 2003/10/21 18:19:50 tomby Exp $

PKG_NAME="etherape"
PKG_VERSION="0.9.0"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="A* C* FAQ INSTALL NEWS OVERVIEW README* TODO"

PKG_PREFIX="/usr"
