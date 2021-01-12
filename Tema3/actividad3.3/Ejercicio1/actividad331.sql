DROP DATABASE IF EXISTS empresa;
create DATABASE empresa;
USE empresa;

CREATE TABLE Delegacion (
	Cod_Deleg int AUTO_INCREMENT,
	Direccion varchar(30) NOT NULL,
	Cod_Postal varchar(5) NOT NULL, 
	CONSTRAINT Deleg_pk PRIMARY KEY(Cod_Deleg)
	
);


CREATE TABLE Ciudad (
	Cod_Postal varchar(5),
	Nombre varchar(20) NOT NULL,
	Provincia varchar(15),
	CONSTRAINT Ciudad_pk PRIMARY KEY(Cod_Postal)	
);


ALTER TABLE Delegacion 
	ADD CONSTRAINT Deleg_Ciud_fk 
	FOREIGN KEY (Cod_Postal) 
	REFERENCES Ciudad(Cod_Postal)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;


