drop database if exists act51_5_EGZ;

create database act51_5_EGZ;

use act51_5_EGZ;

create table Ejercicio5 (
	Atributo1 INT,
	Atributo2 INT NOT NULL,
	Atributo3 TINYINT,
	Atributo4 VARCHAR(2),
	CONSTRAINT Ejercicio5_pk
	PRIMARY KEY (Atributo1)
);

-- (1,2,0, 'ab'),(5,6,1 ,'cd'), (9,10,0,'ef'),(13,NULL,1,'gh'),(4,8,16,'ij'),(17,'18,1,'klm')


insert into Ejercicio5 values 
	(1,2,0,'ab'),(5,6,1,'cd'),(9,10,0,'ef'),
	(13,NULL,1,'gh'),(4,8,16,'ij'),(17,18,1,'klm');

/*Hay un error, la columna dos no puede ser NOT NULL, hay que corregirla 
quitandole el NULL al atributo en la tabla*/

/*Hay otro error, el atributo4 de la sexta fila es mayor al VARCHAR
establecido, hay que corregirlo cambiándole el número a 3*/

drop database if exists act51_5_EGZ;

create database act51_5_EGZ;

use act51_5_EGZ;

create table Ejercicio5 (
	Atributo1 INT,
	Atributo2 INT,
	Atributo3 TINYINT,
	Atributo4 VARCHAR(3),
	CONSTRAINT Ejercicio5_pk
	PRIMARY KEY (Atributo1)
);

insert into Ejercicio5 values 
	(1,2,0,'ab'),(5,6,1,'cd'),(9,10,0,'ef'),
	(13,NULL,1,'gh'),(4,8,16,'ij'),(17,18,1,'klm');
