/* ENCONTRANDO REGISTROS DUPLICADOS */
--Traerá los registros duplicados en caso de que tengan el mismo ID
SELECT * 
FROM platzi.alumnos AS ou 
WHERE (
	SELECT COUNT(*)
	FROM platzi.alumnos AS inr
	WHERE ou.id = inr.id
) > 1;

--Con '::text' lo que hacemos es un casteo, para que nos devuelva todos los campos en formato TEXTO.
SELECT (platzi.alumnos.*)::text, COUNT(*) 
FROM platzi.alumnos
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;

--Mismo que el anterior, seleccionando que campos queremos que cuente a la vez para detectar duplicados.
--Esto sucede porque en las buenas practicas, el ID nunca se repite.
SELECT (platzi.alumnos.nombre,
	    platzi.alumnos.apellido,
	   platzi.alumnos.email,
	   platzi.alumnos.colegiatura,
	   platzi.alumnos.fecha_incorporacion,
	   platzi.alumnos.carrera_id,
	   platzi.alumnos.tutor_id)::text, COUNT(*) 
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
	    platzi.alumnos.apellido,
	   platzi.alumnos.email,
	   platzi.alumnos.colegiatura,
	   platzi.alumnos.fecha_incorporacion,
	   platzi.alumnos.carrera_id,
	   platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;

--3er Forma con Subqueries y Windows Functions

SELECT * 
FROM (
	SELECT id, 
	ROW_NUMBER() OVER(
		PARTITION BY 
			nombre, 
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		ORDER BY id ASC
	) AS row,
	*
	FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1;


--RETO: Eliminar los duplicados y dejarlo como estaba.

DELETE FROM platzi.alumnos
WHERE id IN(
	SELECT id
	FROM(
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY 
			nombre, 
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		ORDER BY id ASC
	) AS row
	FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1);
