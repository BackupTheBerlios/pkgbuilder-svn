# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/sdl_gfx/2.0.9/Attic/config.sh,v 1.1 2003/10/28 22:23:59 tomby Exp $

PKG_NAME="sdl_gfx"
PKG_VERSION="2.0.9"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="SDL_gfx-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://www.ferzkopp.net/Software/SDL_gfx-2.0/$PKG_FILE_NAME"

PKG_HOMESITE="http://www.ferzkopp.net/Software/SDL_gfx-2.0/"

PKG_SRC="$TMP/SDL_gfx-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING INSTALL LICENSE README"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--disable-sdltest"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
