<?php
    include("header.php");
    include("side.php");
    include("footer.php");
?>

<?php site_header("main"); ?>

<div id="tmiddle">

    <?php site_side(); ?>

    <!--Content-->
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nueva versi�n de PkgBuilder</div>
            <div class="tleft"><b>S�bado, 15 de Febrero de 2004</b></div>
            <div class="tleft">
                <p>Esta nueva versi�n incluye las �ltimas versiones de los escritorios
                mas importantes, KDE 3.2, Gnome 2.4.2 y nuevas applicaciones como KOffice 1.3,
                KDevelor 3.0.0 y Quanta 3.2.0, Mozilla 1.6, Galeon 1.3.12, Epiphany 1.0.7, nuevas
                versiones de los drivers ALSA 1.0.2.</p>
                <p>Por otra parte tambi�n se incluye soporte de compilaci�n paralela con distcc
                y ccache, para reducir el tiempo de compilaci�n.</p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nuevas versiones de Mozilla y Epiphany</div>
            <div class="tleft"><b>S�bado, 17 de Enero de 2004</b></div>
            <div class="tleft">
                <p>Ya se encuentran en el CVS la nueva versi�n de Mozilla, 1.6 y la nueva
                versi�n de Epiphany que a�ade soporte a esta versi�n de Mozilla, la 1.0.7.</p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nueva versi�n de PkgBuilder</div>
            <div class="tleft"><b>S�bado, 10 de Enero de 2004</b></div>
            <div class="tleft">
                <p>Por fin ya hay una nueva versi�n de PkgBuilder 
                <a href="http://download.berlios.de/pkgbuilder/pkgbuilder-20041001.tar.gz">disponible</a>.</p>
                
                <p>PkgBuilder ya es capaz de gestionar dependencias y verificar las
                sumas de verificaci�n de los paquetes, tambi�n
                se han a�adido una gran cantidad de paquetes nuevos, entre ellos montones
                de librer�as, Gnome 2.4.1, KDE 3.2beta2, Evolution 1.4.5, Mozilla 1.5 y
                muchos <a href="packages.php">paquetes</a> m�s superando los 250 paquetes. De todas maneras,
                a�n queda mucho por trabajor por hacer.</p>
                
                <p>En estos �ltimos meses PkgBuilder ha ido evolucionando y ya se le podr�a
                calificar como un arbol de ports m�s o menos completo. Aunque ahora mismo solo
                soporta Slackware Linux 9.0 y posteriores, mi intenci�n es que en un futuro
                pueda instalarse en otras distribuciones y que cree paquetes de tipo rpm o
                deb, adem�s de tgz.</p>
            </div>
        </div>
    </div>
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
