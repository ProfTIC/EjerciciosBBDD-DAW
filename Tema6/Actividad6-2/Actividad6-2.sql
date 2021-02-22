-- Realiza las siguientes consultas:

/* 1. Muestra el precio con IVA para todos los productos */

SELECT Precio_Compra *1.21 as "Precio con IVA" -- Precio_Compra+Precio_Compra*0.21

FROM Producto;

-- 2. Muestra el precio con IVA para los productos que valgan menos de 11 euros--

SELECT Precio_Compra *1.21 as "Precio con IVA" -- Precio_Compra+Precio_Compra*0.21

FROM Producto

WHERE Precio_Compra < 11;

-- 3. Muestra el precio con IVA para los productos cuyo precio esté entre 10 y 20 euros

SELECT Denominación, Precio_Compra*(1+0.21) "Precio con IVA " 
FROM Producto 
WHERE Precio_Compra between 10 and 20 ;

SELECT Denominación, Precio_Compra*(1+0.21) "Precio con IVA " 
FROM Producto 
WHERE Precio_Compra >=10 AND Precio_Compra <=20;

-- 4. Muestra todas las secciones en los que el número del empleado jefe sea menor que 6

SELECT * 
FROM Sección 
WHERE N_Empl_Jefe < 6;

-- 5. Muestra los datos del empleado cuyo código sea la raíz cuadrada de 4

SELECT *

FROM Empleado

WHERE N_Empl=SQRT(4); 

-- 6. Obtén las iniciales de los empleados

SELECT concat_ws('',left(Nombre,1),left(Apellido1,1),left(Apellido2,1)) "Inicial"

FROM Empleado;

SELECT concat(left(Nombre,1),left(Apellido1,1),left(Apellido2,1)) "Inicial"  
FROM Empleado;


select concat(substring(Nombre,1,1),substring(Apellido1,1,1),substring(Apellido2,1,1)) "Iniciales" 

from Empleado;

-- 7. Selecciona el nombre y la longitud del mismo para todos los empleados

SELECT concat_ws('-',Nombre,Length(Nombre)) "Nombre"

FROM Empleado;

-- 8. Muestra el nombre completo de todos los empleados (nombre + apellido1+ apellido2)

select concat(Nombre," ",Apellido1," ", Apellido2) "Nombre Completo" 
from Empleado;

select concat_ws(" ",Nombre,Apellido1,Apellido2) "Nombre Completo" 
from Empleado;

-- 9. Realiza la misma consulta que en el apartado 7 pero el valor devuelto deberá estar en minúsculas

SELECT concat_ws(" ",LOWER(Nombre),LOWER(Apellido1),LOWER(Apellido2)) "Nombre completo en minúsculas"
FROM Empleado;


SELECT LOWER(CONCAT(Nombre," ",Apellido1," ",Apellido2)) AS "Nombre Completo" 
FROM Empleado;


SELECT LOWER(CONCAT_WS(" ",Nombre,Apellido1,Apellido2)) AS "Nombre Completo" 
FROM Empleado;

-- 10. Realiza la misma consulta que en el apartado, mostrando el nombre como esté almacenado en la base de datos y los dos apellidos en mayúscula. Por ejemplo, Santiago RODRÍGUEZ RODRÍGUEZ
SELECT CONCAT(Nombre," ", UPPER(CONCAT(Apellido1," ",Apellido2))) 

 AS "Nombre Completo" 

FROM Empleado;s


-- 11. Muestra el código de la provincia y el nombre separados por un guión. Usa concat_ws.

select concat_ws("-",Cod_Prov,Nombre) "Provincia"
from Provincia;


-- 12. Muestra el código de la provincia y el nombre con el siguiente formato: Albacete tiene el código de provincia 01

SELECT concat_ws(" tiene el código de provincia ",Nombre,Cod_Prov) "Provincia"

FROM Provincia;

-- 13. Muestra todas las provincias cuyo nombre tenga diez o más caracteres

SELECT Cod_Prov,Nombre 

FROM Provincia 

WHERE LENGTH(Nombre)>=10;

-- 14. Muestra los empleados que sean de Granada (el código es 17)

select * 
from Empleado
where Cod_Prov='17';

-- 15. Muestra todos los empleados de la sección EDU

SELECT * 

FROM Empleado 

WHERE Id_Sec = "EDU";


SELECT * 

FROM Empleado 

WHERE Id_Sec like "EDU";

-- 16. Muestra el nombre y el correo de las empresas que tengan un correo acabado en .es

SELECT Nombre,Correo

FROM Empresa

WHERE Correo LIKE '%.es';

-- 17. Muestra el código, el nombre y el teléfono de las empresas cuyo nombre empiece por Edu

SELECT Cod_Empr,Nombre,Telefono

FROM Empresa

WHERE Nombre LIKE "Edu%";

-- 18. Muestra los caracteres 2 a 6 de la descripción de todas las empresas

select substring(Descripción,2,6) 
from Sección;

-- 19. Muestra los primeros cinco caracteres del nombre de las empresas

SELECT LEFT(Nombre,5) FROM Empresa;

SELECT substring(Nombre,1,5) FROM Empresa;

-- 20. Muestra la parte derecha del correo de todas las empresas (lo que aparece delante de @)

select substring(Correo,1,instr(Correo,"@")-1) "Parte izquierda del correo" 
from Empresa;

SELECT SUBSTRING_INDEX(Correo,'@',1) 'Parte izquierda del correo'
FROM Empresa;

SELECT LEFT(Correo,INSTR(Correo,"@")-1) 
FROM Empresa;
