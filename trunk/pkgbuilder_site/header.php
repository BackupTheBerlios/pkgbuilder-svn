<?php function site_header($title = "") { ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">

<head>
    <title>pkgbuilder - <?php print $title ?></title>
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-15" />
    <meta name="author" content="tomby" />
    <meta name="generator" content="NEdit" />
    <link rel="stylesheet" href="styles/style.css" type="text/css" />
</head>

<body>

<div id="ttop">
    <!--Header-->
    <div class="tbanner">
        <img src="images/lazo-negro.jpg" width="43" height="63" alt="LazoNegro" />
    </div>
    <div class="theader">
        <a href="index.php"><img src="images/pkgbuilder.png" width="345" height="85" alt="pkgbuilder" /></a>
    </div>
</div>

<?php } ?>
