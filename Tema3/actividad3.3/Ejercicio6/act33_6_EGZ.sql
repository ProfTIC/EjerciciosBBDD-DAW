drop database if exists act33_6_EGZ;

create database act33_6_EGZ;

use act33_6_EGZ;

create table Cliente (
	DNI VARCHAR(9),
	Nombre VARCHAR(20) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL,
	Apellido2 VARCHAR(20),
	CONSTRAINT Cliente_pk
	PRIMARY KEY (DNI)
);

create table Cuenta_Bancaria (
	IBAN VARCHAR(24),
	Nombre_Banco VARCHAR(20) NOT NULL,
	CONSTRAINT Cuenta_Bancaria_pk
	PRIMARY KEY (IBAN)
);

create table Cliente_Cuenta_Bancaria (
	DNI VARCHAR(9),
	IBAN VARCHAR(24),
	CONSTRAINT Cliente_Cuenta_Bancaria_pk
	PRIMARY KEY (DNI,IBAN),

	CONSTRAINT DNI_fk
	FOREIGN KEY (DNI)
	REFERENCES Cliente(DNI)
	ON UPDATE CASCADE
	ON DELETE NO ACTION,

	CONSTRAINT IBAN_fk
	FOREIGN KEY (IBAN)
	REFERENCES Cuenta_Bancaria(IBAN)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);

create table Corriente (
	IBAN VARCHAR(24),
	Num_Cheque INT NOT NULL,
	CONSTRAINT Corriente_pk
	PRIMARY KEY (IBAN),
	CONSTRAINT IBAN_corriente_fk
	FOREIGN KEY (IBAN)
	REFERENCES Cuenta_Bancaria(IBAN)
	ON UPDATE CASCADE
	ON DELETE CASCADE 
);

create table Ahorro (
	IBAN VARCHAR(24),
	Fecha_Renov DATE NOT NULL,
	Interés FLOAT NOT NULL,
	CONSTRAINT Ahorro_pk
	PRIMARY KEY (IBAN),
	CONSTRAINT IBAN_ahorro_fk
	FOREIGN KEY (IBAN)
	REFERENCES Cuenta_Bancaria(IBAN)
	ON UPDATE CASCADE
	ON DELETE CASCADE 
);

