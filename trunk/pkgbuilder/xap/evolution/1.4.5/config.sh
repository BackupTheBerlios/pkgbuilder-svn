# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/evolution/1.4.5/Attic/config.sh,v 1.2 2003/10/30 21:40:30 tomby Exp $

PKG_NAME="evolution"
PKG_VERSION="1.4.5"
PKG_DB3_VERSION="3.1.17"
PKG_ARCH="i486"
PKG_BUILD="am2"
PKG_EXTENSION="tar.bz2"
PKG_DB3_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_DB3_FILE_NAME="db-$PKG_DB3_VERSION.$PKG_DB3_EXTENSION"
PKG_URL="ftp://ftp.gnome.org/pub/GNOME/sources/$PKG_NAME/1.4/$PKG_FILE_NAME"
PKG_DB3_URL="http://www.sleepycat.com/update/snapshot/$PKG_DB3_FILE_NAME"

PKG_HOMESITE="www.ximiam.com"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS C* HACKING INSTALL MAINTAINERS NEWS* README"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS=""
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
