<?php
    include("header.php");
    include("side.php");
    include("footer.php");
?>

<?php site_header("todo"); ?>

<div id="tmiddle">

    <?php site_side(); ?>
    
    <!--Content-->
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Todo</div>
            <div class="tleft">
                <p>Esta es una pequeña lista de paquete y funcionalidades que quedan por hacer.</p>
                
                <p><b>Paquetes:</b></p>
                <ul>
                    <li>evolution</li>
                    <li>squid</li>
                    <li>apache2</li>
                    <li>xawdecode</li>
                    <li>xawtv</li>
                    <li>openldap</li>
                    <li>ksensors</li>
                    <li>partimage</li>
                    <li>courier-imap</li>
                    <li>PyGTK2</li>
                    <li>dia</li>
                </ul>
                <p><b>Funcionalidades:</b></p>
                <ul>
                    <li>Verificación de checksum</li>
                    <li>Dependencia entre acciones</li>
                    <li>Resolución de dependencias entre paquetes</li>
                </ul>
                <div class="tleft"><b>Última modificacion: Domingo, 21 de Octubre de 2003</b></div>
            </div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
