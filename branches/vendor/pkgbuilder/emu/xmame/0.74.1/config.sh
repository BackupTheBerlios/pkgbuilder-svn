# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/xmame/0.74.1/Attic/config.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $

PKG_NAME="xmame"
PKG_VERSION="0.74.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://x.mame.net/download/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_HOMEPAGE="http://x.mame.net/"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="README todo doc/changes.unix doc/xmame-doc.txt doc/multiplayer-readme.txt"

PKG_PREFIX="/usr"
