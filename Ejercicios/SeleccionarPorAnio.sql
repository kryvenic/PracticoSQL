/*Seleccionando registros filtrados por diferentes años en particular*/

--Forma 1:
SELECT * 
FROM platzi.alumnos
WHERE(EXTRACT (YEAR FROM fecha_incorporacion)) = 2019;

--Forma 2:
SELECT * 
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

--Forma 3:
SELECT * 
FROM (
	SELECT *,
		DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio
WHERE anio_incorporacion = 2020;


	/* RETO: Extraer datos de 2 campos TIMESTAMP.
			Saber cuales fueron los alumnos que se incorporaron en Mayo del 2018. */

	--Solucion 1:

	SELECT * 
	FROM platzi.alumnos
	WHERE (EXTRACT (YEAR FROM fecha_incorporacion)) = 2018
	AND (EXTRACT (MONTH FROM fecha_incorporacion)) = 5;


	--Solucion 2:
	SELECT * FROM(
		SELECT *,
		DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
		DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion
		FROM platzi.alumnos
	) AS alumnos_2018_mayo
	WHERE anio_incorporacion = 2018 AND mes_incorporacion = 5;