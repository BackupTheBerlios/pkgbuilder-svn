# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/wine/20031016/Attic/config.sh,v 1.1 2003/10/21 19:29:05 tomby Exp $

PKG_NAME="wine"
PKG_VERSION="20031016"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="Wine-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://www.ibiblio.org/pub/Linux/ALPHA/wine/development/$PKG_FILE_NAME"

PKG_HOMESITE="www.winehq.com"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="A* BUGS C* DEVELOPERS-HINTS LICENSE* README VERSION winedefault.reg"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--disable-debug --disable-trace"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="prefix=$PKG_DEST$PKG_PREFIX"
