drop database if exists act33_3_EGZ;

create database act33_3_EGZ;

use act33_3_EGZ;

create table Alumnos (
	NIE VARCHAR(8),
	Nombre VARCHAR(20) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL,
	Apellido2 VARCHAR(20),
	Num_Lista INT NOT NULL,
	Num_Clase INT NOT NULL,
	NIE_Delegado VARCHAR(8),
	CONSTRAINT Alumnos_pk PRIMARY KEY (NIE)
	
);

-- La clave foránea se puede crear en el comando CREATE TABLE o con ALTER TABLE

ALTER TABLE Alumnos ADD CONSTRAINT Alumnos_del_fk 
	FOREIGN KEY (NIE_Delegado)
	REFERENCES Alumnos(NIE)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

