# Actividad 3.3

<a name="top"> </a>

- [Ejercicio 1](#ejerc1)
- [Ejercicio 2](#ejerc2)
- [Ejercicio 3](#ejerc3)
- [Ejercicio 4](#ejerc4)
- [Ejercicio 5](#ejerc5)
- [Ejercicio 6](#ejerc6)


<a name="ejerc1"></a>
## Ejercicio 1 

Relación entre delegación y ciudad. Una empresa cuenta con delegaciones en diferentes ciudades.
La empresa solamente dispondrá de una delegación por ciudad. Hay ciudades donde todavía no se
ha abierto una delegación.

### Esquema conceptual

![Esquema conceptual ejercicio 1](Ejercicio1/img/Ejercicio3-1.png)

### Esquema conceptual modificado

Coincide con el esquema conceptual

### Tablas

Al tener la cardinalidad (0,1) hacia delegación, el campo cod_postal debe pasar como clave foránea a la tabla delegación. 

![Paso a tablas](Ejercicio1/img/Ejercicio31-Tablas.png)

Si no recordamos la regla del paso hacia la cardinalidad (0,1), se podrían generar las dos opciones y quedarnos con aquella que tenga menos valores nulos. En este ejercicio, si pasamos el campo cod_deleg a ciudad, para muchas ciudades este atributo tendrá un valor nulo. Esto se debe a que, tal y como se indica en el enunciado, no hay una delegación en todas las ciudades. 

### Normalización


- 1ª FN – Sí. Todas las claves son correctas 

- 2ª FN – Sí. Todas las claves tienen un único atributo, por lo que automáticamente están en 2ª FN

- 3ª FN – Sí. No hay dependencias transitivas


### Código SQL [[link]](Ejercicio1/actividad331.sql)

```sql

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



```

[Inicio](#top)

<a name="ejerc2"></a>
## Ejercicio 2

Relación entre países y localidades 

### Esquema conceptual

![Esquema conceptual ejercicio 2](Ejercicio2/img/Ejercicio2.png)

### Esquema conceptual modificado

Coincide con el esquema conceptual, ya que no hay relaciones M:N ni entidades débiles

![Esquema conceptual ejercicio 2](Ejercicio2/img/Ejercicio2.png)

### Tablas

![Paso a tablas](Ejercicio2/img/Ejercicio2-Tablas.jpg)

### Normalización

- 1ª FN – Sí. Todas las claves son correctas 

- 2ª FN – Sí. Todas las claves tienen un único atributo, por lo que automáticamente están en 2ª FN

- 3ª FN – Sí. No hay dependencias transitivas

### Código SQL [[link]](Ejercicio2/actividad332.sql)


```sql 

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

```

[Inicio](#top)

<a name="ejerc3"></a>
## Ejercicio 3

Alumno y delegado

### Esquema conceptual

![Esquema conceptual ejercicio 3](Ejercicio3/img/Ejercicio3.png)

### Esquema conceptual modificado

Coincide con el esquema conceptual

### Tablas

![Tablas ejercicio 3](Ejercicio3/img/Ejercicio3-Tablas.jpg)


### Normalización

- 1FN => Todos los atributos no clave dependen funcionalmente de la clave

- 2FN => La clave primaria de la tabla tiene solo un atributo, por lo que automáticamente está en segunda forma normal

- 3FN => No existen dependencias transitivas, por lo que está en 3FN

### Código SQL [[link]](Ejercicio3/act33_3_EGZ.sql)

```sql

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

```

[Inicio](#top)

<a name="ejerc4"></a>
## Ejercicio 4


### Esquema conceptual

![Esquema conceptual ejercicio 4](Ejercicio4/img/Ejercicio4.png)

### Esquema conceptual modificado




### Tablas



### Normalización



### Código SQL

[Inicio](#top)

<a name="ejerc5"></a>
## Ejercicio 5


### Esquema conceptual

![Esquema conceptual ejercicio 5](Ejercicio5/img/Ejercicio5.png)

### Esquema conceptual modificado



### Esquema conceptual modificado

### Tablas

### Normalización

### Código SQL

[Inicio](#top)

<a name="ejerc6"></a>
## Ejercicio 6
 Clasificación de las cuentas de un banco: ahorro y corriente

### Esquema conceptual

![Esquema conceptual ejercicio 6](Ejercicio6/img/Ejercicio6.png)

### Esquema conceptual modificado



### Esquema conceptual modificado

### Tablas

### Normalización

### Código SQL

[Inicio](#top)

<a name="ejerc7"></a>
## Ejercicio 7

<div style="text-align:justify"> La Consejería de Educación gestiona varios tipos de centros: públicos, privados y concertados. Los
privados tienen un atributo específico que es la cuota y los concertados la agrupación y la comisión.
También asigna plazas a los profesores de la comunidad para impartir clase en esos centros. Un
profesor puede impartir clase en varios centros. </div>

### Esquema conceptual

![Esquema concptual ejercicio 7](Ejercicio7/img/Ejercicio7.png)

### Esquema conceptual modificado



### Esquema conceptual modificado

### Tablas

### Normalización

### Código SQL

[Inicio](#top)

<a name="ejerc8"></a>
## Ejercicio 8

<div style="text-align:justify" > 
A un taller de automóviles llegan clientes a comprar coches. De los coches nos interesa saber la
marca, el modelo, el color y el número de bastidor. Los coches pueden ser nuevos y de segunda
mano. De los nuevos nos interesa saber las unidades que hay en el taller. De los viejos el año de
fabricación, el número de averías y la matrícula.
<br>
Los mecánicos se encargan de poner a punto los coches usados del taller. Un mecánico pone a punto
a varios coches usados. Un cliente puede comprar varios coches; un coche puede ser comprado por
varios clientes. De la compra nos interesa la fecha y el precio.</div>

### Esquema conceptual

![Esquema conceptual ejercicio 8](Ejercicio8/img/Ejercicio8.png)

### Esquema conceptual modificado



### Esquema conceptual modificado

### Tablas

### Normalización

### Código SQL

[Inicio](#top)