drop database if exists EnciclopediaEGZ;

create database EnciclopediaEGZ; 

use EnciclopediaEGZ;

create table Localidad (
	Cod_Localidad VARCHAR(6),
	Localidad VARCHAR(30) NOT NULL,
	CONSTRAINT Localidad_cod_pk PRIMARY KEY(Cod_Localidad)
);

/* Ejemplo de inserción de datos */

INSERT INTO Localidad VALUES('23000','Jódar');
INSERT INTO Localidad(Cod_localidad,localidad) VALUES('23070','Orcera');
INSERT INTO Localidad(localidad,Cod_localidad) VALUES('Bailén','23170');

/* Para ver los datos de una tabla usamos select */

SELECT * FROM Localidad;

create table Autor (
	NIF VARCHAR(9),
	Apellido1 VARCHAR(9) NOT NULL,
	Cod_Localidad VARCHAR(6),
	CONSTRAINT Autor_NIF_pk PRIMARY KEY(NIF),
	CONSTRAINT Cod_Localidad_FK
	FOREIGN KEY (Cod_Localidad)
	REFERENCES Localidad(Cod_Localidad)
	ON UPDATE CASCADE
	ON DELETE SET NULL
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
	CONSTRAINT Volumen_pk PRIMARY KEY (Id_Enciclopedia,Id_Volumen),
    	CONSTRAINT Id_Enciclopedia_FK	
	FOREIGN KEY (Id_Enciclopedia) 
	REFERENCES Datos_Enciclopedia(Id_Enciclopedia)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

create table Enciclopedia_Volumen_Autor (
	Id_Enciclopedia INT NOT NULL,
	Id_Volumen INT NOT NULL,
	NIF VARCHAR(9) NOT NULL,
	CONSTRAINT Enc_Vol_Aut_pk PRIMARY KEY (Id_Enciclopedia,Id_Volumen,NIF),
	CONSTRAINT Datos_Encicl_fk 
	FOREIGN KEY (Id_Enciclopedia, Id_Volumen) 
	REFERENCES Volumen (Id_Enciclopedia, Id_Volumen)
	ON UPDATE CASCADE
	ON DELETE NO ACTION,
	CONSTRAINT NIF_FK 
	FOREIGN KEY (NIF) 
	REFERENCES Autor(NIF)	
	ON UPDATE CASCADE
	ON DELETE NO ACTION	
);
