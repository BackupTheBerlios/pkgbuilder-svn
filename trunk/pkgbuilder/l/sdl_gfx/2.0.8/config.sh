# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/sdl_gfx/2.0.8/Attic/config.sh,v 1.1 2003/10/21 18:19:48 tomby Exp $

PKG_NAME="sdl_gfx"
PKG_VERSION="2.0.8"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/SDL_gfx-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING INSTALL LICENSE README"

PKG_PREFIX="/usr"
