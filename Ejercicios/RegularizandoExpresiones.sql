--Filtra todos los emails válidos de acuerdo al patrón de expresiones regulares
SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}';

-- seleccionando emails de google
SELECT email FROM platzi.alumnos
WHERE email ~* '[A-Z0-9._%+-]+@google[A-Z0-9.-]+\.[A-Z]{2,4}';