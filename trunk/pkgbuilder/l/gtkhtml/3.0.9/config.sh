# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/gtkhtml/3.0.9/Attic/config.sh,v 1.2 2003/10/29 21:56:06 tomby Exp $

PKG_NAME="gtkhtml"
PKG_VERSION="3.0.9"
PKG_ARCH="i486"
PKG_BUILD="am2"
PKG_EXTENSION="tar.bz2"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="ftp://ftp.gnome.org/pub/gnome/sources/$PKG_NAME/3.0/$PKG_FILE_NAME"

PKG_HOMESITE="www.gnome.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS BUGS C* INSTALL NEWS README TODO"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
