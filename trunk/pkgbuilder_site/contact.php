<?php
    include("header.php");
    include("side.php");
    include("footer.php");
?>

<?php site_header("contacto"); ?>

<div id="tmiddle">

    <?php site_side(); ?>
    
    <!--Content-->
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Contacto</div>
            <div class="tleft">
                <p>Si te interesa contribuir con tus propios paquetes para <b>pkgbuilder</b>
                o quieres reportar fallos o enviar parches enviadme un correo a esta dirección:</p>
                <blockquote><code>tomby (AT) mail.berlios.de</code></blockquote>
            </div>
            <div class="tleft"><b>Última modificación: $Date: 2003/10/31 19:21:13 $</b></div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
