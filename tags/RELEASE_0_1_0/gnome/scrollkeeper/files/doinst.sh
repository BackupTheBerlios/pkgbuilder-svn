
/usr/bin/xmlcatalog --noout --add "public" \
        "-//OMF//DTD Scrollkeeper OMF Variant V1.0//EN" \
        "file:///usr/share/xml/scrollkeeper/dtds/scrollkeeper-omf.dtd" \
        etc/xml/catalog

/usr/bin/scrollkeeper-rebuilddb -q -p var/lib/scrollkeeper

/usr/bin/scrollkeeper-update -v &> /dev/null
