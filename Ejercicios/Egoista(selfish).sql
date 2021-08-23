/* Haciendo un Self Join, un JOIN en la misma tabla
	en el caso de que un tutor también pueda ser un alumno. Por ej:*/
	
SELECT a.nombre,
		a.apellido,
		t.nombre,
		t.apellido
FROM platzi.alumnos AS a 
INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

--Hacer mas legible con CONCAT
SELECT CONCAT(a.nombre, ' ', a.apellido) AS alumno,
		CONCAT(t.nombre,' ', t.apellido) AS tutor
FROM platzi.alumnos AS a 
INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

--Contar cuantos alumnos tiene cada tutor.
SELECT	CONCAT(t.nombre,' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a 
INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10; --limitando al TOP 10 de tutores


--RETO: Obtener el promedio general por tutor
SELECT AVG(alumnos_por_tutor)AS promedio_alumnos_por_tutor
FROM (
	SELECT	CONCAT(t.nombre,' ', t.apellido) AS tutor,
			COUNT(*) AS alumnos_por_tutor
	FROM platzi.alumnos AS a 
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
	GROUP BY tutor)
	AS alumnos_tutor;
