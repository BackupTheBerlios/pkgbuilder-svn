# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/fluxbox/cvs/Attic/config.sh,v 1.1 2003/10/21 19:34:39 tomby Exp $

PKG_NAME="fluxbox"
PKG_VERSION="cvs-`date +%Y%m%d`"
PKG_ARCH="i486"
PKG_BUILD="am1"

PKG_CVSROOT=":pserver:anonymous@cvs.fluxbox.sourceforge.net:/cvsroot/fluxbox"
PKG_MODULE="fluxbox"

PKG_HOMESITE="www.fluxbox.org"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING INSTALL NEWS README TODO doc/Coding_style"

PKG_PREFIX="/usr/X11R6"
PKG_CONFIGURE_OPTIONS="--enable-kde --enable-gnome"
PKG_BUILD_OPTIONS=""
PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
