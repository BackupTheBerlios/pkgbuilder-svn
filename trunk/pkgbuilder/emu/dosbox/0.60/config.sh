# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/dosbox/0.60/Attic/config.sh,v 1.2 2003/10/25 21:57:13 tomby Exp $

PKG_NAME="dosbox"
PKG_VERSION="0.60"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMESITE="dosbox.sourceforge.net"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS C* INSTALL NEWS README THANKS"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--disable-sdltest --disable-alsatest"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
