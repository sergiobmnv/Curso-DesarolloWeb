
--TRIGGERS
-- Ejercicio 1 :

CREATE OR REPLACE TRIGGER DISPARADOR_EJERCICIO_1

AFTER INSERT ON MINIATURAS
FOR EACH ROW
    
DECLARE

    NOMBRE COLECCIONES.NOMBRE%TYPE;
    CONTADOR COMENTARIOS.COMENTARIO_ID%TYPE;
    
BEGIN 

    SELECT COLEC.NOMBRE NOMBRE_COLECCION
    INTO NOMBRE
    FROM COLECCIONES COLEC
    WHERE COLEC.coleccion_id = :NEW.COLECCION_ID;
    
    IF COLECCIONES = 'Dragones Antiguos' THEN 
        
        SELECT MAX (COMEN.COMENTARIO_ID)
        INTO CONTADOR
        FROM COMENTARIO COMEN;
        INSERT INTO COMENTARIOS VALUES(CONTADOR + 1, 'NUEVA MINIATURA DE DRAGONES AÑADAIDA', SYSDATE, NULL);
        COMMIT;
    END IF;

END DISPARADOR_EJERCICIO_1;


-- Ejercicio 2 :

CREATE OR REPLACE TRIGGER DISPARADOR_EJERCICIO_2

BEFORE DELETE ON USUARIOS
DECLARE 

    COLECCION NUMBER := 0;

BEGIN
    
    SELECT COUNT(1)
    INTO COLECCION
    FROM USUARIOS USU INNER JOIN COLECCIONES COLEC
            ON USU.USUARIO_ID = COLEC.USUARIO_ID
    WHERE COLEC.USUARIO_ID = :OLD.USUARIO_ID;
    
    IF COLECCION > 0 THEN 
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('No se puede eliminar un usuario con colecciones');
    END IF;

END DISPARADOR_EJERCICIO_2;

-- Ejercicio 3 :

CREATE TABLE LOGS (
    ID_FABRICANTE NUMBER PRIMARY KEY,
    NOMBRE_OLD VARCHAR2(20),
    NOMBRE_NEW VARCHAR2(20),
    FECH_ACTU DATE
    
);


CREATE OR REPLACE TRIGGER EJERCICIO_3
AFTER UPDATE ON FABRICANTES
FOR EACH ROW 

DECLARE

BEGIN 
    
    INSERT INTO LOGS (ID_FABRICANTE, NOMBRE_OLD, NOMBRE_NEW, FECH_ACTU)
    VALUES (:OLD.ID_FABRICANTE, :OLD.NOMBRE, :NEW.NOMBRE, SYSDATE);
    COMMIT;
    
END EJERCICIO_3;


-- Ejercicio 4 :

/*Crea un disparador que se ejecute antes de insertar un nuevo comentario. 
Si el comentario tiene más de 500 caracteres, debe truncar el texto a 500 caracteres y añadir "..." al final.
*/

CREATE OR REPLACE TRIGGER  EJERCICIO_4
BEFORE INSERT ON COMENTARIOS
FOR EACH ROW 

BEGIN
    IF LENGTH(:NEW.TEXTO) > 500 THEN
        :NEW.TEXTO := SUBSTR (:NEW.TEXTO, 1, 497) || '...';
    END IF;

END EJERCICIO_4;


-- Ejercicio 5 : 

/* 
Crea un disparador que se dispare después de actualizar en la tabla miniatura. 
El disparador debe actualizar automáticamente la fecha de creación de la miniatura a la fecha actual.
*/

CREATE OR REPLACE TRIGGER EJERCICIO_5
AFTER UPDATE ON MINIATURAS
FOR EACH ROW

DECLARE

BEGIN
    UPDATE MINIATURAS
    SET ANIO = TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) 
    WHERE MINIATURA_ID = :OLD.MINIATURA_ID;
    
END EJERCICIO_5;

--CURSORES.

-- Ejercicio : 1

/* 
Crea un procedimiento llamado reporte_comentarios_usuarios que genere un reporte con 
los comentarios de todos los usuarios. El procedimiento debe recorrer todos los usuarios 
y para cada usuario, recorrer todos sus comentarios e insertarlos en una tabla de reportes.
*/

CREATE OR REPLACE PROCEDURE reporte_comentarios_usuarios IS
    CURSOR cUsuario IS
        SELECT USU.USUARIO_ID IDENTIFICADOR,
                USU.NOMBRE NOMBRE
        FROM USUARIO USU;
        
    vIntoUsuario cUsuario%TYPE;
    
    CURSOR cComentarioUsuario(id_usuario IN NUMBER ) IS
        SELECT COMEN.COMENTARIO_ID IDENTIFICADOR,
                COMEN.TEXTO TEXTO,
                COMEN.FECHA FECHA
        FROM COMENTARIOS COMEN
        WHERE COMEN.USUARIO_ID = id_usuario;
        
        vIntoComentarioUsua cComentarioUsuario%TYPE;
BEGIN
    OPEN cUsuarios
    
    LOOP
        FETCH cUsuarios INTO vIntoUsuario;
        EXIT WHEN cUsuarios%NOTFOUND;
        
        OPEN cComentarioUsuario(vIntoUsuario.IDENTIFICADOR);
        
        LOOP
            FETCH cComentarioUsuario INTO vIntoComentatioUsua;
            EXIT WHEN cComentarioUsuario%NOTFOUND;
            
            INSERT INTO reportes_comentarios (reporte_id, usuario_id, comentario_id, texto, fecha_comentario)
            VALUES (seq_reportes)
            COMMIT;
        END LOOP
        
        CLOSE cComentarioUsuario;
        
    END LOOP 
    CLOSE cUsuarios;
END reporte_comentarios_usuarios;


--Ejercicio : 2

/* 
Crea un procedimiento llamado reporte_miniaturas_fabricantes que genere un reporte con 
las miniaturas producidas por cada fabricante. El procedimiento debe recorrer todos los 
fabricantes y para cada fabricante, recorrer todas sus miniaturas e insertarlas en una tabla de reportes.
*/
        
CREATE OR REPLACE PROCEDURE reporte_miniaturas_fabricantes IS

CURSOR cCursorFabricantes IS
    SELECT FAB.FABRICANTE_ID IDENTIFICADOR
    FROM FABRICANTES FAB;
    VARIABLE1 cCursorFabricantes%TYPE; 

CURSOR cCursorInformacion1 (FABRICANTE1 IN FABRICANTES.FABRICANTE_ID%TYPE) IS
    SELECT MIN.MINIATURA_ID,
            MIN.NOMBRE,
            MIN ANIO
    FROM MINIATURAS MIN
    WHERE MIN.FABRICANTE_ID = FABRICANTE1;
    VARIABLE2 cCursorInformacion1%TYPE;
    
BEGIN

    OPEN cCursorFabricantes;
        LOOP
            FETCH cCursorFabricantes INTO VARIABLE1;
            EXIT WHEN cCursorFabricantes%NOTFOUND;
            
            OPEN cCursorInformacion1 (VARIABLE1.IDENTIFICADOR);
            LOOP
                FETCH cCursorInformacion1 INTO VARIABLE2;
                EXIT WHEN cCursorInformacion1%NOTFOUND;
                INSERT REPORTES_MINIATURAS (REPORTE_ID, FABRICANTE_ID, MINIATURA_ID, FECHA_FABRICACION);
                VALUES (seq_reportes_miniaturas.NEXTVAL, VARIABLE1.IDENTIFICADOR, VARIABLE2.MINIATURA_ID, VARIABLE2.NOMBRE, VARIABLE2.ANIO);
                COMMIT;
            END LOOP;
            
            CLOSE cCursorInformacion1;
        END LOOP;
    CLOSE cCursorFabricantes;

END reporte_miniaturas_fabricantes;









