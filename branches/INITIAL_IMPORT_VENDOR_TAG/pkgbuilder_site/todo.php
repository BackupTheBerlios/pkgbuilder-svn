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
                <p>Esta es una peque�a lista de paquete y funcionalidades que quedan por hacer.</p>
                
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
                    <li>Verificaci�n de checksum</li>
                    <li>Dependencia entre acciones</li>
                    <li>Resoluci�n de dependencias entre paquetes</li>
                </ul>
                <div class="tleft"><b>�ltima modificacion: Domingo, 21 de Octubre de 2003</b></div>
            </div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
