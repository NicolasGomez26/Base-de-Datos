-- Consultas
-- Views:
-- 1. a) Crear una vista denominada “vista_mostrar_pais” que devuelva un reporte
-- de los países.
-- b) Invocar la vista creada.
create view vista_mostrar_pais as 
select * from country;
select * from vista_mostrar_pais;

-- 2. a) Crear una vista que devuelva un resumen con el apellido y nombre (en una
-- sola columna denominada “artista”) de los artistas y la cantidad de
-- filmaciones que tienen. Traer solo aquellos que tengan más de 25
-- filmaciones y ordenarlos por apellido.
-- b) Invocar la vista creada.
drop view cantidad_segun_artista;
create view cantidad_segun_artista as
select concat( a.last_name," ",a.first_name) as artista, fa.film_id
from actor a inner join film_actor fa
on a.actor_id = fa.actor_id inner join film f
on f.film_id = fa.film_id
where fa.film_id > 25
group by artista
order by a.last_name;
select * from cantidad_segun_artista;


-- c) En la misma invocación de la vista, traer aquellos artistas que tienen
-- menos de 33 filmaciones.
select * from cantidad_segun_artista
where film_id > 33;
-- d) Con la misma sentencia anterior, ahora, mostrar el apellido y nombre de
-- los artistas en minúsculas y traer solo aquellos artistas cuyo apellido
-- comience con la letra "a".
select lower(artista) artista, film_id
from cantidad_segun_artista
where artista like "a%";
-- e) Eliminar la vista creada.
drop view cantidad_segun_artista;

-- 3. 
-- a) Crear una vista que devuelva un reporte del título de la película, el apellido
-- y nombre (en una sola columna denominada “artista”) de los artistas y el
-- costo de reemplazo. Traer solo aquellas películas donde su costo de
-- reemplazo es entre 15 y 27 dólares, ordenarlos por costo de reemplazo.
drop view reporte_titulo;
create view reporte_titulo as
select f.title titulo, concat( a.last_name," ",a.first_name) artista, f.replacement_cost costo
from film f inner join film_actor fa on fa.film_id = f.film_id
inner join actor a on a.actor_id = fa.actor_id
having costo between 15 and 27
order by costo;

-- b) Invocar la vista creada.
select * from reporte_titulo;
-- c) En la misma invocación de la vista, traer aquellas películas que comienzan
-- con la letra "b".
select * from reporte_titulo
where titulo like "b%";
-- d) Modificar la vista creada agregando una condición que traiga los artistas
-- cuyo nombre termine con la letra "a" y ordenarlos por mayor costo de
-- reemplazo. 
alter view reporte_titulo as
select f.title titulo, concat( a.last_name," ",a.first_name) artista, f.replacement_cost costo
from film f inner join film_actor fa on fa.film_id = f.film_id
inner join actor a on a.actor_id = fa.actor_id
having artista like "%a"
order by costo DESC;
-- e) Invocar la vista creada.
select * from reporte_titulo;