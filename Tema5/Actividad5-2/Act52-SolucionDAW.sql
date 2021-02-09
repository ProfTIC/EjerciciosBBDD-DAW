/*Ejercicio 2
Crea una tabla ejercicio2 para almacenar los siguientes datos. Ten en cuenta las siguientes consideraciones:
Apellido: varchar(20). Clave primaria
     
Frecuencia: int
     
Porcentaje: decimal
     
País: enumerado permitiendo valores “España”, “Alemania”, “Francia”, “Italia”
     
Carga los datos del fichero Apellidos.txt mediante la instrucción LOAD DATA. La primera fila del fichero no se debe almacenar en la tabla. Indica la instrucción que utiliza y los cambios (si han sido necesarios) que has realizado en el archivo para que se inserten todas las filas
Nota: puedes usar show warnings para ver los problemas de importación de los datos.
*/

DROP DATABASE IF EXISTS act42ej2;

CREATE DATABASE act42ej2;

USE act42ej2;

CREATE TABLE ejercicio2(
       ID int,
       Apellido varchar(20),
       Frecuencia int,
       Porcentaje decimal(5,2), -- float
       País ENUM ('España', 'Alemania', 'Francia', 'Italia'),
       CONSTRAINT EJ2_AP_PK PRIMARY KEY (ID)
       );

set global local_infile=1;

LOAD DATA LOCAL INFILE 'Apellidos.txt' INTO TABLE ejercicio2 IGNORE 1 LINES;

/*             
Ejercicio 3
Ejecuta la siguiente instrucción usando la tabla ejercicio3 de la relación de ejercicios anterior. ¿Qué obtienes? ¿Cuántas filas se han modificado? ¿Por qué?
replace ejercicio3 values(2,'prueba set',id*3,'2020-02-10');*/


DROP DATABASE IF EXISTS act423pjl;

CREATE DATABASE act423pjl;

USE act423pjl;

CREATE TABLE Ejercicio3 (
    Id int AUTO_INCREMENT,
    Campo1 varchar(20) DEFAULT '1',
    Campo2 varchar(20),
    Campo3 date DEFAULT '2019-01-25',
    CONSTRAINT Ejercicio3_Id_PK PRIMARY KEY(Id)
);
INSERT INTO Ejercicio3 (Campo1,Campo2,Campo3) values ( DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Ejercicio3  SET ID=0,  Campo1='prueba set',Campo2=2, Campo3= '2018-02-10';
INSERT INTO Ejercicio3 values(); /* Inserta los que vienen por defecto */
INSERT INTO Ejercicio3 values(0,DEFAULT,Id+2,DEFAULT);
REPLACE Ejercicio3 values(id*3,'prueba set',2,'2020-02-10');
/* Se inserta una fila nueva con los datos indicados. En cuanto al id, vale 5 ya que es el siguiente valor autonumérico que se genera */

/*Ejercicio 4
Inserta mediante la instrucción REPLACE una tupla en la tabla ejercicio3 con id 4 y cuyo campo1 valga 'Nuevo'. Usa SET */

REPLACE Ejercicio3 set Id=4, Campo1='nuevo';


/*Ejercicio 5
Realiza las siguientes modificaciones en la tabla ejercicio2 creada en la relación de la actividad 4.1
Establece a nulo el valor de apellido2 de todas las filas cuya provincia no sea Jaén
*/

UPDATE poblacion 
SET apellido2=NULL 
WHERE provincia!='Jaén'; 
-- Otra opción:

UPDATE poblacion 
SET apellido2=NULL 
WHERE provincia <> 'Jaén';


-- Multiplica por 10 el valor de id para todos los que sean menores de edad 
   
   UPDATE poblacion 
   SET ID=ID*10 
   WHERE mayor_edad=0;

-- Establece el id a 100 y el segundo apellido a 'Valdivia' para las filas cuya fecha de nacimiento sea menor del 15/05/1965

   UPDATE poblacion 
   SET ID=100, apellido2='Valdivia'
   WHERE fecha_nacimiento<'1965-05-15';

-- Modifica el nombre a María para las filas en las que el primer apellido empiece por L y acabe en Z

   UPDATE poblacion 
   SET nombre='María' 
   WHERE apellido1 like'M%z';

/*
Ejercicio 6
Crea una tabla estructura_cnae2009 que almacene los datos del archivo estructura_cnae2009.csv. Puedes usar como clave el primer código. Debes insertar todos las líneas de datos usando LOAD DATA*/

DROP DATABASE IF EXISTS act4_2_6IMC;
CREATE DATABASE act4_2_6IMC;
USE act4_2_6IMC;

CREATE TABLE estructura_cnae2009(
    COD_CNAE2009 varchar(10),
    CODINTEGR varchar(20),
    TITULO_CNAE2009 varchar(170),
    CONSTRAINT ej6_cod_pk PRIMARY KEY (COD_CNAE2009)
);

LOAD DATA LOCAL INFILE "estructura_cnae2009.csv"
INTO TABLE estructura_cnae2009 CHARACTER SET UTF8MB4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*
Ejercicio 7
Revisa las siguientes páginas, realizando los ejemplos que se proponen sobre la sentencia DELETE y TRUNCATE:
http://www.mysqltutorial.org/mysql-delete-statement.aspx          
     
http://www.mysqltutorial.org/mysql-on-delete-cascade/          
     
http://www.mysqltutorial.org/mysql-truncate-table/ */         
     
/* Ejercicio 8
Realiza los siguientes ejercicios para la tabla de las tesis doctorales (ejercicio 4 de la actividad 4.1): */

-- Borra todas las filas en las que el número de hombres está entre 30 y 100

DELETE FROM Tesis
WHERE Hombres BETWEEN 30 AND 100;

-- Otra opción:

DELETE FROM Tesis
WHERE Hombres >= 30 AND Hombres <= 100;

-- Borra todas las filas en las que el número de mujeres sea mayor de 2000

DELETE FROM Tesis
WHERE Mujeres > 2000;     

-- Borra todas las filas de las comunidades cuyo nombre empiece por M
DELETE FROM Tesis
WHERE Comunidad LIKE 'M%';

-- Borra todas las filas en las que haya más tesis de mujeres que de hombres
DELETE FROM Tesis
WHERE Mujeres > Hombres;

-- Borra todas las filas en las que el número de tesis de mujeres sea menor que el de los hombres
DELETE FROM Tesis
WHERE Hombres > Mujeres;

/*Ejercicio 9
Borra todos los datos de la tabla estructura_cnae2009 usando delete */
delete from estructura_cnae2009;

/*Ejercicio 10
Borra alguna de las tablas creadas anteriormente usando truncate */
truncate table poblacion;


