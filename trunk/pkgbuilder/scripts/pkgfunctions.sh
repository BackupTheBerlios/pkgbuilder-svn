# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/pkgfunctions.sh,v 1.5 2003/12/24 11:40:04 tomby Exp $

#
# Package specific functions
#

pkg_installdoc() {
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    find $PKG_DOC -type d -exec chmod 755 {} \;
}

pkg_stripall() {
    if [ "$PKG_NOSTRIP" == "Y" ] ; then
        strip_all $PKG_DEST
    fi
}

pkg_gzipmaninfo() {
    gzip_man $PKG_DEST$PKG_PREFIX/man

    if [ -f $PKG_DEST$PKG_PREFIX/info/dir ] ; then
        rm -f $PKG_DEST$PKG_PREFIX/info/dir
    fi

    gzip_info $PKG_DEST$PKG_PREFIX/info
}

pkg_configfiles() {
    if [ "$PKG_CONFIG_FILES" != "" ] ; then
        mkdir -p $PKG_DEST/install

        for config in $PKG_CONFIG_FILES ; do
            mv $PKG_DEST/$config $PKG_DEST/$config.new
        done

        cat > $PKG_DEST/install/doinst.sh << "EOF"
#!/bin/sh
config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}
EOF

        for config in $PKG_CONFIG_FILES ; do
            echo "config $config.new" >> $PKG_DEST/install/doinst.sh
        done
    fi
}

pkg_installfiles() {
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc

    if [ -f $PKG_HOME/files/doinst.sh-$PKG_VERSION ] ; then
        cat $PKG_HOME/files/doinst.sh-$PKG_VERSION | grep -v '^#' >> $PKG_DEST/install/doinst.sh
    elif [ -f $PKG_HOME/files/doinst.sh ] ; then
        cat $PKG_HOME/files/doinst.sh | grep -v '^#' >> $PKG_DEST/install/doinst.sh
    fi
}

pkg_fetchfiles() {
    for pkg in $PKG_URL ; do
        local base="$FETCH_DIR/`basename "$pkg"`"
        local sum="$PKG_HOME/files/md5sum-$PKG_VERSION"

        if [ -r $base -a -r $sum ] ; then
            if grep -q `md5sum $base` $sum  ; then
                true
            else
                fetch $pkg || return $?
            fi
        else
            fetch $pkg || return $?
        fi
    done

    return $?
}

pkg_fetchcvs() {
    cd $TMP

    echo "$PKG_CVSPASSWD" | cvs -d $PKG_CVSROOT login &&
    cvs -d $PKG_CVSROOT co -d $PKG_NAME-$PKG_VERSION $PKG_MODULE

    return $?
}

pkg_configure() {
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    ./configure --prefix=$PKG_PREFIX $PKG_CONFIGURE_OPTIONS

    return $?
}

pkg_build() {
    make $PKG_BUILD_OPTIONS

    return $?
}

pkg_install() {
    if [ "$PKG_INSTALL_OPTIONS" = "" ] ; then
        PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
    fi

    make $PKG_INSTALL_OPTIONS install

    return $?
}
