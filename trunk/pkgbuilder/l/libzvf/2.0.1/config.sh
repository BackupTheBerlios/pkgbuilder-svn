# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/libzvf/2.0.1/Attic/config.sh,v 1.1 2003/10/30 22:19:01 tomby Exp $

PKG_NAME="libzvt"
PKG_VERSION="2.0.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/$PKG_NAME/2.0/$PKG_FILE_NAME"

PKG_HOMESITE="www.gnome.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS C* INSTALL NEWS README"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
