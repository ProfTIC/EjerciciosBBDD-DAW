
DROP DATABASE IF EXISTS act33ej4ak;

CREATE DATABASE act33ej4ak;

USE act33ej4ak;

CREATE TABLE Libro(
    ISBN VARCHAR(12),
    Autor VARCHAR(20),
    Año_publ YEAR,
    Titulo VARCHAR(20),
    CONSTRAINT ISBN_Libro_PK PRIMARY KEY (ISBN)
);


CREATE TABLE Editorial(
     Cod_Editorial varchar(5),
     Nombre Varchar(20),
     CONSTRAINT Editorial_PK PRIMARY KEY(Cod_Editorial)
);

CREATE TABLE Ejemplar(
    ISBN VARCHAR(12),
    N_Ejemplar INT,
    Año_ed YEAR,
    Estado VARCHAR(10),
    Cod_Editorial varchar(5),
    CONSTRAINT N_Ejemplar_Ejemplar_PK PRIMARY KEY (N_Ejemplar, ISBN),
    CONSTRAINT ISBN_Libro_FK
    FOREIGN KEY (ISBN)
    REFERENCES Libro (ISBN)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    CONSTRAINT Cod_Ed_fk 
    FOREIGN KEY (Cod_Editorial)
    REFERENCES Editorial(Cod_Editorial)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);














