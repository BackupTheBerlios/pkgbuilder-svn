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
            <div class="ttitle">Día de la Hispanidad</div>
            <div class="tleft"><b>Martes, 12 de Octubre de 2004</b></div>
            <div class="tleft">
                <p>Hoy en España celebramos el Día de la Hispanidad, fiesta nacional. Y para celebrarlo
                ya hay disponible una nueva versión de PkgBuilder. Después de mucho tiempo algo parado
                volvemos con fuerza.</p>
                <p>Esta nueva versión incluye KDE 3.3.0, Gnome 2.8.0, XFree86 4.4.0 y nuevas versiones de otras
                importantes aplicaciones como KDevelop 3.1.0 y Quanta 3.3.0 Abiword 2.0.12, Gnumeric 1.2.13,
                Anjuta 1.2.2, Evolution 2.0.1, nuevas versiones de los drivers ALSA 1.0.6a y muchos más.</p>
                <p><a href="http://download.berlios.de/pkgbuilder/pkgbuilder-20041012.tar.gz">pkgbuilder-20041012.tar.gz</a></p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nueva versión de PkgBuilder</div>
            <div class="tleft"><b>Domingo, 2 de Mayo de 2004</b></div>
            <div class="tleft">
                <p>Esta nueva versión incluye KDE 3.2.2, Gnome 2.6.0, XFree86 4.4.0 y nuevas versiones de otras
                importantes aplicaciones como KDevelop 3.0.3 y Quanta 3.2.2, Abiword 2.0.6, Gnumeric 1.2.11,
                Anjuta 1.2.2, Evolution 1.4.6, nuevas versiones de los drivers ALSA 1.0.4 y muchos más.</p>
                <p>Como nuevas funcionalidades destaca la opción -p en el script "install.sh" que permite
                instalar desde paquetes precompilados gestionando dependencias y una versión mejorada de
                la función de comparación de versiones.</p>
                <p><a href="http://download.berlios.de/pkgbuilder/pkgbuilder-20040502.tar.gz">pkgbuilder-20040502.tar.gz</a></p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Migración a subversion</div>
            <div class="tleft"><b>Sábado, 1 de Mayo de 2004</b></div>
            <div class="tleft">
                <p>Ya que berlios está empezando a ofrecer el servicio de subversion en lugar de CVS
                he decidido migrar a este sistema de control de versiones.</p>
                <p>Asi que apartir de ahora el único repositorio válido es el repositorio de subversion.</p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nueva versión de PkgBuilder</div>
            <div class="tleft"><b>Sábado, 21 de Marzo de 2004</b></div>
            <div class="tleft">
                <p>Esta nueva versión incluye KDE 3.2.1, Gnome 2.4.2 y nuevas versiones de otras
                importantes aplicaciones como KDevelor 3.0.2 y Quanta 3.2.1, Galeon 1.3.14, Evolution 1.4.6
                y nuevas versiones de los drivers ALSA 1.0.3.</p>
                <p>También se incluye en esta versión un script que actualiza todos los paquetes
                a la última versión disponible.</p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nueva versión de PkgBuilder</div>
            <div class="tleft"><b>Sábado, 15 de Febrero de 2004</b></div>
            <div class="tleft">
                <p>Esta nueva versión incluye las últimas versiones de los escritorios
                mas importantes, KDE 3.2, Gnome 2.4.2 y nuevas applicaciones como KOffice 1.3,
                KDevelor 3.0.0 y Quanta 3.2.0, Mozilla 1.6, Galeon 1.3.12, Epiphany 1.0.7, nuevas
                versiones de los drivers ALSA 1.0.2.</p>
                <p>Por otra parte también se incluye soporte de compilación paralela con distcc
                y ccache, para reducir el tiempo de compilación.</p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nuevas versiones de Mozilla y Epiphany</div>
            <div class="tleft"><b>Sábado, 17 de Enero de 2004</b></div>
            <div class="tleft">
                <p>Ya se encuentran en el CVS la nueva versión de Mozilla, 1.6 y la nueva
                versión de Epiphany que añade soporte a esta versión de Mozilla, la 1.0.7.</p>
            </div>
        </div>
    </div>
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Nueva versión de PkgBuilder</div>
            <div class="tleft"><b>Sábado, 10 de Enero de 2004</b></div>
            <div class="tleft">
                <p>Por fin ya hay una nueva versión de PkgBuilder
                <a href="http://download.berlios.de/pkgbuilder/pkgbuilder-20041001.tar.gz">disponible</a>.</p>

                <p>PkgBuilder ya es capaz de gestionar dependencias y verificar las
                sumas de verificación de los paquetes, también
                se han añadido una gran cantidad de paquetes nuevos, entre ellos montones
                de librerías, Gnome 2.4.1, KDE 3.2beta2, Evolution 1.4.5, Mozilla 1.5 y
                muchos <a href="packages.php">paquetes</a> más superando los 250 paquetes. De todas maneras,
                aún queda mucho por trabajor por hacer.</p>

                <p>En estos últimos meses PkgBuilder ha ido evolucionando y ya se le podría
                calificar como un arbol de ports más o menos completo. Aunque ahora mismo solo
                soporta Slackware Linux 9.0 y posteriores, mi intención es que en un futuro
                pueda instalarse en otras distribuciones y que cree paquetes de tipo rpm o
                deb, además de tgz.</p>
            </div>
        </div>
    </div>
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
