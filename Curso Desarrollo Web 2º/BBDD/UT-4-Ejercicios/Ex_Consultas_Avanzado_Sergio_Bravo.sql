
-- 1) Obtener todos los clientes que han gastado más de 50€ en productos, simpre y cuando el cliente haya nacido en los 90 y el stock del producto
-- 		sea superior a 5. Ordenalos de mayor a menor en funcion del dinero gastado (1.5 Puntos)

SELECT CLI.ID_CLIENTE AS ID_CLIENTE, CLI.FECHA_NAC AS FECHA_NACIMIENTO, PROD.STOCK AS STOCK_DEL_PRODUCTO
FROM CLIENTE AS CLI
INNER JOIN PEDIDO AS PED
	ON CLI.ID_CLIENTE = PED.ID_CLIENTE
INNER JOIN PRODUCTO AS PROD
	ON PROD.ID_PRODUCTO = PED.ID_PRODUCTO
WHERE CLI.ID_CLIENTE = PED.ID_CLIENTE AND PED.ID_PRODUCTO = PROD.ID_PRODUCTO 
		AND YEAR(CLI.FECHA_NAC = 1990) 
        AND PROD.STOCK >= 5
ORDER BY PED.CANTIDAD ASC;

-- 2) Obtener el nombre de los productos que tengan un stock por debajo de la media del stock de todos los productos (1.5 Puntos) 

SELECT PROD.NOMBRE AS NOMBRE_PRODUCTO, PROD.STOCK AS MEDIA_DEL_STOCK
FROM PRODUCTO AS PROD
WHERE PROD.STOCK >= 45;

-- 3) Obtener todos los clientes y de aquellos que han realizado algún pedido, mostrar el nombre del producto (1.5 Puntos) 

SELECT CLI.NOMBRE AS NOMBRE_DEL_CLIENTE, PROD.NOMBRE AS NOMBRE_DEL_PRODUCTO
FROM CLIENTE AS CLI
INNER JOIN PEDIDO AS PED
	ON CLI.ID_CLIENTE = PED.ID_CLIENTE
INNER JOIN PRODUCTO AS PROD
	ON PED.ID_PRODUCTO = PROD.ID_PRODUCTO
WHERE CLI.ID_CLIENTE = PED.ID_CLIENTE 
		AND PED.ID_PRODUCTO = PROD.ID_PRODUCTO
		AND PED.ID_PEDIDO > 2;

-- 4) Devuelve la informacion de todos los ingredientes que tengan un stock superior a 20 o sus productos tengan un stock inferior a 10, 
-- 		y dichos ingredientes se utilicen en más de 2 productos (2 Puntos)

SELECT ING.ID_INGREDIENTE AS ID_DEL_INGREDIENTE, ING.STOCK AS STOCK_DEL_INGREDIENTE, PROD.ID_PRODUCTO AS ID_DEL_PRODUCTO_USADO
FROM INGREDIENTE AS ING
INNER JOIN RECETA AS REC
	ON ING.ID_INGREDIENTE = REC.INGREDIENTE
INNER JOIN PRODUCTO AS PROD
	ON PROD.ID_PRODUCTO = REC.PRODUCTO
WHERE ING.ID_INGREDIENTE = REC.INGREDIENTE 
		AND PROD.ID_PRODUCTO = REC.PRODUCTO
        AND ING.STOCK > 20;

-- 5) Crea una consulta para conocer a los mejores proveedores, desde el que mas ingredientes ha vendido hasta el menos. Si hubiese algun empate con el numero
-- 		de ingredientes, se ordenara segun el stock total que tengan sus ingredientes (2 Puntos) 

SELECT PROV.NOMBRE AS NOMBRE_PROVEEDOR
FROM PROVEEDOR AS PROV
INNER JOIN INGREDIENTE AS ING
	ON PROV.ID_PROVEEDOR = ING.ID_PROVEEDOR
WHERE PROV.ID_PROVEEDOR = ING.ID_PROVEEDOR 
		AND ING.STOCK > 50;

-- 6) Incrementa el stock en 10 unidades de todos aquellos productos que hayan sido elaborados por ingredientes del proveedor Gallinas de corral (2 Puntos) 

SELECT PROD.STOCK AS INCREMENTO_DEL_STOCK
FROM PROVEEDOR AS PROV
INNER JOIN INGREDIENTE AS ING
	ON PROV.ID_PROVEEDOR = ING.ID_PROVEEDOR
INNER JOIN RECETA AS REC
	ON ING.ID_INGREDIENTE = REC.INGREDIENTE
INNER JOIN PRODUCTO AS PROD






