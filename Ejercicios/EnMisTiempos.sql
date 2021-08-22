/* Ejercicios para aprender a extraer ciertos datos de
una tabla de tipo TIMESTAMP de diferentes formas*/

--Solucion 1:
SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

--Solucion 2:
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
	   DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion,
	   DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion
FROM platzi.alumnos;

-- RETO: Extraer por hora, minuto y segundo de la tabla incorporacion.

--1er Solucion
SELECT DATE_PART('HOUR', fecha_incorporacion) AS hora_incorporado,
	   DATE_PART('MINUTES', fecha_incorporacion) AS minutos_incorporado,
	   DATE_PART('SECOND', fecha_incorporacion) AS segundos_incorporado
FROM platzi.alumnos;

--2da Solucion
SELECT EXTRACT (HOUR FROM fecha_incorporacion) AS hora_incorporado,
	   EXTRACT (MINUTE FROM fecha_incorporacion) AS minuto_incorporado,
	   EXTRACT (SECOND FROM fecha_incorporacion) AS segundo_incorporado
FROM platzi.alumnos;