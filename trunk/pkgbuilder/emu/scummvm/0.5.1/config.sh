# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/emu/scummvm/0.5.1/Attic/config.sh,v 1.2 2003/10/25 21:57:13 tomby Exp $

PKG_NAME="scummvm"
PKG_VERSION="0.5.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.bz2"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMESITE="www.scummvm.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="COPYING NEWS README"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--backend=sdl"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
