# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/ruby/1.8.0/Attic/config.sh,v 1.1 2003/10/21 19:25:10 tomby Exp $

PKG_NAME="ruby"
PKG_VERSION="1.8.0"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.gz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://gd.tuwien.ac.at/languages/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMESITE="www.ruby-lang.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="ChangeLog COPYING* GPL LEGAL LGPL README* ToDo"

PKG_PREFIX="/usr"
PKG_CONFIGURE_OPTIONS="--sysconfdir=/etc"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
