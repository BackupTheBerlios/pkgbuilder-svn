# If latex isn't there, maybe we need to do this:
if [ ! -r /usr/bin/latex ]; then
  /usr/bin/texconfig init
fi

# Let's start with these defaults:
/usr/bin/texconfig confall
/usr/bin/texconfig dvips paper letter
/usr/bin/texconfig xdvi us

# These *might* be useful...
/usr/bin/texconfig mode ljfour
#/usr/bin/texconfig xdvi a4
/usr/bin/texconfig dvips mode ljfour
#/usr/bin/texconfig dvips paper A4
/usr/bin/texconfig dvips printcmd -
/usr/bin/texconfig dvips add bjc600
/usr/bin/texconfig dvips add stcolor
/usr/bin/texconfig dvips add deskjet
/usr/bin/texconfig dvips add ljet4
/usr/bin/texconfig dvips -P bjc600  mode canonbjc
/usr/bin/texconfig dvips -P stcolor mode epstylus
/usr/bin/texconfig dvips -P deskjet mode deskjet
/usr/bin/texconfig dvips -P ljet4   mode ljfour
/usr/bin/texconfig font options appendonlydir varfonts
/usr/bin/texconfig font ro
/usr/bin/texconfig rehash
