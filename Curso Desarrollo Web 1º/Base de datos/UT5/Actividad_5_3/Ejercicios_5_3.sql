

/* 1. En la base de datos de la liga de baloncesto, realiza un procedimiento llamado partidos_jugados que devuelva para un equipo (ID_TEAM) 
	que le pasemos como argumento de entrada, por una parte, el número de partidos jugados por ese equipo como equipo local como parámetro de 
	salida JUGADOS_LOCAL y por otra parte como equipo visitante en el parámetro de salida JUGADOS_VISITANTE, para lo que se debe crear un cursor 
	que devuelva toda la información de todos los partidos jugados por el equipo tanto como local o como visitante.*/

CREATE OR REPLACE PROCEDURE 
    partidos_jugados (id_team IN NUMBER, jugados_local OUT NUMBER, jugados_visitantes OUT NUMBER) IS
    
   CURSOR partidos IS
        SELECT ID_EQUIPO_LOCAL EQUIPO_LOCAL,
               ID_EQUIPO_FUERA EQUIPO_VISITANTE
        FROM JUEGO
        WHERE (ID_EQUIPO_LOCAL = id_team OR ID_EQUIPO_FUERA = id_team);
        
     vCursorINTO partidos%ROWTYPE;   
        
    BEGIN
            
            jugados_local := 0;
            jugados_visitante := 0;
            
            OPEN partidos;
            
            LOOP
                
                FETCH partidos INTO vCursorINTO;
                EXIT WHEN partidos%NOTFOUND;
                
                IF id_team = vCursorInto.EQUIPO_LOCAL THEN
                    jugados_local := jugados_local + 1;
                    
                ELSIF id_team = vCursorINTO.EQUIPO_VISITANTE THEN
                    jugados_visitante := jugados_visitante + 1;
                END IF;
                    
            END LOOP;
            
            CLOSE partidos;
        END partidos_jugados;

SET SERVEROUTPUT ON;

    DECLARE 
        
        jugados_local NUMBER := 0;
        jugados_visitante NUMBER := 0;
    
    BEGIN
        partidos_jugados (1, jugados_local, jugados_visitante);
        DBMS_OUT.PUT_LINE('Jugados local: ' || jugados_local || ' jugados visitante: ' || jugados_visitante);
    END;
        
        

/* 2. En la base de datos de la liga de baloncesto, realiza una función llamada jugadores_posicion, que devuelva 
	el número de jugadores que juegan en una determinada posición pasada como parámetro de entrada. Debes usar un 
	cursor que devuelva todos los jugadores que juegan en la posición indicada.*/  
		
	CREATE OR REPLACE FUNCTION jugadores_posicion (pIdPosicion IN VARCHAR2) IS
        RETURN NUMBER IS
		
			numJugadores NUMBER DEFAULT  0;
		
		CURSOR cursor_jugador IS
		SELECT JUGADOR.NOMBRE NOMBRE_JUGADOR,
			   JUGADOR.POSICION POSICION_JUGADOR
		
		FROM JUGADOR
        
        WHERE();
        
        
        
/* 3. En la base de datos de la liga de baloncesto, realiza una función llamada arbitro_mas_partidos, que devuelva 
	el nombre del árbitro que más partidos ha arbitrado. Usa un cursor que devuelva el número de partidos arbitrados 
	por cada arbitro (nombre), y recorriéndolo, quédate con el árbitro que más partidos ha arbitrado.*/
	
	