export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/X11R6/lib/pkgconfig

if [ -z $XDG_DATA_DIRS ]; then
    export XDG_DATA_DIRS=/usr/share
else
    export XDG_DATA_DIRS=/usr/share:$XDG_DATA_DIRS
fi

if [ -z $XDG_CONFIG_DIRS ]; then
    export XDG_CONFIG_DIRS=/etc/xdg
else
    export XDG_CONFIG_DIRS=/etc/xdg:$XDG_CONFIG_DIRS
fi
