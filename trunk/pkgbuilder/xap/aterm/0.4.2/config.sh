# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/aterm/0.4.2/Attic/config.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $

PKG_NAME="aterm"
PKG_VERSION="0.4.2"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="aterm.lsm ChangeLog INSTALL README* doc/BUGS doc/FAQ doc/README.* doc/TODO"

PKG_PREFIX="/usr/X11R6"
