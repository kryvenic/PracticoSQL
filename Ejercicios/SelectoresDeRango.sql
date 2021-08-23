/*
	DISTINTAS FORMAS DE SELECCIONAR POR RANGOS */
	
-- con set de opciones (IN)
SELECT * FROM platzi.alumnos
WHERE tutor_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- con operadores de comparación
SELECT * FROM platzi.alumnos
WHERE tutor_id >= 1 AND tutor_id <= 10;

-- con BETWEEN
SELECT * FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;


-- Seleccionando rangos de números enteros
SELECT int4range(10, 20); -- [10, 20)
SELECT int4range(10, 20) @> 3; -- FALSE
SELECT int4range(10, 20) @> 10; -- TRUE
SELECT int4range(10, 20) @> 20; -- FALSE


-- Seleccionando rangos de números decimales
SELECT numrange(11.1, 22.2); -- [11.1, 22.2)
SELECT numrange(20.0, 30.0); -- [20.0, 30.0)
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0); -- TRUE
SELECT numrange(11.1, 19.9) && numrange(20.0, 30.0); -- FALSE

-- Funciones de rangos
SELECT UPPER(int4range(15, 25)); -- 25
SELECT LOWER(int4range(15, 25)); -- 15
SELECT int4range(10, 20) * int4range(15, 25); -- [15, 20) (el * verifica números en común)
SELECT ISEMPTY(numrange(1, 5)); -- FALSE

--Seleccionando los tutor_id con un rango entre 10 y 20
SELECT * FROM platzi.alumnos
WHERE int4range (10,20) @> tutor_id;


--RETO: Extraer los valores en comun entre los id de tutores y de carreras.
SELECT int4range(MIN(carrera_id), MAX(carrera_id)) *
		int4range (MIN(tutor_id), MAX(tutor_id))
FROM platzi.alumnos;

--Otra forma con numrange
SELECT numrange(
	(SELECT MIN(tutor_id) FROM platzi.alumnos),
	(SELECT MAX(tutor_id) FROM platzi.alumnos)
) * numrange (
	(SELECT MIN(carrera_id) FROM platzi.alumnos),
	(SELECT MAX(carrera_id) FROM platzi.alumnos)
);

