#!/bin/sh

CATALOG="etc/xml/catalog"
DOCBOOK_CATALOG="etc/xml/docbook"

if [ ! -e $CATALOG ]; then 
    usr/bin/xmlcatalog --noout --create $CATALOG
fi

if [ ! -e $DOCBOOK_CATALOG ]; then 
    usr/bin/xmlcatalog --noout --create $DOCBOOK_CATALOG
fi 

usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbpoolx.mod" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//DTD DocBook XML V4.1.2//EN" \
    "http://oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//ENTITIES DocBook XML Character Entities V4.1.2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbcentx.mod" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//ENTITIES DocBook XML Notations V4.1.2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbnotnx.mod" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//ENTITIES DocBook XML Additional General Entities V4.1.2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbgenent.mod" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.1.2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbhierx.mod" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/soextblx.dtd" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "public" \
    "-//OASIS//DTD DocBook XML CALS Table Model V4.1.2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/calstblx.dtd" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "rewriteSystem" \
    "http://www.oasis-open.org/docbook/xml/4.1.2" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2" \
    $DOCBOOK_CATALOG   
usr/bin/xmlcatalog --noout --add "rewriteURI" \
    "http://www.oasis-open.org/docbook/xml/4.1.2" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2" \
    $DOCBOOK_CATALOG   

usr/bin/xmlcatalog --noout --add "delegatePublic" \
    "-//OASIS//ENTITIES DocBook XML" \
    "file:///etc/xml/docbook" $CATALOG 
usr/bin/xmlcatalog --noout --add "delegatePublic" \
    "-//OASIS//DTD DocBook XML" \
    "file:///etc/xml/docbook" $CATALOG 
usr/bin/xmlcatalog --noout --add "delegateSystem" \
    "http://www.oasis-open.org/docbook/" \
    "file:///etc/xml/docbook" $CATALOG 
usr/bin/xmlcatalog --noout --add "delegateURI" \
    "http://www.oasis-open.org/docbook/" \
    "file:///etc/xml/docbook" $CATALOG

usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Publishing//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-pub.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Greek Letters//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-grk1.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Box and Line Drawing//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-box.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Greek Symbols//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-grk3.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-amsn.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-num.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-grk4.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Diacritical Marks//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-dia.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Monotoniko Greek//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-grk2.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-amsa.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-amso.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Russian Cyrillic//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-cyr1.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES General Technical//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-tech.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-amsc.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Latin 1//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-lat1.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-amsb.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Latin 2//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-lat2.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-amsr.ent" $DOCBOOK_CATALOG  
usr/bin/xmlcatalog --noout --add "public" \
    "ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-4.1.2/ent/iso-cyr2.ent" $DOCBOOK_CATALOG  

usr/bin/xmlcatalog --noout --add "delegatePublic" \
    "ISO 8879:1986" \
    "file:///etc/xml/docbook" $CATALOG
