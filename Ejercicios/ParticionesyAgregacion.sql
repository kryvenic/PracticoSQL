--Seleccionando con numero de fila

-- con proyeccion ordenada por defecto:
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos;

--Con proyeccion ordenada por otro campo
SELECT ROW_NUMBER() OVER(ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

--Ordena el row id, por el primer valor de colegiatura
SELECT FIRST_VALUE(colegiatura) OVER() AS row_id, *
FROM platzi.alumnos;

--Primer valor Con proyeccion particionada por carrera_id
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS primera_colegiatura, *
FROM platzi.alumnos;

--Seleccionando la ultima colegiatura con particionada
SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS ultima_colegiatura, *
FROM platzi.alumnos;

--Seleccionando enésima (tercera) colegiatura obtenida con proyeccion particionada. NTH permite sacar valores de las mitades.
SELECT NTH_VALUE(colegiatura, 3) OVER(PARTITION BY carrera_id) AS mitad_colegiatura, *
FROM platzi.alumnos;

-- seleccionando con ranking de colegiatura
-- con proyeccion particionada
SELECT *,
  RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS colegiatura_rank
FROM platzi.alumnos ORDER BY carrera_id, colegiatura_rank;

-- con ranking sin tomar en cuenta gaps
SELECT *,
  DENSE_RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS colegiatura_rank
FROM platzi.alumnos ORDER BY carrera_id, colegiatura_rank;


-- con ranking porcentual
SELECT *,
  PERCENT_RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS colegiatura_rank
FROM platzi.alumnos ORDER BY carrera_id, colegiatura_rank;

