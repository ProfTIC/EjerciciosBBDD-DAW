DROP DATABASE IF EXISTS act32_4_acm;

CREATE DATABASE act32_4_acm;

USE act32_4_acm;


CREATE TABLE Alumnos(
	Dni int,
	N_SegSocial int,
	Nombre Varchar(15) NOT NULL,
	Direccion Varchar(20),
	Telefono Varchar(10),
	CONSTRAINT Dni_Alum_PK 
	PRIMARY KEY(Dni),
	CONSTRAINT Alumno_UK UNIQUE(N_SegSocial)
);


CREATE TABLE Empresas(
	Nif Varchar(10),
	Nombre Varchar(20) NOT NULL,
	Direccion Varchar(20) NOT NULL,
	Responsable_Legal Varchar(20),
	Sector Varchar(10),
	CONSTRAINT Nif_Emp_PK 
	PRIMARY KEY(Nif)
);


CREATE TABLE FCT(
	Dni_Alumno int,
	Nif_Empresa Varchar(10),
	Fecha_Inicio Date,
	Num_Horas int default(0),
	CONSTRAINT Dni_Alum_FK 
	FOREIGN KEY(Dni_Alumno)
	REFERENCES Alumnos(Dni)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT Nif_Empr_FK 
	FOREIGN KEY(Nif_Empresa)
	REFERENCES Empresas(Nif)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);