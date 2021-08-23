/* Traemos los maximos de distintos campos y registros.*/

SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

-- Carreras con las fechas de incorporacion mas recientes.
SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;


--RETO: Sacar el minimo nombre de todos los registros. Luego, el minimo nombre por id_tutor

--1er solucion
SELECT MIN(nombre)
FROM platzi.alumnos;

--2da Solucion:
SELECT nombre FROM platzi.alumnos ORDER BY nombre ASC LIMIT 1;

--Solucion nombre con tutor
SELECT tutor_id, MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;
