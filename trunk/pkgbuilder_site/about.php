<?php
    include("header.php");
    include("side.php");
    include("footer.php");
?>

<?php site_header("about"); ?>

<div id="tmiddle">
    <?php site_side(); ?>
    
    <!--Content-->
    <div id="tmain">
        <div class="tbox">
            <div class="ttitle">Acerca de PkgBuilder</div>            
            <div class="tleft">
                <p>Se podr�a decir que esto es el embri�n de un arbol de <b>ports</b> para 
                sistemas Linux, aunque ahora mismo se trata s�lo de una serie de <b>scripts 
                bash</b> que automatizan la construcci�n de paquetes.</p>
                
                <p>La idea surge de la necesidad de crear paquetes adicionales para 
                las diversas distribuciones de Linux al margen de los
                paquetes oficiales. Tambi�n es una forma sencilla de recordar c�mo demonios
                compil� la versi�n <code>X</code> del paquete <code>Y</code> hace <code>N</code> meses.</p>
                
                <p>Actualmente solo he testeado el sistema en 
                <a href="http://www.slackware.com/">Slackware</a>, 9.0 y 9.1, ya
                que es la distribuci�n que yo uso, pero no hay raz�n para pensar que no
                funcione en otra distribuci�n, los requisitos son muy escasos.</p>

                <p>El sistema es muy sencillo. Existe un script principal llamado
                <code>'build.sh'</code> al que se le pasan dos par�metros: el directorio 
                del packete que queremos compilar y la acci�n. Por ejemplo:</p>

                <blockquote><code># ./build.sh xap/aterm/0.4.2 fetch</code></blockquote>

                <p>Esto har� que se ejecute la acci�n <code>'fetch'</code> para la versi�n 0.4.2
                del paquete <code>'aterm'</code>.</p>

                <p>Si se omite la acci�n se ejecutar� la acci�n <code>'all'</code>.</p>

                <p>Existen varias acciones:</p>

                <ul>
                    <li> <code>info</code>: muestra informaci�n del paquete.</li>

                    <li> <code>fetch</code>: descarga los archivos necesarios para la compilaci�n
                        y creaci�n del paquete.</li>

                    <li> <code>uncompress</code>: descomprime los archivos necesarios.</li>

                    <li> <code>patch</code>: parchea los archivos necesarios para la compilaci�n.</li>

                    <li> <code>configure</code>: ejecuta el script configure del paquete.</li>

                    <li> <code>build</code>: ejecuta make.</li>

                    <li> <code>install</code>: ejecuta make install.</li>

                    <li> <code>postinstall</code>: ejecuta todas la acciones necesarias despu�s
                        de la instalaci�n del paquete.</li>

                    <li> <code>buildpkg</code>: genera el paquete <code>tgz</code> correspondiente listo para
                        su instalaci�n en el sistema. El paquete s�lo se generar�
                        si se ejecuta como superusuario.</li>

                    <li> <code>installpkg</code>: instala el paquete previamente generado por la
                        acci�n buildpkg. Solo funciona cuando se ejecuta como
                        superusuario.</li>

                    <li> <code>upgradepkg</code>: actualiza el paquete previamente generado. Solo 
                        funciona cuando se ejecuta como superusuario.</li>

                    <li> <code>clean</code>: realiza la limpieza de los archivos utilizados
                        para la compilaci�n y creaci�n del paquete.</li>

                    <li> <code>auto</code>: ejecuta autom�ticamente esta secuencia acciones:
                        fetch,
                        uncompress,
                        patch,
                        configure,
                        build,
                        install,
                        postinstall y
                        buildpkg</li>
                </ul>        

                <p>Por cada paquete existen dos archivos principales: <code>'config.sh'</code> 
                y <code>'build.sh'</code>. En <code>'config.sh'</code> se configuran las variables 
                necesarias para la compilaci�n y creaci�n del paquete. En
                <code>'build.sh'</code> se implementan una serie de metodos, uno por cada
                acci�n. Dentro de cada uno de esos m�todos est� la implementaci�n
                de la acci�n para ese paquete.</p>

                <p>Luego en el subdirectorio <code>'files'</code> se incluyen otro tipo de archivos
                necesarios para la creaci�n del paquete, como parches, scripts,
                archivos slack-desc, etc...</p>

                <p>El script principal, lee estos dos archivos y luego ejecuta
                el m�todo correspondiente a la acci�n indicada.</p>

                <p>Existen adem�s, dos scripts generales incluidos dentro del direc-
                torio <code>'scripts'</code>: <code>'config.sh'</code> y 
                <code>'functions.sh'</code>. <code>'config.sh'</code>
                configura las variables globales comunes necesarias y <code>'functions.sh'</code>
                incluye toda una serie de funciones �tiles para la compilaci�n
                y creaci�n de paquetes. Estas funciones se pueden utilizar en
                cada uno de los scripts <code>'build.sh'</code> para cada paquete. Actualmente
                estas son las funciones actualmente implementadas:</p>

                <ul>
                    <li> <code>version</code>: imprime por pantalla la versi�n.</li>

                    <li> <code>usage</code>: imprime la informaci�n de uso.</li>

                    <li> <code>include</code>: incluye la funci�n indicada como par�metro. Estas
                        funciones, son funciones genericas para relizar cada
                        una de las acciones. Se encuentran en el directorio
                        <code>'common'</code>.</li>

                    <li> <code>fetch</code>: descarga el archivo indicado en el par�metro $1
                        utilizando <code>'wget'</code>.</li>

                    <li> <code>gzip_map</code>: comprime todas las p�ginas de manual del directorio
                        que se pasa en como par�metro.</li>

                    <li> <code>strip_all</code>: realiza la funci�n strip en todos los archivos
                        binarios desde el directorio que se le pasa como par�metro.</li>
                </ul>

                <p>Esto no es m�s que una versi�n preliminar, ahora mismo s�lo
                hay unos pocos paquetes creados, pero puede llegar a ser �til.
                Tambi�n quisiera que esto se mantuviera igual de sencillo que
                es ahora, siguiendo la filosof�a <b>KISS</b>.</p>

                <p>Adem�s, cualquiera que se acerque un poco al codigo fuente ver�
                que no soy precisamente un gur� de la programaci�n en bash, pero
                siempre que lo he necesitado me he hecho mis propios scripts,
                no demasiados ortodoxos pero s� efectivos. Si notais que hay algo
                que se puede hacer mejor o eliminar cosas innecesarias, hacedmelo
                saber.</p>
                
            </div>
            <div class="tleft"><b>Last update: $Date: 2004/01/17 14:00:46 $</b></div>
        </div>
    </div>
</div>

<?php site_footer(); ?>
