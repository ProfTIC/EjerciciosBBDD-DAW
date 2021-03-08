-- Ejercicio 6.2

-- 1)

select curdate() "Fecha actual";


-- 2)

select now() "Fecha y hora actuales";

-- 3) 

select time(Now()) "Hora actual";


-- 4) 

select dayname('2021-02-25') "Día de la semana" from DUAL;

-- 5) 

select weekday('2021-02-25') "Día de la semana" from DUAL;

-- 6) 

select date_add('2021-02-02',interval 15 day) "Fecha de devolución";

-- 7) 

select date_add('2021-02-02',interval 1 month) "Fecha de devolución";


-- 8)

select date_add('2021-02-02',interval 30 day) "Fecha de devolución";

-- 9) 


select monthname('2010-02-19') "Mes" from DUAL;


-- 10)

select concat('El año es: ',extract(Year from '2019-02-25'), '. El mes es: ', 
	    extract(Month from '2019-02-25'),'. El día es: ',extract(Day from '2019-02-25')) "Fecha" from Dual;


-- 11) 

select concat(dayname('2019-02-25'),', ' , extract(Day from '2019-02-25'),' de ', monthname('2019-02-25'), ' de ', extract(Year from '2019-02-25')) "Fecha " from Dual;
	  
select concat(extract(Month from '2019-02-25'),'. El día es: ',extract(Day from '2019-02-25')) "Fecha" from Dual;

-- 12) 

set lc_time_names='es_ES';

select concat(dayname('2019-02-25'),', ',extract(Day from '2019-02-25'),' de ', monthname('2019-02-25'), ' de ', extract(Year from '2019-02-25')) "Fecha " from Dual;

select concat(weekday('2019-02-25'),extract(Day from '2019-02-25'),' de ', monthname('2019-02-25'), ' de ', extract(Year from '2019-02-25')) "Fecha " from Dual;



-- 13)

select minute(NOW()) "Minutos " from DUAL;

-- 14)

select second(NOW()) "Segundos " from DUAL;

-- 15)

select datediff('2019-03-29','2019-02-01') "Días entre las dos fechas" from DUAL;

-- 16)

select datediff('2021-01-01','2021-01-31') "Días entre las dos fechas" from DUAL;

select datediff('2021-01-31','2021-01-01') "Días entre las dos fechas" from DUAL;

-- 17)

select datediff(now(),'2021-01-11') "Días del segundo trimestre (a fecha 12/02)" from DUAL;

-- 18)

select datediff('2021-01-11','2020-12-23') "Días de vacaciones de Navidad";


