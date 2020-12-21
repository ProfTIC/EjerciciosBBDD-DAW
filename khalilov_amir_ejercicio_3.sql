drop database if exists act323ak;
create database act323ak;
use act323ak;
create table Cliente(
    DNI VARCHAR(8) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(10) NOT NULL,
    Apellidos VARCHAR(30) NOT NULL,
    Direccion VARCHAR(30) NOT NULL,
    Fecha_nacimiento DATE NOT NULL
);
create table Proveedor(
    NIF_Proveedor VARCHAR(8) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(8),
    Direccion VARCHAR(8)
);
create table Producto(
    Cod_producto INT PRIMARY KEY NOT NULL,
    Precio FLOAT(6,4),
    Nombre VARCHAR(8),
    NIF_Proveedor VARCHAR(8),
    CONSTRAINT NIF_Proveedor_FK
    FOREIGN KEY (NIF_Proveedor)
    REFERENCES Proveedor(NIF_Proveedor)
);
create table Cliente_Producto(
    DNI VARCHAR(8),
    CONSTRAINT DNI_FK
    FOREIGN KEY (DNI)
    REFERENCES Cliente(DNI) ,
    Cod_producto INT,
    CONSTRAINT Cod_producto_FK
    FOREIGN KEY (Cod_producto)
    REFERENCES Producto(Cod_producto)
);

