<?php
	/* 
		Sección de declaración de variables:
		Las variables en php no tienen tipo hasta que se les asigna un valor, 
		en el momento que se le asigna un valor ya no se le podrán cambiar a otro nuevo
		
	*/
	$nombre;
	$apellido1;
	$apellido2;
	$tortilla;
	$mayor;
	$publicidad;
	$recordarPasswd;
	$mensaje;
	$fichero;

	/* 
		Para recuperar los valores del formulario, tenemos que saber si es GET o POST en función del tipo tendremos que usar $_POST o $_GET (esto lo sabremos mirando el atributo method de la marca form), si usamos una distinta a la configurada, el programa dará error.
	*/
	$nombre = $_POST['nombre'];
	$apellido1 = $_POST['apellido1'];
	$apellido2 = $_POST['apellido2'];
	$tortilla = $_POST['tortilla'];
	$mayor = $_POST['mayorEdad'];
	$publicidad = $_POST['publi'];
	$recordarPasswd = $_POST['recordarPasswd'];
	$mensaje = $_POST['mensaje'];
	$fichero = $_POST['archivo'];

	/*
		Si existe un checbox que esta sin marcar, el php mostrará

		Warning: Undefined array key "publicidad" in E:\xampp\htdocs\accion.php on line 29
		
		Para nuestro caso esto no es un error.

	*/

	/* Componemos la nueva página web usando la sentencia echo y el operador de concatenación . y las marcas estudiandas anteriormente*/
	echo "<ul>";
	echo "<li>Nombre: " .$nombre. "</li>";
	echo "<li>Apellido 1: " .$apellido1. "</li>";
	echo "<li>Apellido 2: " .$apellido2. "</li>";
	echo "<li>Tortilla: " .$tortilla. "</li>";
	echo "<li>Mayor de edad: " .$mayor. "</li>";
	echo "<li>Admitir publicidad: " .$publicidad. "</li>";
	echo "<li>Recordar passwd: " .$recordarPasswd. "</li>";
	echo "<li>Mensaje: " .$mensaje. "</li>";
	echo "<li>Nombre fichero: " .$fichero. "</li>";
	echo "</ul>";

?>