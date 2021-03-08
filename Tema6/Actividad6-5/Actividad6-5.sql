-- 1. Obtén un listado de las matrículas donde figure
-- la descripción de cada asignatura ordenados por nota de forma ascendente

SELECT NIF, Descripción, Nota, Fecha
FROM Matrícula m, Asignatura a
WHERE m.Cod_Asig = a.Código
ORDER BY 3; -- Nota

-- 2. Muestra cómo quedarían las notas de todas las asignaturas si se redujeran en un 5%
-- incluyendo la descripción de la asignatura en lugar del código

SELECT Asignatura.Descripción, Nota*(0.95) 'Nueva Nota'
FROM Matrícula, Asignatura
WHERE Matrícula.Cod_Asig=Asignatura.Código;

SELECT a.Descripción, Nota*(0.95) 'Nueva Nota'
FROM Matrícula m, Asignatura a
WHERE m.Cod_Asig=a.Código;

--3. Muestra cómo quedarían las notas de las asignaturas de informática si se redujeran en
-- un 5%, incluyendo la descripción

SELECT Asignatura.Descripción, Nota*(0.95) 'Nueva Nota'
FROM Matrícula, Asignatura
WHERE Matrícula.Cod_Asig=Asignatura.Código AND 
      Asignatura.Descripción like 'Informática';

SELECT a.Descripción, Nota*(0.95) 'Nueva Nota'
FROM Matrícula m, Asignatura a
WHERE m.Cod_Asig=a.Código AND
	a.Descripción like 'Informática';
	
-- 4. Muestra las matrículas de biología posteriores al 1 de julio de 2016

SELECT m.*
FROM Matrícula m, Asignatura a
WHERE m.Cod_Asig=a.Código AND
      a.Descripción Like "Biología" AND 
      m.Fecha >= "2016-07-01";
      
-- 5. Muestra las matrículas de biología posteriores al 1 de julio de 2016, figurando el curso
-- de cada asignatura y la descripción en lugar del código

SELECT NIF, Descripción, Curso, Nota, Fecha
FROM Matrícula m, Asignatura a
WHERE m.Cod_Asig=a.Código AND
      a.Descripción Like "Biología" AND 
      m.Fecha >= "2016-07-01";
      
-- 6. Obtén un listado con el NIF y el nombre completo de los alumnos junto con su nota
-- media

SELECT al.NIF, CONCAT_WS(" ",al.Nombre, al.Apellido1, al.Apellido2) "Nombre Completo", AVG(m.Nota) "Nota Media" 
FROM Matrícula m, Alumno al 
WHERE al.NIF = m.NIF 
GROUP BY al.NIF;

-- 7. Obtén un listado con la descripción de 
-- las asignaturas y la fecha en las que se ha
-- matriculado Elías, ordenados 
-- por fecha de forma descendente

SELECT Nombre,Descripción,Fecha 
FROM Alumno,Matrícula,Asignatura 
WHERE Matrícula.NIF=Alumno.NIF AND 
	  Matrícula.Cod_Asig=Asignatura.Código AND 
	  Nombre = "Elías"; 
	  
	 SELECT a.Descripción, m.Fecha
	 FROM Asignatura a, Matrícula m, Alumno al
	 WHERE m.Cod_Asig=a.Código and
	       m.NIF=al.NIF AND
	       al.Nombre = 'Elías'
	 ORDER BY m.Fecha DESC;
	 
-- 8. Muestra los alumnos con nota media 
-- mayor o igual que 6

SELECT  A.Nombre

FROM Alumno A, Matrícula M

WHERE A.NIF = M.NIF 

GROUP BY A.NIF

HAVING AVG(M.Nota) >= 6;



