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
                <p>Se podr�a decir que <b>pkgbuilder</b> es el embri�n de un arbol de <b>ports</b> para 
                sistemas Linux, aunque ahora mismo 
                se trata s�lo de una serie de scripts bash que automatizan la construcci�n 
                de paquetes.</p>
                
                <p>La idea surge de la necesidad de crear paquetes adicionales para 
                las diversas distribuciones de Linux al margen de los
                paquetes oficiales. Tambi�n es una forma sencilla de recordar c�mo demonios
                compil� la versi�n <code>X</code> del paquete <code>Y</code> hace <code>N</code> meses.</p>
                
                <p>Antes solo pod�a ir liberando de vez en cuando alg�n tgz, pero ahora
                que el proyecto est� alojado en <a href="http://developer.berlios.de/">BerliOS</a>
                 ya hay un servidor de <b>CVS</b> an�nimo
                para que podais trabajar directamente con lo �ltimo de lo �ltimo. De todas
                formas ir� creando periodicamente alg�n paquete tgz.</p>
                
                <p>Espero que esto pueda seros �til en alg�n momento y por favor, no dudeis
                en contactar conmigo para cualquier cosa, ya sean bugs, sugerencias, ayuda.</p>
                
                <p>Hablando de ayuda, necesitar�a a alguien que pudiera traducir mis textos
                de castellano a ingl�s. Mi ingl�s es malo tirando a p�simo :)</p>
            </div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
