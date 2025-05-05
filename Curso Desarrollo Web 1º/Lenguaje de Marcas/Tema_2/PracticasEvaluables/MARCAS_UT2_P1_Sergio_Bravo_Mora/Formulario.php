
<?php

$Nombre=$_GET['Nombre'];
$Apellido=$_GET['Apellido'];
$Semestre=$_GET['Semestre'];
$Carrera=$_GET['Carrera'];
$Sexo=$_GET['Sexo'];
$Fecha=$_GET['Fecha'];
$Leer=$_GET['Leer'];
$Cine=$_GET['Cine'];
$Videojuegos=$_GET['Videojuegos'];
$Deportes=$_GET['Deportes'];
$Moda=$_GET['Moda'];
$Fotografía=$_GET['Fotografía'];
$Correo=$_GET['Correo'];
$Contraseña=$_GET['Contraseña'];
$Fichero=$_GET['Fichero'];

	echo "<h1>DATOS FORMULARIO</h1>";
	echo "<ul>";
	echo "<li> Nombre:".$Nombre."</li>";
	echo "<li> Apellido:".$Apellido."</li>";
	echo "<li> Semestre:".$Semestre."</li>";
	echo "<li> Carrera:".$Carrera."</li>";
	echo "<li> Sexo:".$Sexo."</li>";
	echo "<li> Fecha:".$Fecha."</li>";
	echo "<li> Leer:".$Leer." ".$Fotografía." ".$Moda." ".$Videojuegos." ".$Deportes." ".$Cine." </li>";
	echo "<li> Correo:".$Correo."</li>";
	echo "<li> Contraseña:".$Contraseña."</li>";
	echo "<li> Fichero:".$Fichero."</li>";
	echo "</ul>";
	
?>