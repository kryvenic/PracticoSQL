SELECT carrera_id, COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;

--LEFT JOIN EXCLUSIVO (DIFERENCIAS)
SELECT a.nombre, 
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL
ORDER BY a.carrera_id;


--RETO: HACER UN LEFT JOIN NORMAL (No exclusivo), donde no importa si está o no en la tabla derecha.
SELECT * 
FROM platzi.alumnos AS a
LEFT JOIN platzi.carreras AS c
<<<<<<< HEAD
ON a.carrera_id = c.id
=======
ON a.carrera_id = c.id;

--Otra forma con FULL OUTER JOIN (Recomendada)
SELECT a.nombre, 
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL
ORDER BY a.carrera_id;
