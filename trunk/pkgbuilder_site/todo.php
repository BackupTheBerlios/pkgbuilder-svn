<?php
    include("header.php");
    include("side.php");
    include("footer.php");
?>

<?php site_header("To do list"); ?>

<div id="tmiddle">

    <?php site_side(); ?>
    
    <!--Content-->
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">To do list</div>
            <div class="tleft">
                <p><b>Tasks:</b></p>
                <ul>
                    <li>Test, test, test :)</li>
                    <li>Create new packages</li>
                </ul>
                <p><b>Packages:</b></p>
                <ul>
                    <li>a2ps</li>
                    <li>acpid</li>
                    <li>animail</li>
                    <li>apache</li>
                    <li>apsfilter</li>
                    <li>ash</li>
                    <li>at</li>
                    <li>aumix</li>
                    <li>autoconf</li>
                    <li>automake</li>
                    <li>bash</li>
                    <li>bin</li>
                    <li>bin86</li>
                    <li>bind</li>
                    <li>binutils</li>
                    <li>bison</li>
                    <li>byacc</li>
                    <li>bzip2</li>
                    <li>coreutils</li>
                    <li>courier</li>
                    <li>cpio</li>
                    <li>cvs</li>
                    <li>db2</li>
                    <li>db4</li>
                    <li>dcron</li>
                    <li>devfsd</li>
                    <li>devs</li>
                    <li>dhcp</li>
                    <li>dhcpd</li>
                    <li>diffutils</li>
                    <li>e2fsprogs</li>
                    <li>emacs</li>
                    <li>epic4</li>
                    <li>exim</li>
                    <li>fetchmail</li>
                    <li>findutils</li>
                    <li>flex</li>
                    <li>fvwm</li>
                    <li>gawk</li>
                    <li>gdb</li>
                    <li>gdm</li>
                    <li>getmail</li>
                    <li>ghex</li>
                    <li>gimp</li>
                    <li>glade</li>
                    <li>glut</li>
                    <li>gnome2-user-docs</li>
                    <li>gnome-extra-themes</li>
                    <li>gnome-mag</li>
                    <li>gnome-speech</li>
                    <li>gnome-vfs-extras</li>
                    <li>gnopernicus</li>
                    <li>gnucash</li>
                    <li>gnuchess</li>
                    <li>gnuplog</li>
                    <li>gok</li>
                    <li>gpdf</li>
                    <li>grep</li>
                    <li>groff</li>
                    <li>gucharmap</li>
                    <li>gv</li>
                    <li>gzip</li>
                    <li>hdparm</li>
                    <li>hotplug</li>
                    <li>inetd</li>
                    <li>infozip</li>
                    <li>iptraf</li>
                    <li>isapnptools</li>
                    <li>j2sdk</li>
                    <li>jed</li>
                    <li>jfstools</li>
                    <li>joe</li>
                    <li>kdb</li>
                    <li>less</li>
                    <li>lftp</li>
                    <li>libdv</li>
                    <li>libdvdnav</li>
                    <li>libdvdread</li>
                    <li>libgail-gnome</li>
                    <li>libgda</li>
                    <li>libtermcap</li>
                    <li>libtool</li>
                    <li>lilo</li>
                    <li>logrotate</li>
                    <li>lprng</li>
                    <li>lsof</li>
                    <li>lvm</li>
                    <li>m4</li>
                    <li>make</li>
                    <li>man</li>
                    <li>man-pages</li>
                    <li>mc</li>
                    <li>minicom</li>
                    <li>module-init-tools</li>
                    <li>mysql</li>
                    <li>nail</li>
                    <li>nas</li>
                    <li>nc</li>
                    <li>ncurses</li>
                    <li>netwatch</li>
                    <li>nfs-utils</li>
                    <li>nn</li>
                    <li>openldap</li>
                    <li>openssl</li>
                    <li>pan</li>
                    <li>pciutils</li>
                    <li>pcmcia-cs</li>
                    <li>perl</li>
                    <li>php</li>
                    <li>pine</li>
                    <li>pmake</li>
                    <li>postgresql</li>
                    <li>ppp</li>
                    <li>procmail</li>
                    <li>procps</li>
                    <li>proftpd</li>
                    <li>psutils</li>
                    <li>pure-ftpd</li>
                    <li>qmail</li>
                    <li>qpopper</li>
                    <li>quota</li>
                    <li>rcs</li>
                    <li>reiserfsprogs</li>
                    <li>rp-pppoe</li>
                    <li>rxvt</li>
                    <li>sane</li>
                    <li>sawfish</li>
                    <li>sed</li>
                    <li>sendmail</li>
                    <li>shadow</li>
                    <li>slocate</li>
                    <li>sudo</li>
                    <li>sysklogd</li>
                    <li>syslinux</li>
                    <li>tar</li>
                    <li>tcpip</li>
                    <li>texinfo</li>
                    <li>tin</li>
                    <li>traceroute</li>
                    <li>trn</li>
                    <li>usb-utils</li>
                    <li>use</li>
                    <li>utempter</li>
                    <li>util-linux</li>
                    <li>w3m</li>
                    <li>wget</li>
                    <li>wireless-tools</li>
                    <li>workbone</li>
                    <li>wvdial</li>
                    <li>wvstreams</li>
                    <li>xfce</li>
                    <li>xfsprogs</li>
                    <li>xine</li>
                    <li>xsane</li>
                    <li>zenity</li>
                    <li>zlib</li>
                </ul>
                <div class="tleft"><b>Last update: $Date: 2004/02/15 13:46:53 $</b></div>
            </div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
