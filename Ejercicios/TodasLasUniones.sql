/*
	Veremos a continuación todos los tipos de uniones con SQL 
	(JOINS)	*/

--Full Outer Join (Se une todo)
SELECT 
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
FROM platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY a.carrera_id;


--Left Join Exclusivo(En este caso alumnos que no tengan carrera).
SELECT
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL; --Para un Left Join normal (Inclusivo), lo único que hacemos es borrar esta cláusula WHERE.


--Right JOIN (Trae todas las carreras sin importar si tienen o no alumnos)
SELECT
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
FROM platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id --WHERE a.id IS NULL para un Right Join EXCLUSIVO (Solo para ver las carreras).
ORDER BY c.id DESC;


--INNER JOIN: Trae los elementos en comun de ambas tablas.
SELECT
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
FROM platzi.alumnos AS a
	INNER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;


--FULL OUTER JOIN con Diferencia Simétrica (Lo que esta en A pero no en B, en B pero no en A).
SELECT
	a.nombre,
	a.apellido,
	a.carrera_id,
	c.id,
	c.carrera
FROM platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
	WHERE a.id IS NULL OR c.id IS NULL --Sentencia para la diferencia simétrica.
ORDER BY a.carrera_id DESC, c.id DESC;


--RETO: Practicar y predecir el resultado del Query.

SELECT a.nombre, a.apellido, c.carrera
FROM platzi.alumnos AS a
INNER JOIN platzi.carreras AS c
ON a.id = c.id
WHERE c.carrera = 'Química'; --Nos dara la lista de alumnos que están en Quimica.


SELECT 
	c.carrera,
	c.id,
	a.nombre,
	a.apellido,
	a.carrera_id
FROM platzi.carreras AS c
FULL OUTER JOIN platzi.alumnos AS a
ON c.id = a.carrera_id
WHERE c.vigente = false
ORDER BY c.id ASC; --Todos los alumnos con carreras NO VIGENTES, ordenado por el id de carrera.


