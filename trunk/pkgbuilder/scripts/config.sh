# Copyright 2003 Antonio G. Mu�oz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/Attic/config.sh,v 1.3 2003/11/01 13:49:11 tomby Exp $

PKGBUILDER_HOME="/home/tomby/proyectos/pkgbuilder"

VERSION="20031031"

FETCH_TRIES="5"
FETCH_RATE="25K"
FETCH_DIR="/home/tomby/tmp/distfiles"
FETCH_OPTIONS="--tries=$FETCH_TRIES --limit-rate=$FETCH_RATE --directory-prefix=$FETCH_DIR"

TMP="/home/tomby/tmp"

ARCH="i486"
CPU="i686"
CFLAGS="-O2 -march=$ARCH -mcpu=$CPU"
CXXFLAGS="$CFLAGS"
