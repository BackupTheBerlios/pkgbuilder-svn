# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/games/frozen-bubble/1.0.0/Attic/config.sh,v 1.1 2003/10/21 18:19:55 tomby Exp $

PKG_NAME="frozen-bubble"
PKG_VERSION="1.0.0"
PKG_ARCH="i486"
PKG_BUILD="am2"
PKG_URL="http://guillaume.cottenceau.free.fr/fb/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS CHANGES COPYING README"

PKG_PREFIX="/usr"
