# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/pkgfunctions.sh,v 1.18 2004/02/28 13:07:39 tomby Exp $

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
    if [ "$PKG_NOSTRIP" != "Y" ] ; then
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

        cat >> $PKG_DEST/install/doinst.sh << "EOF"
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
        local sum="$PKG_HOME/files/md5sum-$PKG_VERSION"
        
        verify $pkg $sum || fetch $pkg || return 1

    done

    return $?
}

pkg_fetchcvs() {
    cd $TMP

    echo "$PKG_CVSPASSWD" | cvs -d $PKG_CVSROOT login &&
    cvs -d $PKG_CVSROOT co -d $PKG_NAME-$PKG_VERSION $PKG_MODULE

    return $?
}

pkg_unpack() {
    cd $TMP
    
    if [ "$PKG_FILE_NAME" = "" ] ; then
        PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
    fi
    
    if [ "$PKG_UNPACK_DIR" != "" ] ; then
        mkdir -p "$PKG_UNPACK_DIR"
        cd $PKG_UNPACK_DIR
    fi
    
    local file
    
    for file in $PKG_FILE_NAME ; do
        unpack $file
    done
    
    return $RETVAL
}

pkg_configure() {
    CFLAGS=$CFLAGS \
    CXXFLAGS=$CXXFLAGS \
    CPPFLAGS=$CPPFLAGS \
    LDFLAGS=$LDFLAGS \
    ./configure --prefix=$PKG_PREFIX $PKG_CONFIGURE_OPTIONS

    return $?
}

pkg_build() {
    if [ "$COMPILATION" = "parallel" ] ; then
        DISTCC_HOSTS="$DISTCC_HOSTS" \
        CCACHE_PREFIX="$CCACHE_PREFIX" \
        make $MAKE_OPTIONS $PKG_BUILD_OPTIONS $PKG_BUILD_TARGET
        RETVAL="$?"
    else
        make $PKG_BUILD_OPTIONS $PKG_BUILD_TARGET
        RETVAL="$?"
    fi

    return $RETVAL
}

pkg_install() {
    if [ "$PKG_INSTALL_OPTIONS" = "" ] ; then
        PKG_INSTALL_OPTIONS="DESTDIR=$PKG_DEST"
    fi
	
    if [ "$PKG_INSTALL_TARGET" = "" ] ; then
        PKG_INSTALL_TARGET="install"
    fi

    make $PKG_INSTALL_OPTIONS $PKG_INSTALL_TARGET

    return $?
}

pkg_virtual() {
    if [ "$PKG_VIRTUAL" != "" ] ; then
        mkdir -p $PKG_DEST/install
		
        cat >> $PKG_DEST/install/doinst.sh << "EOF"
virtual() {
  cd /var/log/package
  
  ln -sf $1 $2-0.0-virtual-1
}
EOF

        for virtual in $PKG_VIRTUAL ; do
            echo "virtual $PKG_NAME-$PKG_VERSION-$PKG_ARCH-$PKG_BUILD $virtual" >> $PKG_DEST/install/doinst.sh
        done
    fi
}

pkg_localeclean() {
    if [ -f "$PKG_DEST$PKG_PREFIX/share/locale/locale.alias" ] ; then
        rm -f $PKG_DEST$PKG_PREFIX/share/locale/locale.alias
    fi
}

pkg_postinstall() {
    pkg_installdoc &&
    pkg_stripall &&
    pkg_gzipmaninfo &&
    pkg_localeclean &&
    pkg_configfiles &&
    pkg_installfiles
}
