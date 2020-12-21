drop database if exists act323ak;
create database act323ak;
use act323ak;
create table Cliente(
    DNI INT,
    Nombre VARCHAR(15) NOT NULL,
    Apellidos VARCHAR(30) NOT NULL,
    Direccion VARCHAR(30) NOT NULL,
    Fecha_nacimiento DATE NOT NULL,
    CONSTRAINT Cli_DNI_PK PRIMARY KEY(DNI)
);
create table Proveedor(
    NIF VARCHAR(9),
    Nombre VARCHAR(8) NOT NULL,
    Direccion VARCHAR(8),
    CONSTRAINT Prov_NIF_PK PRIMARY KEY(NIF)
);
create table Producto(
    Cod_producto INT,
    Precio FLOAT,  
    Nombre VARCHAR(20),
    NIF_Proveedor VARCHAR(9),
    CONSTRAINT Prod_Precio_CK check (Precio > 0),
    CONSTRAINT Prod_cod_PK PRIMARY KEY(Cod_Producto),
    CONSTRAINT NIF_Proveedor_FK
    FOREIGN KEY (NIF_Proveedor)
    REFERENCES Proveedor(NIF)
    ON UPDATE CASCADE
    ON DELETE NO ACTION -- CASCADE si queremos eliminar el producto una vez borrado el proveedor
);
create table Cliente_Producto(
    DNI INT,
    Cod_producto INT,
    CONSTRAINT Cli_Prod_PK PRIMARY KEY(DNI, Cod_Producto),
    CONSTRAINT DNI_FK
    FOREIGN KEY (DNI)
    REFERENCES Cliente(DNI) 
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT Cod_producto_FK
    FOREIGN KEY (Cod_producto)
    REFERENCES Producto(Cod_producto)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

