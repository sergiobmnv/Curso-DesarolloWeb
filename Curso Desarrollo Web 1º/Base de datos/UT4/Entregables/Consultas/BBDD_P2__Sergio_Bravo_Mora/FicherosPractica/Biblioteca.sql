CREATE TABLE TEMAS(
  ID_TEMA NUMBER,
  DESCRIPCCION VARCHAR2(200),
  CONSTRAINT PK_TEMA PRIMARY KEY(ID_TEMA)
);

COMMENT ON TABLE TEMAS IS 'Tabla de temas';
COMMENT ON COLUMN TEMAS.ID_TEMA IS 'IDENTIFICADOR DEL TEMA';
COMMENT ON COLUMN TEMAS.DESCRIPCCION IS 'DESCRIPCCION DEL TEMA';

CREATE TABLE EDITORIAL(
  ID_EDITORIAL NUMBER,
  NOMBRE VARCHAR2(200),
  CONSTRAINT PK_EDITORIAL PRIMARY KEY (ID_EDITORIAL)
);

COMMENT ON TABLE EDITORIAL IS 'Tabla de editoriales';
COMMENT ON COLUMN EDITORIAL.ID_EDITORIAL IS 'IDENTIFICADOR DE LA EDITORIAL';
COMMENT ON COLUMN EDITORIAL.NOMBRE IS 'NOMBRE DE LA EDITORIAL';

CREATE TABLE EJEMPLARES(
  ID_EJEMPLAR NUMBER,
  NUM_EJEMPLARES NUMBER,
  CONSTRAINT PK_EJEMPLARES PRIMARY KEY (ID_EJEMPLAR)
);

COMMENT ON TABLE EJEMPLARES IS 'Tabla de ejemplares';
COMMENT ON COLUMN EJEMPLARES.ID_EJEMPLAR IS 'IDENTIFICADOR DEL EJEMPLAR';
COMMENT ON COLUMN EJEMPLARES.NUM_EJEMPLARES IS 'NUMERO DE EJEMPLARES';

CREATE TABLE ESTADO(
  ID_ESTADO NUMBER,
  DESCRIPCCION VARCHAR2(150),
  CONSTRAINT PK_ESTADO PRIMARY KEY(ID_ESTADO)
);

COMMENT ON TABLE ESTADO IS 'Tabla de estados';
COMMENT ON COLUMN ESTADO.ID_ESTADO IS 'IDENTIFICADOR DEL ESTADO';
COMMENT ON COLUMN ESTADO.DESCRIPCCION IS 'DESCRIPCCION DEL ESTADO';

CREATE TABLE SOCIOS(
  DNI VARCHAR2(20),
  NOMBRE VARCHAR2(50),
  APELLIDOS VARCHAR2(100),
  FECHA_NACIMIENTO DATE,
  FECHA_ALTA DATE,
  SEXO VARCHAR2(1),
  ID_ESTADO NUMBER,
  CONSTRAINT PK_SOCIOS PRIMARY KEY(DNI),
  CONSTRAINT FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES ESTADO(ID_ESTADO)
);

COMMENT ON TABLE SOCIOS IS 'Tabla de socios';
COMMENT ON COLUMN SOCIOS.DNI IS 'DNI DEL SOCIO';
COMMENT ON COLUMN SOCIOS.NOMBRE IS 'NOMBRE DEL SOCIO';
COMMENT ON COLUMN SOCIOS.APELLIDOS IS 'APELLIDOS DEL SOCIO';
COMMENT ON COLUMN SOCIOS.FECHA_NACIMIENTO IS 'FECHA_NACIMIENTO DEL SOCIO';
COMMENT ON COLUMN SOCIOS.FECHA_ALTA IS 'FECHA_ALTA DEL SOCIO';
COMMENT ON COLUMN SOCIOS.SEXO IS 'SEXO DEL SOCIO';
COMMENT ON COLUMN SOCIOS.ID_ESTADO IS 'ESTADO DEL SOCIO';

CREATE TABLE EMPLEADO(
  NUM_EMPLEADO NUMBER,
  NOMBRE VARCHAR2(50),
  APELLIDOS VARCHAR2(100),
  FECHA_ALTA DATE,
  FECHA_BAJA DATE,
  OBSERVACIONES VARCHAR2(200),
  CONSTRAINT PK_EMPLEADO PRIMARY KEY(NUM_EMPLEADO)
);

COMMENT ON TABLE EMPLEADO IS 'Tabla de empleados';
COMMENT ON COLUMN EMPLEADO.NUM_EMPLEADO IS 'NUMERO DEL EMPLEADO';
COMMENT ON COLUMN EMPLEADO.NOMBRE IS 'NOMBRE DEL EMPLEADO';
COMMENT ON COLUMN EMPLEADO.APELLIDOS IS 'APELLIDOS DEL EMPLEADO';
COMMENT ON COLUMN EMPLEADO.FECHA_ALTA IS 'FECHA_ALTA DEL EMPLEADO';
COMMENT ON COLUMN EMPLEADO.FECHA_BAJA IS 'FECHA_BAJA DEL EMPLEADO';
COMMENT ON COLUMN EMPLEADO.OBSERVACIONES IS 'OBSERVACIONES DEL EMPLEADO';


CREATE TABLE LIBROS(
  ISBN VARCHAR2(50),
  TITULO VARCHAR2(100),
  AUTOR VARCHAR2(100),
  ID_TEMA NUMBER,
  ID_EDITORIAL NUMBER,
  FECHA_ALTA DATE,
  FECHA_COMPRA DATE,
  ID_EJEMPLAR NUMBER,
  CONSTRAINT PK_LIBROS PRIMARY KEY (ISBN),
  CONSTRAINT FK_TEMA FOREIGN KEY(ID_TEMA) REFERENCES TEMAS(ID_TEMA),
  CONSTRAINT FK_EDITORIAL FOREIGN KEY(ID_EDITORIAL) REFERENCES EDITORIAL(ID_EDITORIAL),
  CONSTRAINT FK_EJEMPLAR FOREIGN KEY(ID_EJEMPLAR) REFERENCES EJEMPLARES(ID_EJEMPLAR)
);

COMMENT ON TABLE LIBROS IS 'Tabla de libros';
COMMENT ON COLUMN LIBROS.ISBN IS 'ISBN DEL LIBRO';
COMMENT ON COLUMN LIBROS.AUTOR IS 'AUTOR DEL LIBRO';
COMMENT ON COLUMN LIBROS.ID_TEMA IS 'TEMA DEL LIBRO';
COMMENT ON COLUMN LIBROS.ID_EDITORIAL IS 'EDITORIAL DEL LIBRO';
COMMENT ON COLUMN LIBROS.FECHA_ALTA IS 'FECHA DE ALTA DEL LIBRO';
COMMENT ON COLUMN LIBROS.FECHA_COMPRA IS 'FECHA DE COMPRA DEL LIBRO';
COMMENT ON COLUMN LIBROS.ID_EJEMPLAR IS 'EJEMPLAR DEL LIBRO DEL LIBRO';

CREATE TABLE PRESTAMO(
  FECHA_INICIO DATE,
  FECHA_FIN DATE,
  FECHA_PRESTAMO DATE,
  ISBN VARCHAR2(50),
  DNI VARCHAR2(20),
  NUM_EMPLEADO NUMBER,
  CONSTRAINT PK_PRESTAMO PRIMARY KEY (FECHA_PRESTAMO,ISBN,DNI),
  CONSTRAINT FK_LIBROS FOREIGN KEY (ISBN) REFERENCES LIBROS(ISBN),
  CONSTRAINT FK_SOCIOS FOREIGN KEY (DNI) REFERENCES SOCIOS(DNI),
  CONSTRAINT FK_EMPLEADO FOREIGN KEY (NUM_EMPLEADO) REFERENCES EMPLEADO(NUM_EMPLEADO) 
);

COMMENT ON TABLE PRESTAMO IS 'Tabla de prestamos';
COMMENT ON COLUMN PRESTAMO.FECHA_INICIO IS 'Fecha del inicio del prestamo';
COMMENT ON COLUMN PRESTAMO.FECHA_FIN IS 'Fecha del fin del prestamo';
COMMENT ON COLUMN PRESTAMO.FECHA_PRESTAMO IS 'Fecha del prestamo';
COMMENT ON COLUMN PRESTAMO.ISBN IS 'Identificador del libro prestado';
COMMENT ON COLUMN PRESTAMO.DNI IS 'Dni del socio del prestamo';
COMMENT ON COLUMN PRESTAMO.NUM_EMPLEADO IS 'Numero del empleado que realiza el prestamos';



INSERT INTO TEMAS VALUES(1,'Histórico');
INSERT INTO TEMAS VALUES(2,'Romántico');
INSERT INTO TEMAS VALUES(3,'Drama');
INSERT INTO TEMAS VALUES(4,'Ciencia Ficción');
INSERT INTO TEMAS VALUES(5,'Fantanstico');
INSERT INTO TEMAS VALUES(6,'Belico');
INSERT INTO TEMAS VALUES(7,'Terror');
COMMIT;
INSERT INTO ESTADO VALUES(1,'Bueno');
INSERT INTO ESTADO VALUES(2,'Malo');
INSERT INTO ESTADO VALUES(3,'Defectuoso');
COMMIT;
INSERT INTO EDITORIAL VALUES(1,'RAMA');
INSERT INTO EDITORIAL VALUES(2,'ANAYA');
INSERT INTO EDITORIAL VALUES(3,'EDELVIVES');
COMMIT;
INSERT INTO EJEMPLARES VALUES(1,10);
INSERT INTO EJEMPLARES VALUES(2,20);
INSERT INTO EJEMPLARES VALUES(3,30);
COMMIT;
INSERT INTO LIBROS VALUES('12','Titulo 1','Autor 1',1,2,SYSDATE,SYSDATE,1);
INSERT INTO LIBROS VALUES('13','Titulo 2','Autor 2',2,1,SYSDATE,SYSDATE,1);
INSERT INTO LIBROS VALUES('14','Titulo 3','Autor 3',1,3,SYSDATE,SYSDATE,2);
INSERT INTO LIBROS VALUES('15','Titulo 4','Autor 4',3,1,SYSDATE,SYSDATE,3);
COMMIT;
INSERT INTO SOCIOS VALUES('123','Socio 1','Apellido 1','01/01/1986',SYSDATE,'H',1);
INSERT INTO SOCIOS VALUES('124','Socio 2','Apellido 2','02/01/1986',SYSDATE,'M',2);
INSERT INTO SOCIOS VALUES('125','Socio 3','Apellido 3','03/01/1986',SYSDATE,'M',3);
INSERT INTO SOCIOS VALUES('126','Socio 4','Apellido 4','04/01/1986',SYSDATE,'M',1);
COMMIT;
INSERT INTO EMPLEADO VALUES('123','Empleado 1','Apellido 1','01/01/1986',SYSDATE,'Observacion 1');
INSERT INTO EMPLEADO VALUES('124','Empleado 2','Apellido 2','02/01/1986',SYSDATE,'Observacion 2');
INSERT INTO EMPLEADO VALUES('125','Empleado 3','Apellido 3','03/01/1986',SYSDATE,'Observacion 3');
INSERT INTO EMPLEADO VALUES('126','Empleado 4','Apellido 4','04/01/1986',SYSDATE,'Observacion 4');
COMMIT;
INSERT INTO PRESTAMO VALUES('01/01/2018','01/02/2018',SYSDATE,'12','123',123);
INSERT INTO PRESTAMO VALUES('01/01/2018','01/02/2018',SYSDATE,'13','124',124);
INSERT INTO PRESTAMO VALUES('01/01/2018','01/02/2018',SYSDATE,'14','125',125);
INSERT INTO PRESTAMO VALUES('01/01/2018','01/02/2018',SYSDATE,'15','126',126);
COMMIT;
