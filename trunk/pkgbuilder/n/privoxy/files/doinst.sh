( useradd privoxy -s /bin/false )
( groupadd privoxy )
( chown privoxy:privoxy var/log/privoxy )
( chown -R privoxy:privoxy etc/privoxy )
