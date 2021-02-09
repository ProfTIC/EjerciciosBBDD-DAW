DROP DATABASE IF EXISTS pr51ak;

CREATE DATABASE pr51ak;

USE pr51ak;

CREATE TABLE ejercicio2(
    ID INT,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20),
    Provincia VARCHAR(20) DEFAULT 'Jaen',
    Fecha_Nacimiento DATE,
    Mayor_Edad TINYINT(1) DEFAULT 1,
    CONSTRAINT ejercicio2_id_PK PRIMARY KEY (ID)
);
INSERT INTO ejercicio2(ID,Nombre,Apellido1,Apellido2,Provincia,Fecha_Nacimiento,Mayor_Edad)
VALUES(1,"Ana","López","López",DEFAULT,"1965-05-13",DEFAULT);
INSERT INTO ejercicio2(ID,Nombre,Apellido1,Apellido2,Provincia,Fecha_Nacimiento,Mayor_Edad)
VALUES(2,"Elena","Martínez","Martínez","Córdova","2001-06-14",0);
INSERT INTO ejercicio2(ID,Nombre,Apellido1,Apellido2,Provincia,Fecha_Nacimiento,Mayor_Edad)
VALUES(3,"Jaime","Madera",NULL,"Sevilla","2005-09-16",0);

CREATE TABLE ejercicio3(
    ID INT NOT NULL AUTO_INCREMENT,
    Campo1 VARCHAR(20) DEFAULT 'campo1',
    Campo2 INT DEFAULT 2,
    Campo3 DATE DEFAULT '2021-02-01',
    CONSTRAINT ejercicio3_id_pk PRIMARY KEY (ID)
);
INSERT INTO ejercicio3(ID, Campo1,Campo2,Campo3)
VALUES(DEFAULT,DEFAULT,DEFAULT,DEFAULT);

INSERT INTO ejercicio3 SET ID=DEFAULT, Campo1 = "prueba set", Campo2 = 4, Campo3 = "2021/12/01";

INSERT INTO ejercicio3 values();

INSERT INTO ejercicio3 values(0, DEFAULT,ID+2,DEFAULT);


CREATE TABLE ejercicio4(
    Comunidad VARCHAR(40),
    Mujeres INT,
    Hombres INT,
    Total INT,
    CONSTRAINT ejercicio4_comunidad_PK PRIMARY KEY (Comunidad)
);
INSERT INTO ejercicio4(Comunidad, Mujeres,Hombres,Total)
VALUES
('Andalucía', 1390, 1282, Mujeres+Hombres),
('Aragón', 192, 159, Mujeres+Hombres),
('Asturias (Principado de)', 144, 156, Mujeres+Hombres),
('Balears (Illes)', 56, 46, Mujeres+Hombres),
('Canarias', 189, 139, Mujeres+Hombres),
('Cantabria', 74, 89, Mujeres+Hombres),
('Castilla - La Mancha', 40, 74, Mujeres+Hombres),
('Castilla y León', 374, 313, Mujeres+Hombres),
('Cataluña', 1674, 1462, Mujeres+Hombres),
('Comunitat Valenciana', 1205, 1012, Mujeres+Hombres),
('Estado', 75, 111, Mujeres+Hombres),
('Extremadura', 175, 136, Mujeres+Hombres),
('Galicia', 337, 300, Mujeres+Hombres),
('Madrid (Comunidad de)', 2294, 2102, Mujeres+Hombres),
('Murcia (Región de)', 339, 305, Mujeres+Hombres),
('Navarra (Comunidad Foral de)', 142, 118, Mujeres+Hombres),
('País Vasco', 369, 365, Mujeres+Hombres);



CREATE TABLE ejercicio5(
    Atributo1 INT,
    Atributo2 INT,
    Atributo3 TINYINT(1),
    Atributo4 VARCHAR(3),
    CONSTRAINT ejercicio5_atributo1_PK PRIMARY KEY(Atributo1)
);

INSERT INTO ejercicio5(Atributo1,Atributo2,Atributo3,Atributo4)
VALUES
(1,2,0, 'ab'),(5,6,1 ,'cd'), (9,10,0,'ef'),(13,NULL,1,'gh'),(4,8,16,'ij'),(17,18,1,'klm');

CREATE TABLE ejercicio6(
    ID INT NOT NULL AUTO_INCREMENT,
    Campo1 VARCHAR(20) DEFAULT 'campo1',
    Campo2 INT DEFAULT 2,
    Campo3 DATE DEFAULT '2021-02-01',
    CONSTRAINT ejercicio6_id_pk PRIMARY KEY (ID)
);

INSERT INTO ejercicio6(ID, Campo1, Campo2, Campo3)
SELECT
    ID,
    Campo1,
    Campo2,
    Campo3
FROM
    ejercicio3;




CREATE TABLE ejercicio7(
    Cod VARCHAR(3),
    NIF VARCHAR(9) UNIQUE,
    Nombre VARCHAR(20),
    CONSTRAINT ejercicio7_cod_PK
    PRIMARY KEY (Cod)
);

INSERT INTO ejercicio7
VALUES('ABC','11111111F', 'Ana');

INSERT INTO ejercicio7
VALUES('DEF','22222222E', 'José');

INSERT IGNORE INTO ejercicio7
VALUES ('GEH','22222222E', 'Fernando');

INSERT IGNORE INTO ejercicio7
VALUES ('GEH','333333333E', 'Julio');

CREATE TABLE ejercicio8(
    Campo1 INT,
    Campo2 VARCHAR(30),
    Campo3 INT,
    CONSTRAINT ejercicio8_Campo1_PK
    PRIMARY KEY (Campo1)
);

INSERT INTO ejercicio8(Campo1, Campo2, Campo3)
VALUES(1,'Valor',6)
ON DUPLICATE KEY UPDATE Campo2 = "actualizado";

INSERT INTO ejercicio8(Campo1, Campo2, Campo3)
VALUES(2,'Valor',5)
ON DUPLICATE KEY UPDATE Campo2 = "actualizado";


INSERT INTO ejercicio8(Campo1, Campo2, Campo3)
VALUES(1,'Valor',6)
ON DUPLICATE KEY UPDATE Campo2 = "actualizado";

REPLACE ejercicio3 
VALUES(2,"prueba set",id*3,"2020-02-10");

REPLACE INTO ejercicio3
SET 
ID = 4,
Campo1 = "Nuevo";

UPDATE ejercicio2
SET
    Apellido2 = NULL
WHERE
    Provincia = "Jaen";


UPDATE ejercicio2
SET
    ID = ID*10
WHERE
    Mayor_Edad = 1;


UPDATE ejercicio2
SET
    ID = 100,
    Apellido2 = "Valdivia"
WHERE  
    Fecha_Nacimiento < "1965-05-15";

UPDATE ejercicio2
SET
    Nombre = "Maria"
WHERE
    Apellido1 LIKE 'L%' AND 
    Apellido1 LIKE '%Z';


DELETE FROM ejercicio4

WHERE 
    Hombres >= 30 AND
    Hombres <= 100;

DELETE FROM ejercicio4

WHERE 
    Hombres BETWEEN 30 AND 100;

DELETE FROM ejercicio4
WHERE 
    Mujeres >2000;

DELETE FROM ejercicio4
WHERE
    Comunidad LIKE 'M%';


DELETE FROM ejercicio4
WHERE
    Mujeres > Hombres;

DELETE FROM ejercicio4
WHERE
    Mujeres < Hombres;

TRUNCATE TABLE ejercicio8;











