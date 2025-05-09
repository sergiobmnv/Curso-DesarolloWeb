CREATE DATABASE COLEGIO;
USE COLEGIO;

CREATE TABLE CURSO (
	ID_CURSO INT (11) NOT NULL COMMENT 'ID del curso',
    NOMBRE VARCHAR (45) NOT NULL COMMENT 'Nombre del curso',
    IND_VISIBLE INT (1) NOT NULL COMMENT 'IND visible del curso',
    CONSTRAINT PK_CURSO PRIMARY KEY (ID_CURSO)
);

CREATE TABLE ASIGNATURA (
	ID_ASIGNATURA INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la asignatura',
	NOMBRE VARCHAR (100) NOT NULL COMMENT 'Nombre de la asignatura',
    HORAS INT (11) NOT NULL COMMENT 'Horas de la asignatura',
    IND_VISIBLE INT (11) NOT NULL COMMENT 'IND visible de asignatura',
    ID_CURSO INT (11) NOT NULL,
    CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ID_ASIGNATURA),
    CONSTRAINT FK_CURSO_ASIGNATURA FOREIGN KEY (ID_CURSO) REFERENCES CURSO (ID_CURSO)
);

CREATE TABLE TIPO_EMPLEADO (
	ID_TIPO_EMPLEADO INT (11) NOT NULL COMMENT 'ID del tipo de empleado',
    NOMBRE_TIPO VARCHAR (45) NOT NULL COMMENT 'Nombre del tipo de empleado',
    IND_PROFESOR INT (1) NOT NULL COMMENT 'IND profesor del tipo de empleado',
    IND_VISIBLE INT (1) NOT NULL COMMENT 'IND visible del tipo de empleado',
    CONSTRAINT PK_TIPO_EMPLEADO PRIMARY KEY (ID_TIPO_EMPLEADO)
);

CREATE TABLE EMPLEADO (
	ID_EMPLEADO INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID del empleado',
    NOMBRE VARCHAR (50) NOT NULL COMMENT 'Nombre del empleado',
    APELLIDOS VARCHAR (100) NOT NULL COMMENT 'Apellidos del empleado',
    DNI VARCHAR (10) NOT NULL COMMENT 'DNI del empleado',
    DOMICILIO VARCHAR (100) NULL COMMENT 'Domicilio del empleado',
    CODIGO_POSTAL INT (11) NULL COMMENT 'Codigo postal del empleado',
    EMAIL VARCHAR (100) NULL COMMENT 'Email del empleado',
    IND_VISIBLE INT (1) NOT NULL COMMENT 'IND visible del empleado',
    ID_TIPO_EMPLEADO INT (11) NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (ID_EMPLEADO),
    CONSTRAINT FK_TIPO_EMPLEADO_EMPLEADO FOREIGN KEY (ID_TIPO_EMPLEADO) REFERENCES TIPO_EMPLEADO (ID_TIPO_EMPLEADO)
);

CREATE TABLE IMPARTE (
	ID_IMPARTE INT (11) NOT NULL AUTO_INCREMENT COMMENT 'ID de imparte',
	IND_VISIBLE INT (11) NOT NULL COMMENT 'IND visible de imparte',
    ID_ASIGNATURA INT (11) NOT NULL,
    ID_EMPLEADO INT (11) NOT NULL,
    CONSTRAINT PK_IMPARTE PRIMARY KEY (ID_IMPARTE),
    CONSTRAINT FK_EMPLEADO_IMPARTE FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO (ID_EMPLEADO),
    CONSTRAINT FK_ASIGNATURA_IMPARTE FOREIGN KEY (ID_ASIGNATURA) REFERENCES ASIGNATURA (ID_ASIGNATURA)
);
























