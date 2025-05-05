


/* 1 Usando la base de datos de la liga de baloncesto, haz un trigger que cada vez que se inserte el 
		resultado de un partido (tabla JUEGO), se actualice el campo PUNTOS de la tabla EQUIPO sumando 1 punto al equipo que haya ganado el partido.
		Indica una sentencia para probar que el trigger funciona. */

	CREATE OR REPLACE TRIGGER actualizarPuntos
    AFTER INSERT ON JUEGO
    FOR EACH ROW
    
    BEGIN
		IF :NEW.PUNTOS_EQUIPO_LOCAL > :NEW.PUNTOS_EQUIPO_FUERA THEN
            UPDATE EQUIPO
            SET PUNTOS = PUNTOS + 1
            WHERE ID_EQUIPO = :NEW.ID_EQUIPO_LOCAL;
		END IF;
    END actualizarPuntos;
    
    
    SELECT PUNTOS
    FROM EQUIPO
    WHERE ID_EQUIPO = 13;
    
    
    INSERT INTO JUEGO (ID_JUEGO, ID_EQUIPO_LOCAL, ID_EQUIPO_FUERA, ID_ARBITRO, PUNTOS_EQUIPO_LOCAL, PUNTOS_EQUIPO_FUERA)
                        VALUES (1000, 13, 11, 22, 98, 58, '20/04/2022')
						
						
/* 2 Usando la base de datos de la inmobiliaria, haz un trigger que cada vez que se elimine un movimiento, 
	se recalcule la comisión del agente asociado al movimiento eliminado.
	Tener en cuenta que solo se debe recalcular la comisión si el movimiento que se elimina es de una fecha 
	de un mes anterior al actual, ya que la comisión se calcula el último día del mes.
	Para recalcular la comisión, se ha de restar al importe de la comisión el 5% del total del precio del movimiento afectado.
	Indica una sentencia para probar que el trigger funciona. */
		
	CREATE OR REPLACE TRIGGER calcularComision
	AFTER DELETE ON MOVIMIENTO 
	FOR EACH ROW 
	
	BEGIN
	
	END calcularComision;