# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/ruby-gnome2/0.7.0/Attic/config.sh,v 1.1 2003/10/21 19:31:03 tomby Exp $

PKG_NAME="ruby-gnome2"
PKG_VERSION="0.7.0"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-all-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMESITE="http://ruby-gnome2.sourceforge.jp/"

PKG_SRC="$TMP/$PKG_NAME-all-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog NEWS README"

PKG_PREFIX="/usr"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
