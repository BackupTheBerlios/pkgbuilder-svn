# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/sdl_perl/1.20.0/Attic/config.sh,v 1.1 2003/10/21 18:19:49 tomby Exp $

PKG_NAME="sdl_perl"
PKG_VERSION="1.20.0"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://sdlperl.org/downloads/stable/SDL_perl-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/SDL_perl-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="BUGS CHANGELOG COPYING README* TODO"

PKG_PREFIX="/usr"
