CREATE DATABASE CASINO_CRFLOSKY;
USE CASINO_CRFLOSKY;

-- Tabla USUARIO
CREATE TABLE USUARIO (
    USERNAME VARCHAR(30) NOT NULL,
    PWD VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(70) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL, 
    MONEDERO DOUBLE NOT NULL DEFAULT 0,
    SALDO DOUBLE NOT NULL DEFAULT 0,
    IS_VIP BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT PK_USUARIO PRIMARY KEY (DNI)
);

-- Tabla TARJETA_CREDITO 
CREATE TABLE TARJETA_CREDITO (
    ID_TARJETA_CREDITO BIGINT NOT NULL AUTO_INCREMENT,
    NUMERO_TARJETA VARCHAR(19) NOT NULL UNIQUE,
    CCV VARCHAR(3) NOT NULL,
    MES_EXPIRACION VARCHAR(2) NOT NULL, -- Cambiado a 2 caracteres (Ej: '12')
    YEAR_EXPIRACION VARCHAR(4) NOT NULL, -- Sigue como string de 4 caracteres (Ej: '2026')
    USUARIO VARCHAR(9) NOT NULL,
    CONSTRAINT PK_TARJETA_CREDITO PRIMARY KEY(ID_TARJETA_CREDITO),
    CONSTRAINT FK_TARJETA_CREDITO_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(DNI)
);

-- Tabla JUEGO (para almacenar diferentes juegos de casino)
CREATE TABLE JUEGO (
    ID_JUEGO BIGINT NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT PK_JUEGO PRIMARY KEY (ID_JUEGO)
);

-- Insertar juegos por defecto
INSERT INTO JUEGO (ID_JUEGO, NOMBRE) VALUES (1, 'SLOTS');
INSERT INTO JUEGO (ID_JUEGO, NOMBRE) VALUES (2, 'DINO');
INSERT INTO JUEGO (ID_JUEGO, NOMBRE) VALUES (3, 'MINAS');

-- Tabla CONVERSION 
CREATE TABLE CONVERSION (
    ID_CONVERSION BIGINT NOT NULL AUTO_INCREMENT,
    EUROS DOUBLE NOT NULL,
    FICHAS INT NOT NULL,
    USUARIO VARCHAR(9) NOT NULL,
    FECHA DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT PK_CONVERSION PRIMARY KEY (ID_CONVERSION),
    CONSTRAINT FK_CONVERSION_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(DNI)
);

-- Tabla LOG_SLOTS 
CREATE TABLE LOG_SLOTS (
    ID_LOG_SLOTS BIGINT NOT NULL AUTO_INCREMENT,
    USUARIO VARCHAR(9) NOT NULL,
    MONTO DOUBLE NOT NULL,
    PREMIO DOUBLE NOT NULL,
    FECHA DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT PK_LOG_SLOTS PRIMARY KEY (ID_LOG_SLOTS),
    CONSTRAINT FK_LOG_SLOTS_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(DNI)
);

-- Tabla LOG_DINO 
CREATE TABLE LOG_DINO (
    ID_LOG_DINO BIGINT NOT NULL AUTO_INCREMENT,
    USUARIO VARCHAR(9) NOT NULL,
    MONTO DOUBLE NOT NULL,
    MULTIPLICADOR DOUBLE NOT NULL,
    FECHA DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT PK_LOG_DINO PRIMARY KEY (ID_LOG_DINO),
    CONSTRAINT FK_LOG_DINO_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(DNI)
);

-- Tabla LOG_MINAS 
CREATE TABLE LOG_MINAS (
    ID_LOG_MINAS BIGINT NOT NULL AUTO_INCREMENT,
    USUARIO VARCHAR(9) NOT NULL,
    MONTO DOUBLE NOT NULL,
    PREMIO DOUBLE NOT NULL,
    FECHA DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT PK_LOG_MINAS PRIMARY KEY (ID_LOG_MINAS),
    CONSTRAINT FK_LOG_MINAS_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(DNI)
);
