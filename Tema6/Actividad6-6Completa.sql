-- 1. Selecciona todos los datos de las matrículas de los alumnos de Córdoba (el código de
-- los pueblos de Córdoba empieza por 14)

SELECT m.NIF, m.Cod_Asig, m.Nota, m.Fecha

FROM Matrícula m NATURAL JOIN Alumno a

WHERE a.Cod_Localidad = ANY(SELECT Cod_Loc

                        FROM Localidad

                        WHERE Cod_Loc LIKE '14%'

                        );
                        

SELECT m.NIF, m.Cod_Asig, m.Nota, m.Fecha

FROM Matrícula m NATURAL JOIN Alumno a

WHERE a.Cod_Localidad IN (SELECT Cod_Loc

                        FROM Localidad

                        WHERE Cod_Loc LIKE '14%'

                        );
                        
-- 2. Obtén el número de matrículas total de las asignaturas del departamento de
-- matemáticas

SELECT COUNT(*) "Número de matrículas"

FROM Matrícula m 

WHERE Cod_Asig = ANY (SELECT Código

                      FROM Asignatura 

                      WHERE Departamento LIKE "MAT"); 
                      
                      
SELECT COUNT(*) "Número de matrículas"

FROM Matrícula m 

WHERE Cod_Asig IN (SELECT Código

                      FROM Asignatura 

                      WHERE Departamento LIKE "MAT");                     
                      
-- 3. Selecciona el código de la asignatura y el NIF de los alumnos matriculados en alguna
-- asignatura del departamento de matemáticas. Usa dos soluciones: con join y con WHERE               

    SELECT m.Cod_Asig, m.NIF

    FROM Asignatura a , Matrícula m

    WHERE a.Código = m.Cod_Asig 
         
          AND a.Código = ANY(SELECT Código

                             FROM Asignatura

                             WHERE Departamento LIKE "MAT");
                                 
                                 

    SELECT m.Cod_Asig, m.NIF

    FROM Asignatura a INNER JOIN Matrícula m ON a.Código = m.Cod_Asig

    WHERE m.Cod_Asig = ANY (SELECT Código

                            FROM Asignatura

                            WHERE Departamento LIKE "MAT");

-- 4. Selecciona el código de la asignatura y el nombre completo de los alumnos
-- matriculados en alguna asignatura del departamento de matemáticas

SELECT m.Cod_Asig, concat_ws(" ",al.Nombre, al.Apellido1, al.Apellido2) 'Nombre completo'

FROM Alumno al NATURAL JOIN Matrícula m 

WHERE m.Cod_Asig = ANY (SELECT Código

                        FROM Asignatura

                        WHERE Departamento LIKE "MAT");


-- 5. Selecciona el nombre completo del alumno con la máxima nota. Incluye dos soluciones:
-- con subconsultas y sin subconsultas

SELECT concat_ws(" ",al.Nombre,al.Apellido1,al.Apellido2) 'Nombre completo'

FROM Alumno al NATURAL JOIN Matrícula m 
    
WHERE m.Nota = (SELECT MAX(nota)

                FROM Matrícula);
    
    
SELECT CONCAT(Nombre," ",Apellido1," ",Apellido2) as "Nombre completo" 

FROM Alumno,Matrícula

WHERE Matrícula.NIF=Alumno.NIF
   
ORDER BY Nota DESC 

LIMIT 1;


-- 6. Selecciona el NIF, el nombre y el primer apellido del resto de alumnos que se
-- matricularon el mismo año que el alumno de NIF '11111111A'

SELECT al.NIF,al.Nombre,al.Apellido1

FROM Alumno al NATURAL JOIN Matrícula m 

WHERE al.NIF <> '11111111A' and 
   
      year(m.Fecha) = any(SELECT distinct year(Fecha) 

                          FROM Matrícula

                          WHERE NIF='11111111A');    


-- 7. Selecciona el nombre y el primer apellido de los alumnos que se matricularon el mismo
-- año que Fernando Molina Molina

SELECT distinct al.Nombre, al.Apellido1

FROM Alumno al NATURAL JOIN Matrícula m

WHERE al.Nombre <> 'Fernando'  and al.Apellido1<>'Molina' and
      
      al.Apellido2 <> 'Molina' AND

      year(m.Fecha) = ANY(SELECT distinct year(Fecha)

                       FROM Matrícula m NATURAL JOIN Alumno al

                       WHERE al.Nombre = 'Fernando'); 
                       
-- Otra solución

SELECT al.Nombre, al.Apellido1

FROM Alumno al NATURAL JOIN Matrícula m

WHERE al.Nombre <> 'Fernando'  and al.Apellido1<>'Molina' and
      
      al.Apellido2 <> 'Molina' AND

      year(m.Fecha) = ANY(SELECT distinct year(Fecha)

                       FROM Matrícula m NATURAL JOIN Alumno al

                       WHERE al.Nombre = 'Fernando')

GROUP BY NIF;

-- 8. Selecciona el nombre y los apellidos de los alumnos cuya nota es más baja que la nota
-- media

SELECT al.Nombre, al.Apellido1

FROM Alumno al NATURAL JOIN Matrícula m

WHERE m.Nota < (SELECT AVG(Nota)

                FROM Matrícula);
               

-- 9. Selecciona el número de matrículas realizadas en cualquier curso por alumnos de la
-- localidad Palma del Río

SELECT COUNT(m.NIF) 'Número de matrículas'

FROM Matrícula m NATURAL JOIN Alumno al 

WHERE al.Cod_Localidad = (SELECT Cod_Loc 
                          FROM Localidad 
                          WHERE Nombre Like 'Palma del Río');


INSERT INTO Alumno VALUES
('55555555E','Felipe','Martínez','Martínez','Avenida de Madrid, 30',NULL,NULL);
INSERT INTO Alumno VALUES
('66666666F','Ángela','Estepa','Martínez','Avenida de Granada, 10',NULL,NULL);
INSERT INTO Matrícula VALUES ('55555555E',4,7,'2015-01-12');
INSERT INTO Matrícula VALUES ('66666666F',3,8,'2015-01-10');

-- 10. Muestra un listado de todos los alumnos que tengan alguna localidad asignada.
-- Muestra el nombre, apellido1, apellido2 y el nombre de la localidad

SELECT al.Nombre, al.Apellido1, al.Apellido2 ,l.Nombre

FROM Alumno al INNER JOIN Localidad l

ON al.Cod_Localidad = l.Cod_Loc

WHERE al.Cod_Localidad IS NOT NULL;


SELECT al.Nombre, al.Apellido1, al.Apellido2 ,l.Nombre

FROM Alumno al INNER JOIN Localidad l

ON al.Cod_Localidad = l.Cod_Loc

WHERE al.Cod_Localidad IN (SELECT Cod_Loc 
                           FROM Localidad);


-- 11. Muestra el mismo listado que el apartado anterior, pero incluyendo todos los alumnos.
-- Si no tienen ninguna localidad asignada, debe mostrarse el texto “Localidad no
-- asignada”. Resuelve la consulta de dos maneras


SELECT al.Nombre, al.Apellido1, al.Apellido2 ,IFNULL(l.Nombre,'Localidad no asignada') 'Nombre'

FROM Alumno al LEFT OUTER JOIN Localidad l

ON al.Cod_Localidad = l.Cod_Loc;


SELECT al.Nombre, al.Apellido1, al.Apellido2 ,IFNULL(l.Nombre,'Localidad no asignada') 'Nombre'

FROM Localidad l RIGHT OUTER JOIN Alumno al

ON l.Cod_Loc=al.Cod_Localidad;


-- 12. Muestra la nota media de los alumnos por localidad. Calcula también la de los alumnos
-- que no tienen ninguna localidad asignada

SELECT AVG(m.Nota) 'Nota Media', IFNULL(al.Cod_Localidad,'Sin localidad asignada') 'Localidad'

FROM Matrícula m INNER JOIN Alumno al ON m.NIF = al.NIF

GROUP BY 2

ORDER BY 1 DESC;


-- 13. Muestra un listado con el nombre completo de los alumnos que se matricularon en el
-- año más antiguo registrado en la base de datos

SELECT concat_ws(" ",al.Nombre,al.Apellido1,al.Apellido2) 'Nombre completo'

FROM Alumno al NATURAL JOIN Matrícula m

WHERE YEAR(m.Fecha) = (SELECT YEAR(MIN(Fecha))

                       FROM Matrícula)

GROUP BY 1;

SELECT concat_ws(" ",al.Nombre,al.Apellido1,al.Apellido2) 'Nombre completo'

FROM Alumno al NATURAL JOIN Matrícula m

WHERE YEAR(m.Fecha) = (SELECT YEAR(Fecha)
                       FROM Matrícula
                       ORDER BY 1
                       LIMIT 1)

GROUP BY 1;

-- 14. Muestra el nombre de las asignaturas (en mayúsculas) que en las que haya dos o más
-- matrículas registradas

SELECT distinct UPPER(a.Descripción) 'Asignatura'

FROM Asignatura a INNER JOIN Matrícula m

ON a.Código=m.Cod_Asig

WHERE a.Código IN (SELECT Cod_Asig

                   FROM Matrícula

                   GROUP BY Cod_Asig

                   HAVING COUNT(Cod_Asig) >= 2);

-- 15. Selecciona el código de las asignaturas que tengan el máximo 
-- número de matrículas realizadas

SELECT Cod_Asig
FROM Matrícula
GROUP BY 1
HAVING COUNT(*) >= (SELECT COUNT(*) 
                    FROM Matrícula 
                    group by Cod_Asig 
                    order by 1 DESC limit 1);


-- 16. Igual que el caso anterior, pero mostrando la descripción de las asignaturas en lugar
-- del código


SELECT Descripción 
FROM Matrícula m inner join Asignatura a on m.Cod_Asig=a.Código 
group by Cod_Asig 
having COUNT(*)=(SELECT COUNT(*) 
                 FROM Matrícula 
                 group by Cod_Asig 
                 order by 1 DESC 
                 limit 1);


-- 17. Selecciona la localidad que tenga dos o más alumnos matriculados

SELECT Nombre 
FROM Localidad l 
WHERE 2 <= (SELECT COUNT(Cod_Loc) 
            FROM Alumno a 
            WHERE a.Cod_Localidad=l.Cod_Loc);

-- 18. Selecciona la descripción de las asignaturas cuyo número de matrículas esté entre 0 y 1

SELECT Descripción 
FROM Asignatura a 
WHERE (SELECT COUNT(Cod_Asig) 
       FROM Matrícula 
       WHERE Cod_Asig=a.Código) BETWEEN 0 AND 1;
