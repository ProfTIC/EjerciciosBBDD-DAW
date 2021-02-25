-- 1. Muestra cómo quedarían las notas de todas las asignaturas si se redujeran en un 5%

SELECT Cod_Asig, Nota-Nota*0.05  -- Nota*0.95 
FROM Matrícula;

-- 2. Muestra los datos de todas las matrículas posteriores al 1 de julio de 2016

SELECT * 
FROM Matrícula 
WHERE Fecha > "2016-07-01";

-- 3. Cuenta el número de matrículas con nota mayor o igual que 7

SELECT count(*)
FROM Matrícula
WHERE Nota >=7;

-- 3a. Muestra el número de alumnos con nota mayor o igual que 7 en alguna asignatura

SELECT count(distinct NIF) FROM Matrícula WHERE Nota >=7;


-- 4. Muestra el nombre y los dos apellidos de todos los alumnos en un único campo
-- separados por un guión (usa CONCAT_WS)

SELECT Nombre,CONCAT_WS("-",Apellido1,Apellido2) as "Apellidos"
FROM Alumno;

-- 5. Muestra el nombre y el primer apellido de todos los alumnos en mayúsculas

SELECT UPPER(CONCAT_WS(" ",Nombre, Apellido1)) AS "Alumno"

FROM Alumno;

SELECT CONCAT_WS(" ",upper(Nombre), upper(Apellido1)) AS "Alumno"  
FROM Alumno;

