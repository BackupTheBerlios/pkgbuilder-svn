# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/libsoup/1.99.26/Attic/config.sh,v 1.1 2003/10/28 22:23:16 tomby Exp $

PKG_NAME="libsoup"
PKG_VERSION="1.99.26"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.bz2"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="ftp://ftp.gnome.org/pub/gnome/sources/$PKG_NAME/1.99/$PKG_FILE_NAME"

PKG_HOMESITE="www.gnome.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS C* INSTALL NEWS README TODO"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
