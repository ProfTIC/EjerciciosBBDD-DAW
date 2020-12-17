DROP DATABASE IF EXISTS act32_2_AGM;

CREATE DATABASE act32_2_AGM;

USE act32_2_AGM;

CREATE TABLE SOCIOS (
	Cod_socio INT AUTO_INCREMENT,
	Nombre VARCHAR(20) NOT NULL,
	Dirección VARCHAR(30),
	Teléfono VARCHAR(15) NOT NULL,
	CONSTRAINT Cod_socio_PK PRIMARY KEY (Cod_socio)
);

CREATE TABLE PELICULA (
	Referencia VARCHAR(10),
	Título VARCHAR(20) NOT NULL,
	Género ENUM('drama', 'acción', 'comedia', 'suspense', 'terror'),
	Año_Estreno YEAR NOT NULL,
	Director VARCHAR(20),
	Nacionalidad VARCHAR(20) NOT NULL,
	CONSTRAINT Referencia_PK PRIMARY KEY (Referencia),
	CONSTRAINT Pelic_Año_ck CHECK (Año_Estreno > 1900)
);

CREATE TABLE PRESTAMOS (
	Cod_Socio INT,
	Referencia_Película VARCHAR (10),
	Fecha_Préstamo DATETIME NOT NULL,
	Importe FLOAT NOT NULL DEFAULT 5.00, 
	CONSTRAINT Prestamos_PK PRIMARY KEY (Cod_Socio,Referencia_Película,Fecha_Préstamo),
	CONSTRAINT Cod_socio_FK 
	FOREIGN KEY (Cod_Socio)
        REFERENCES SOCIOS (Cod_socio)
	ON UPDATE CASCADE
	ON DELETE NO ACTION,
	CONSTRAINT Referencia_pelicula_FK 
	FOREIGN KEY (Referencia_Película) 
	REFERENCES PELICULA (Referencia)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);
