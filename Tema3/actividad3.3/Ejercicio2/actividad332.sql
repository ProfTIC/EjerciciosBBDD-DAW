DROP DATABASE IF EXISTS municipios;
create DATABASE municipios;
USE municipios;

CREATE TABLE Pais (
	Cod_Pais int,
	Nombre varchar(30) NOT NULL,
	Continente varchar(30) NOT NULL,
	Extension float,
	N_hab int,
	Cod_capital int NOT NULL,
	CONSTRAINT Pais_pk PRIMARY KEY (Cod_Pais),
	CONSTRAINT Pais_ext_ck CHECK (Extension > 0),
	CONSTRAINT Pais_nhab_ck CHECK (N_hab >= 0)
);
CREATE TABLE Municipio (
	Cod_Munic int,
	Nombre varchar(30) NOT NULL,
	N_habit int,
	Cod_Pais int,
	CONSTRAINT Municipio_pk PRIMARY KEY (Cod_Munic),
	CONSTRAINT Municipio_nhab_ck CHECK (N_habit >= 0),
	CONSTRAINT Municipio_pais_fk 
	FOREIGN KEY (Cod_Pais) 
	REFERENCES Pais(Cod_Pais)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);

ALTER TABLE Pais ADD CONSTRAINT Pais_Munic_capital_fk 
	FOREIGN KEY (Cod_capital)	
	REFERENCES Municipio(Cod_Munic)
	ON UPDATE CASCADE 
	ON DELETE NO ACTION;


