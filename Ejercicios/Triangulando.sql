-- funcion lpad
SELECT lpad('sql', 15, '*'); -- ************sql (15 caracteres en total)
SELECT lpad('sql', 15, '+'); -- ++++++++++++sql (15 caracteres en total)

-- lpad con select
SELECT lpad('sql', id, '*') FROM platzi.alumnos WHERE id < 10;

-- seleccionando un triangulo con 10 ids
SELECT lpad('*', id, '*') FROM platzi.alumnos WHERE id < 10;

-- seleccionando un triangulo con todos los ids
SELECT lpad('*', id, '*') FROM platzi.alumnos;

-- seleccionando un triangulo desordenado
SELECT lpad('*', id, '*'), carrera_id
FROM platzi.alumnos
WHERE id < 10

-- sin ordenar por otro campo
SELECT lpad('*', CAST(row_id AS INT), '*')
FROM (
    SELECT ROW_NUMBER() OVER() AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_id
WHERE row_id <= 5;

-- ordenando por otro campo
SELECT lpad('*', CAST(row_id AS INT), '*')
FROM (
    SELECT ROW_NUMBER() OVER(
        ORDER BY carrera_id
      ) AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;

--Generando un Diagrama de Barras comparativas.
SELECT CONCAT(nombre, ' ', apellido) ,colegiatura, LPAD('|', 
CAST(colegiatura AS int)/100, '|') AS coleg_bar
FROM platzi.alumnos;

--rpad rellena por la derecha en este ejemplo toma el texto hola y lo va rellenando con * a la derecha
SELECT rpad('hola', id, '*')
FROM platzi.alumnos
where id <10


--Probando rpad y lpad
SELECT
 	lpad('*|*', CAST(row_id AS int), 'Soy un relleno que va a la izquierda'),
	rpad('*|*', CAST(row_id AS int), 'Soy un relleno que va a la derecha')
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 89
ORDER BY carrera_id;