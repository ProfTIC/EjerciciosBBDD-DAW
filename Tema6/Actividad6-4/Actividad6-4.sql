use Tema7;

-- 1 . Muestra cómo quedarían las notas de todas las asignaturas si se redujeran en un 5%

SELECT Nota*0.95 
FROM Matrícula;

-- 2. Muestra los datos de todas las matrículas posteriores al 1 de julio de 2016

select * 
from Matrícula 
where Fecha > "2016-07-01";

-- 3. Cuenta el número de matrículas con nota mayor o igual que 7

SELECT COUNT(*) AS "Número de matrículas" 
FROM Matrícula 
WHERE Nota >= 7;

-- 4. Muestra el nombre y los dos apellidos de todos los alumnos en un único campo
-- separados por un guión (usa CONCAT_WS)

SELECT Nombre, CONCAT_WS("-",Apellido1, Apellido2) AS "Apellidos" 
FROM Alumno;

-- 5. Muestra el nombre y el primer apellido de todos los alumnos en mayúsculas

SELECT UPPER(CONCAT_WS(" ",Nombre,Apellido1)) as "Nombre" 
FROM Alumno;

-- 6. Muestra la descripción de cada asignatura junto con el código de departamento en
-- minúsculas

SELECT Descripción, LOWER(Departamento) as "Departamento"
FROM Asignatura;

-- 7. Muestra un listado con todas las matrículas, incluyendo el año en lugar de la fecha

SELECT NIF,Cod_asig,Nota,YEAR(Fecha) 'Año'
FROM Matrícula;

SELECT NIF,Cod_asig,Nota,Date_format(Fecha,"%Y") 'Año'
FROM Matrícula;

-- 8. Muestra un listado con todas las matrículas, incluyendo el año en lugar de la fecha
-- para todas las matrículas con nota menor o igual a 6

SELECT NIF,Cod_asig,Nota,YEAR(Fecha) 'Año'
FROM Matrícula
WHERE Nota <=6;

SELECT NIF,Cod_asig,Nota,Date_format(Fecha,"%Y") 'Año'
FROM Matrícula
WHERE Nota <=6;

-- 9. Muestra un listado con todas las matrículas, sumándole un año a la fecha de
-- matriculación

SELECT NIF,Cod_Asig,Nota,DATE_ADD(Fecha,INTERVAL 1 YEAR) as "Fecha" 
FROM Matrícula;

SELECT NIF,Cod_Asig,Nota,adddate(Fecha,INTERVAL 1 YEAR) as "Fecha" 
FROM Matrícula;

SELECT NIF,Cod_Asig,Nota,TIMESTAMPADD(YEAR,1,Fecha) as "Fecha" 
FROM Matrícula;

-- 10. Muestra un listado con las matrículas cuyo código de asignatura sea mayor que 4 y la
-- nota sea menor que 7 restándole a la fecha un mes

SELECT NIF,Cod_Asig,Nota,DATE_SUB(Fecha,INTERVAL 1 MONTH) as "Fecha" 
FROM Matrícula 
WHERE Cod_Asig > 4 AND Nota < 7;

-- 11. Muestra un listado con los datos de todas las asignaturas. Si el departamento es nulo,
-- debe mostrar el texto “Sin departamento”. Ordénalos por descripción de forma
-- ascendente y por código de forma descendente

SELECT Código,Descripción,Curso,
	CASE WHEN Departamento IS NULL THEN "Sin departamento" 
    ELSE Departamento 
    END AS Departamento 
FROM Asignatura 
ORDER BY Descripción asc, Código DESC; -- ORDER BY 2 asc, 1 DESC ;

SELECT Código,Descripción,Curso, IFNULL(Departamento, "Sin departamento")  AS "Departamento" 
FROM Asignatura
ORDER BY 2 asc, 1 DESC; 

-- 12. Selecciona los datos de todas las localidades cuyo nombre tenga una longitud de 10
-- caracteres y su código empiece por 50. Ordénalas por orden de Z-A

SELECT *
FROM Localidad
WHERE LENGTH(Nombre)=10 AND Cod_Loc LIKE '50%'
ORDER BY Nombre DESC;


SELECT *
FROM Localidad
WHERE LENGTH(Nombre)=10 AND SUBSTR(Cod_Loc,1,2) LIKE '50'  -- =
ORDER BY Nombre DESC;

SELECT *
FROM Localidad
WHERE LENGTH(Nombre)=10 AND LEFT(Cod_Loc,2)='50'  -- =
ORDER BY Nombre DESC;

-- 13. Cuenta el número de alumnos distintos que han hecho alguna matrícula

SELECT COUNT(distinct NIF) 'Nº Alumnos'
FROM Matrícula;

-- 14. Cuenta el número de asignaturas de 3o de ESO

SELECT COUNT(Curso) 'Asignaturas 3º ESO'
FROM Asignatura
WHERE Curso='3-ESO';

SELECT COUNT(Curso) 'Asignaturas 3º ESO'
FROM Asignatura
WHERE Curso like '3-ESO';

-- 15. Selecciona la nota media de todas las matrículas

SELECT AVG(Nota) AS "Nota media" 
FROM Matrícula;

-- 16. Obtén la nota media de todas las matrículas realizadas entre el 1/07/2015 y el
-- 10/07/2015

SELECT AVG(Nota) AS "Nota media" 
FROM Matrícula 
WHERE Fecha BETWEEN "2015-07-01" AND "2015-07-10";

-- 17. Calcula la nota media de todas las matrículas sin usar la función AVG

SELECT SUM(Nota)/COUNT(Nota) AS "Nota media" 
FROM Matrícula;

-- 18. Determina la nota máxima de todas las matrículas

SELECT NIF, MAX(Nota) AS "Nota maxima" 
FROM Matrícula
GROUP BY NIF;

-- 19. Determina la nota mínima de todas las matrículas realizadas antes del 1 de julio de
-- 2016

SELECT MIN(Nota) AS "Nota Minima" 
FROM Matrícula 
WHERE Fecha < "2016-07-01";

-- 20. Calcula la nota máxima de cada alumno

SELECT NIF, MAX(Nota) AS "Nota maxima" 
FROM Matrícula 
GROUP BY NIF;

-- 21. Calcula para cada asignatura la media de las notas de sus matrículas. Muéstralas
-- ordenadas por nota en forma descendente

SELECT Cod_asig,AVG(Nota) 'Media'
FROM Matrícula
GROUP BY Cod_asig
ORDER BY Media DESC; -- 2

-- 22. Selecciona el máximo de todas las notas de las asignaturas con código menor o igual
-- que dos o código mayor que cinco

SELECT MAX(Nota) AS "Nota maxima" 
FROM Matrícula 
WHERE Cod_Asig <= 2 OR Cod_Asig >= 5 ;

-- 23. Calcula la nota media de las matrículas por año. Ordena el listado por el valor de la
-- nota media de forma descendente

SELECT YEAR(Fecha) AS "Año", AVG(Nota) AS "Nota Media" 
FROM Matrícula 
group by YEAR(Fecha) 
ORDER BY 2 DESC;

-- 24. Determina la nota mínima obtenida para cada alumno, incluyendo el año en que la
-- obtuvo

SELECT DISTINCT NIF, Min(Nota) AS "Nota Minima", YEAR(Fecha) AS "Año" 
FROM Matrícula 
GROUP BY NIF, Fecha;

-- 25. Determina la nota mínima obtenida para cada alumno, incluyendo el año en que la
-- obtuvo, pero sólo para los alumnos de NIF 11111111A y 44444444D

SELECT DISTINCT NIF, Min(Nota) AS "Nota Minima", YEAR(Fecha) AS "Año" 
FROM Matrícula 
WHERE NIF = "11111111A" OR NIF = "44444444D" 
GROUP BY 1, 3;

-- 26. ¿Cuántos alumnos hay en cada localidad? Muestra el código de la localidad y el
-- número de alumnos

SELECT Cod_Localidad, COUNT(Cod_Localidad) AS "Nº Alumnos" 
FROM Alumno 
GROUP BY Cod_Localidad;


-- 27. Muestra el código de la localidad y el número de alumnos de aquellas localidades que
-- tengan 2 ó más alumnos

SELECT Cod_Localidad, COUNT(NIF) AS "Nº Alumnos" 
FROM Alumno 
GROUP BY Cod_Localidad
HAVING COUNT(NIF)>=2;
