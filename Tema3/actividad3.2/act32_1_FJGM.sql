CREATE DATABASE act32_1_FJGM;

USE act32_1_FJGM;

CREATE TABLE Invitado (
	NIF VARCHAR(9),
	Nombre VARCHAR(20) NOT NULL,
	Provincia VARCHAR(30) DEFAULT 'Jaén',
	CONSTRAINT Invitado_PK PRIMARY KEY (NIF)
);

CREATE TABLE Departamento (
	Cod_Departamento VARCHAR(3),
	Descripción VARCHAR(50) NOT NULL,
	CONSTRAINT Departamento_PK PRIMARY KEY (Cod_Departamento)
);

CREATE TABLE Regalo (
	Ref INTEGER, 
	Descripción VARCHAR(20) NOT NULL,
	Cod_Departamento VARCHAR(3),
	Precio DECIMAL(6,2) NOT NULL,
	CONSTRAINT Regalo_PK PRIMARY KEY (Ref),
	CONSTRAINT Regalo_FK FOREIGN KEY (Cod_Departamento) REFERENCES Departamento(Cod_Departamento)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);

CREATE TABLE Adquisición (
	Ref INTEGER, 
	NIF VARCHAR(9),
	Fecha DATE,
	CONSTRAINT Adquisición_PK PRIMARY KEY (Ref, NIF, Fecha),
	CONSTRAINT Adquisición_Ref_FK FOREIGN KEY (Ref) REFERENCES Regalo(Ref)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT Adquisición_NIF_FK FOREIGN KEY (NIF) REFERENCES Invitado(NIF)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);


INSERT INTO Invitado (NIF, Nombre, Provincia) VALUES ('11111111A', 'Mariano', 'Sevilla');
INSERT INTO Invitado (NIF, Nombre, Provincia) VALUES ('22222222B', 'Raúl', 'Málaga');
INSERT INTO Invitado (NIF, Nombre, Provincia) VALUES ('33333333C', 'Rocío', 'Jaén');
INSERT INTO Invitado (NIF, Nombre, Provincia) VALUES ('44444444D', 'Benjamín', 'Córdoba');
INSERT INTO Invitado (NIF, Nombre, Provincia) VALUES ('55555555E', 'Carlos', 'Almería');
INSERT INTO Invitado (NIF, Nombre, Provincia) VALUES ('66666666F', 'Manolo', 'Granada');


INSERT INTO Departamento (Cod_Departamento, Descripción) VALUES ('PEQ', 'Pequeño electrodoméstico');
INSERT INTO Departamento (Cod_Departamento, Descripción) VALUES ('MEN', 'Menaje');
INSERT INTO Departamento (Cod_Departamento, Descripción) VALUES ('DEC', 'Decoración');


INSERT INTO Regalo (Ref, Descripción, Cod_Departamento, Precio) VALUES (1, 'Lámpara', 'DEC', 300);
INSERT INTO Regalo (Ref, Descripción, Cod_Departamento, Precio) VALUES (2, 'Batidora', 'PEQ', 60);
INSERT INTO Regalo (Ref, Descripción, Cod_Departamento, Precio) VALUES (3, 'Cafetera', 'PEQ', 100);
INSERT INTO Regalo (Ref, Descripción, Cod_Departamento, Precio) VALUES (4, 'Vajilla', 'MEN', 450);


INSERT INTO Adquisición (Ref, NIF, Fecha) VALUES (2, '11111111A', '2020/05/10');
INSERT INTO Adquisición (Ref, NIF, Fecha) VALUES (4, '33333333C', '2020/05/12');
INSERT INTO Adquisición (Ref, NIF, Fecha) VALUES (3, '55555555E', '2020/03/27');
INSERT INTO Adquisición (Ref, NIF, Fecha) VALUES (1, '22222222B', '2020/06/02');
INSERT INTO Adquisición (Ref, NIF, Fecha) VALUES (4, '44444444D', '2020/05/12');
INSERT INTO Adquisición (Ref, NIF, Fecha) VALUES (1, '66666666F', '2020/06/02');
