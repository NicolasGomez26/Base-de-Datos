-- Base de datos: muestra_basica.sql

-- Table Reference
SELECT u.*, r.nombre Categoria FROM usuario u, rol r
WHERE u.rol_id = r.id AND u.id > 3;


-- Join
SELECT * FROM usuario u
INNER JOIN rol r ON u.rol_id = r.id
WHERE u.id > 3;


-- Distinct
SELECT  ocupacion, rol_id FROM usuario;
SELECT DISTINCT ocupacion, rol_id FROM usuario;


-- CONCAT
SELECT CONCAT(apellido, " ", nombre) As usuario, ocupacion FROM usuario;
SELECT CONCAT_WS(" ", apellido, nombre, "(" , ocupacion, ")" ) FROM usuario;


-- COALESCE
SELECT * FROM usuario;
SELECT apellido, nombre, COALESCE(ocupacion, '-Sin ocupación-') FROM usuario;
SELECT apellido, nombre, COALESCE(ocupacion, hobby, '-Sin ocupación-') FROM usuario;

-- DATEDIFF
SELECT DATEDIFF('2021-01-15', '2021-01-05');
SELECT apellido, nombre, fecha_nacimiento, DATEDIFF('2000-01-15', fecha_nacimiento) FROM usuario;


-- TIMEDIFF
SELECT TIMEDIFF('18:45:00', '12:30:00');

-- TIMESTAMPDIFF
SELECT TIMESTAMPDIFF(YEAR, '1990-03-15', NOW());
SELECT TIMESTAMPDIFF(YEAR, '1990-03-15', CURRENT_DATE());


-- EXTRACT
SELECT EXTRACT(MINUTE FROM '2014-02-13 08:44:21');
SELECT apellido, nombre, fecha_nacimiento, EXTRACT(DAY FROM fecha_nacimiento) FROM usuario;
SELECT apellido, nombre, fecha_nacimiento, EXTRACT(YEAR FROM fecha_nacimiento) FROM usuario;


-- REPLACE
SELECT REPLACE('Buenas tardes', 'tardes', 'Noches');
SELECT REPLACE(apellido, "z", "Z"), ocupacion FROM usuario;


-- DATE_FORMAT
SELECT DATE_FORMAT('2017-06-15', '%W %M %e %Y');
SET lc_time_names = 'es_ES';
SELECT apellido, nombre, fecha_nacimiento, DATE_FORMAT(fecha_nacimiento, '%W, %e de %M %Y') FROM usuario;


-- DATE_ADD
SELECT DATE_ADD('2021-06-30', INTERVAL '3' DAY);
SELECT apellido, nombre, fecha_nacimiento, DATE_ADD(fecha_nacimiento, INTERVAL '15' DAY) AS F1, 
DATE_ADD(fecha_nacimiento, INTERVAL '5' DAY) AS F2 FROM usuario;


-- DATE_SUB
SELECT DATE_SUB('2021-06-30', INTERVAL '3' DAY);
SELECT apellido, nombre, fecha_nacimiento, DATE_SUB(fecha_nacimiento, INTERVAL '15' DAY) AS F1, 
DATE_SUB(fecha_nacimiento, INTERVAL '5' DAY) AS F2 FROM usuario;


-- CASE
SELECT id, apellido, nombre, puntaje,
 CASE
 WHEN puntaje < 2 THEN 'Mala'
 WHEN puntaje BETWEEN 2 AND 3 THEN 'Regular'
 WHEN puntaje = 4 THEN 'Buena'
 ELSE 'Excelente'
 END AS calificacion
 FROM usuario;

-- Determinar si el ID es par o impar
SELECT 5%2;
SELECT id, IF(id%2 = 0, 'PAR', 'IMPAR') AS ID, apellido, nombre FROM usuario; 
