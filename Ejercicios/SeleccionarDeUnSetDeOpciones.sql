--Seleccionar Un arreglo de registros en particular

SELECT * 
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num 
WHERE row_id IN (1, 8, 88, 27, 90, 3);

--Otra forma de lograrlo con Subqueries

SELECT * FROM platzi.alumnos
WHERE id IN (
	SELECT id FROM platzi.alumnos
	WHERE tutor_id = 30
		AND carrera_id = 37
);

-- RETO: Traer a la lista de Registros que no se encuentran en cierta condición de Subqueries.
--Ejemplo: Todos los registros que no esten en id(1, 4, 12, 89).

--1er Solución
SELECT * FROM platzi.alumnos
WHERE id NOT IN (
	SELECT id FROM platzi.alumnos
	WHERE tutor_id = 15 
	OR tutor_id = 12
);

--2da Solución
SELECT * FROM platzi.alumnos
WHERE tutor_id NOT IN (29, 17, 14, 15, 25);

--3ra Solución
SELECT * FROM platzi.alumnos
WHERE colegiatura IN(
	SELECT colegiatura FROM platzi.alumnos
	WHERE colegiatura <> 5000
);

--4ta Solución
SELECT nombre, apellido, carrera_id FROM platzi.alumnos
WHERE carrera_id NOT IN(
	SELECT carrera_id FROM platzi.alumnos
	WHERE carrera_id = 7 OR carrera_id = 35
);