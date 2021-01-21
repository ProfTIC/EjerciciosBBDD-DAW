drop database if exists act33_7_EGZ;

create database act33_7_EGZ;

use act33_7_EGZ;

create table Etapa_Educativa (
	Nombre VARCHAR(20),
	CONSTRAINT Etapa_Educativa_pk
	PRIMARY KEY (Nombre)
);

create table Centro (
	Cod_Centro VARCHAR(6),
	Nombre VARCHAR(20) NOT NULL,
	Localidad VARCHAR(30) NOT NULL,
	CONSTRAINT Centro_pk
	PRIMARY KEY (Cod_Centro)
);

create table Etapa_Educativa_Centro (
	Nombre VARCHAR(20),
	Cod_Centro VARCHAR(6),
	CONSTRAINT Etapa_Educativa_Centro_pk
	PRIMARY KEY (Nombre, Cod_Centro),

	CONSTRAINT Nombre_fk
	FOREIGN KEY (Nombre)
	REFERENCES Etapa_Educativa(Nombre)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT Cod_Centro_Etapa_fk
	FOREIGN KEY (Cod_Centro)
	REFERENCES Centro(Cod_Centro)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

create table Profesor (
	DNI VARCHAR(9),
	Nombre VARCHAR(20) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL,
	Apellido2 VARCHAR(20),
	Dirección VARCHAR(30),
	CONSTRAINT Profesor_pk
	PRIMARY KEY (DNI)
);

create table Centro_Profesor (
	Cod_Centro VARCHAR(6),
	DNI VARCHAR(9),
	CONSTRAINT Centro_Profesor_pk
	PRIMARY KEY (Cod_Centro,DNI),

	CONSTRAINT Cod_Centro_Profesor_fk
	FOREIGN KEY (Cod_Centro)
	REFERENCES Centro(Cod_Centro)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT DNI_fk
	FOREIGN KEY (DNI)
	REFERENCES Profesor(DNI)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

create table Público (
	Cod_Centro VARCHAR(6),
	CCAA VARCHAR(20),
	CONSTRAINT Público_pk
	PRIMARY KEY (Cod_Centro),

	CONSTRAINT Cod_Centro_Publico_fk
	FOREIGN KEY (Cod_Centro)
	REFERENCES Centro(Cod_Centro)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

create table Privado (
	Cod_Centro VARCHAR(6),
	Cuota FLOAT,
	CONSTRAINT Privado_pk
	PRIMARY KEY (Cod_Centro),

	CONSTRAINT Cod_Centro_Privado_fk
	FOREIGN KEY (Cod_Centro)
	REFERENCES Centro(Cod_Centro)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

create table Concertado (
	Cod_Centro VARCHAR(6),
	Agrupación VARCHAR(20),
	Comisión FLOAT,
	CONSTRAINT Concertado_pk
	PRIMARY KEY (Cod_Centro),

	CONSTRAINT Cod_Centro_Concertado_fk
	FOREIGN KEY (Cod_Centro)
	REFERENCES Centro(Cod_Centro)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

