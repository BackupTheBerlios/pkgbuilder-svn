# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/sdl_ttf/2.0.6/Attic/config.sh,v 1.1 2003/10/21 18:19:48 tomby Exp $

PKG_NAME="sdl_ttf"
PKG_VERSION="2.0.6"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/SDL_ttf-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="CHANGES COPYING README"

PKG_PREFIX="/usr"
