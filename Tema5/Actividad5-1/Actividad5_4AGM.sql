
DROP DATABASE IF EXISTS ACTIVIDAD5_1AGM;
CREATE DATABASE IF NOT EXISTS ACTIVIDAD5_1AGM;

USE ACTIVIDAD5_1AGM;

/*Ejercicio 4*/
CREATE TABLE Ejercicio4 (comunidad VARCHAR(40) PRIMARY KEY, mujeres int,
       hombres int, total int);
       
       INSERT INTO Ejercicio4 (comunidad, mujeres, hombres, total) 
       VALUES  ('Andalucía', 1390, 1282, mujeres+hombres),
					('Aragón', 192, 159, mujeres+hombres),
					('Asturias (Principado de)', 144, 156, mujeres+hombres),
					('Balears (Illes)', 56, 46, mujeres+hombres),
					('Canarias', 189, 139, mujeres+hombres),
					('Cantabria', 74, 89, mujeres+hombres),
					('Castilla - La Mancha', 40, 74, mujeres+hombres),
					('Castilla y León', 374, 313, mujeres+hombres),
					('Cataluña', 1674, 1462, mujeres+hombres),
					('Comunitat Valenciana', 1205, 1012, mujeres+hombres),
					('Estado', 75, 111, mujeres+hombres),
					('Extremadura', 175, 136, mujeres+hombres),
					('Galicia', 337, 300, mujeres+hombres),
					('Madrid (Comunidad de)', 2294, 2102, mujeres+hombres),
					('Murcia (Región de)', 339, 305, mujeres+hombres),
					('Navarra (Comunidad Foral de)', 142, 118, mujeres+hombres),
					('País Vasco', 369, 365, mujeres+hombres);
