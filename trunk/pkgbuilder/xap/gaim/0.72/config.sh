# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/gaim/0.72/Attic/config.sh,v 1.1 2003/11/01 19:13:31 tomby Exp $

PKG_NAME="gaim"
PKG_VERSION="0.72"
PKG_ARCH="$ARCH"
PKG_BUILD="am2"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="ABOUT-NLS AUTHORS COPYING ChangeLog* HACKING INSTALL NEWS PROGRAMMING_NOTES \
        README* VERSION doc/FAQ doc/CREDITS"

PKG_PREFIX="/usr"
