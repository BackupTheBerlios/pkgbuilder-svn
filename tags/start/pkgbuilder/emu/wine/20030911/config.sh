# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/wine/20030911/Attic/config.sh,v 1.1 2003/10/21 18:19:52 tomby Exp $

PKG_NAME="wine"
PKG_VERSION="20030911"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://www.ibiblio.org/pub/Linux/ALPHA/wine/development/Wine-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="A* BUGS C* DEVELOPERS-HINTS LICENSE* README VERSION winedefault.reg"

PKG_PREFIX="/usr"
