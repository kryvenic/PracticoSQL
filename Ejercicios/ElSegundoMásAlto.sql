--El segundo más alto: Consiste en traer la 2da colegiatura más alta.

--1er Solución:
SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	SELECT COUNT (DISTINCT colegiatura)
	FROM platzi.alumnos a2
	WHERE a1.colegiatura <= a2.colegiatura
);

--2da Solución:
SELECT DISTINCT colegiatura
FROM platzi.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

--3ra Solución: (Todos los que tengan la misma colegiatura)
SELECT * 
FROM platzi.alumnos AS datos_alumnos
INNER JOIN(
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;

--4ta Solución:
SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura =(
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);



--RETO: Traer la 2da mitad de los registros de la tabla.

--1er Solución
SELECT * FROM platzi.alumnos
WHERE id > 499;

--2da Solución
SELECT * FROM platzi.alumnos
LIMIT 500 OFFSET 500;

--3ra Solución
SELECT * FROM platzi.alumnos
WHERE id BETWEEN 500 AND 1000;

--Solución hecha por el Profesor
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
OFFSET(
	SELECT COUNT(*) /2
	FROM platzi.alumnos
);