<?php
    include("header.php");
    include("side.php");
    include("footer.php");
?>

<?php site_header("principal"); ?>

<div id="tmiddle">

    <?php site_side(); ?>

    <!--Content-->
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">PkgBuilder alojado en BerliOS</div>
            <div class="tleft"><b>Domingo, 21 de Octubre de 2003</b></div>
            <div class="tleft">
                <p>Se podría decir que <b>pkgbuilder</b> es el embrión de un arbol de <b>ports</b> para 
                sistemas Linux, aunque ahora mismo 
                se trata sólo de una serie de scripts bash que automatizan la construcción 
                de paquetes.</p>
                
                <p>La idea surge de la necesidad de crear paquetes adicionales para 
                las diversas distribuciones de Linux al margen de los
                paquetes oficiales. También es una forma sencilla de recordar cómo demonios
                compilé la versión <code>X</code> del paquete <code>Y</code> hace <code>N</code> meses.</p>
                
                <p>Antes solo podía ir liberando de vez en cuando algún tgz, pero ahora
                que el proyecto está alojado en <a href="http://developer.berlios.de/">BerliOS</a>
                 ya hay un servidor de <b>CVS</b> anónimo
                para que podais trabajar directamente con lo último de lo último. De todas
                formas iré creando periodicamente algún paquete tgz.</p>
                
                <p>Espero que esto pueda seros útil en algún momento y por favor, no dudeis
                en contactar conmigo para cualquier cosa, ya sean bugs, sugerencias, ayuda.</p>
                
                <p>Hablando de ayuda, necesitaría a alguien que pudiera traducir mis textos
                de castellano a inglés. Mi inglés es malo tirando a pésimo :)</p>
            </div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
