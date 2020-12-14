drop database if exists EnciclopediaEGZ;

create database EnciclopediaEGZ; 

use EnciclopediaEGZ;

create table Localidad (
	Cod_Localidad VARCHAR(6) PRIMARY KEY,
	Localidad VARCHAR(30) NOT NULL
);

create table Autor (
	NIF VARCHAR(9) PRIMARY KEY,
	Apellido1 VARCHAR(9) NOT NULL,
	Cod_Localidad VARCHAR(6) NOT NULL,
	CONSTRAINT Cod_Localidad_FK
	FOREIGN KEY (Cod_Localidad)
	REFERENCES Localidad(Cod_Localidad)
);

create table Datos_Enciclopedia (
	Id_Enciclopedia INT PRIMARY KEY,
	Fecha_Edición DATE NOT NULL,
	Título VARCHAR(30) NOT NULL,
	Coordinador VARCHAR(30) NOT NULL,
	Precio DECIMAL(6,2) NOT NULL
);

create table Volumen (
	Id_Enciclopedia INT NOT NULL,
	Id_Volumen INT NOT NULL,
	Título_Volumen VARCHAR(30) NOT NULL,
    CONSTRAINT Id_Enciclopedia_FK	FOREIGN KEY (Id_Enciclopedia) REFERENCES Datos_Enciclopedia(Id_Enciclopedia),
	PRIMARY KEY (Id_Enciclopedia,Id_Volumen)
);

create table Enciclopedia_Volumen_Autor (
	Id_Enciclopedia INT NOT NULL,
	Id_Volumen INT NOT NULL,
	NIF VARCHAR(9) NOT NULL,
	FOREIGN KEY (Id_Enciclopedia, Id_Volumen) REFERENCES Volumen (Id_Volumen, Id_Enciclopedia),
	CONSTRAINT NIF_FK FOREIGN KEY (NIF) REFERENCES Autor(NIF),
	PRIMARY KEY (Id_Enciclopedia,Id_Volumen,NIF)
);