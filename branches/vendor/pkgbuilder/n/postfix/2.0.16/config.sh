# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/postfix/2.0.16/Attic/config.sh,v 1.1 2003/10/21 18:19:51 tomby Exp $

PKG_NAME="postfix"
PKG_VERSION="2.0.16"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="ftp://ftp.porcupine.org/mirrors/postfix-release/official/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_URL_PATCH="ftp://ftp.porcupine.org/mirrors/postfix-release/official/$PKG_NAME-2.0-ns-mx-acl-patch.gz"
PKG_URL_TLS="ftp://ftp.aet.tu-cottbus.de/pub/postfix_tls/pfixtls-0.8.16-$PKG_VERSION-0.9.7b.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="*README COMPATIBILITY HISTORY INSTALL LICENSE PORTING RELEASE_NOTES*"

PKG_PREFIX="/usr"
