( useradd postfix )
( groupadd postdrop )
( usermod -G mail postfix )
( chown root:postdrop /usr/sbin/postdrop )
( chown root:postdrop /usr/sbin/postqueue )
( chmod 2711 /usr/sbin/postdrop )
( chmod 2711 /usr/sbin/postqueue )
( chmod 0600 /etc/postfix/saslpass )
( /usr/sbin/postconf -c "/etc/postfix" -e \
        "alias_maps=hash:/etc/mail/aliases" \
        "alias_database=hash:/etc/mail/aliases" \
        "local_destination_concurrency_limit=2" \
        "default_destination_concurrency_limit=2" \
        "home_mailbox=Maildir/" )
