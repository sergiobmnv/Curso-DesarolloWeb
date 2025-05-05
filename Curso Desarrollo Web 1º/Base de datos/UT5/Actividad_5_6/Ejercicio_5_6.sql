

/* 3 Crea un trigger que cada vez que se inserte un registro en la tabla DESCUENTO, 
	 en el caso que el importe sea negativo, (es decir, cuando el precio de venta sea 
	 mayor al vendido finalmente), se actualice el precio original del coche, aumentándolo en un 2%. */
	 
	 CREATE OR REPLACE TRIGGER actualizarImporte
	 AFTER INSERT ON DESCUENTO 
	 FOR EACH ROW
	 
	 BEGIN
		
		IF :NEW.IMPORTE < 0 THEN
			UPDATE COCHE CAR
			SET CAR.PRECIO = CAR.PRECIO + (CAR.PRECIO * 0.02)
			WHERE CAR.ID_COCHE = :NEW.ID_COCHE;
		END IF;
		
		
	 END actualizarImporte;