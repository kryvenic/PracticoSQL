--EL PRIMERO: Consiste en traer los primeros 5 registros de la tabla alumnos.

--Solución 1://

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id <=5;

--Solucion 2: 

SELECT * FROM platzi.alumnos
LIMIT 5;

--Solución 3:

SELECT * FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;
