SET SQL_MODE = 'ONLY_FULL_GROUP_BY';
-- 1. ¿Cuál es la diferencia entre LEFT y RIGHT JOIN?
-- ambos sirven para lo mismo, devolver los resultados conincidentes y los que no posean un valor, el cual depende de la tabla de la que se hace referencia.
-- 2. ¿Cuál es el orden en el que se procesan las queries SELECT, FROM, WHERE,
-- GROUP BY, HAVING y ORDER BY?
-- FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY
-- 3. ¿Qué función podríamos utilizar si quisiéramos traer el promedio de likes de
-- todas las canciones?
-- usariamos AVG
-- 4. Si tenemos una query que trae un listado ordenado por el ID de usuarios la cual
-- cuenta con un LIMIT 20 OFFSET 27, ¿cuál sería el primer ID de los registros y cuál
-- el último?
-- el 28 seria el primero y el 48 el ultimo
-- 5. ¿Por qué no se recomienda utilizar en exceso DISTINCT, ORDER BY y GROUP BY?
-- no se lo recomienda porque usa muchos recursos y se perderia mucha permormance. si es totalmente necesario si se lo debe utilizar


-- Realizar los siguientes informes
-- 1. Mostrar la cantidad de canciones que pertenecen a ambos géneros pop y rock
-- cuyo nombre contiene la letra “m”.
select ca.idCancion, ca.titulo, ge.Genero
from cancion ca  inner join generoxcancion 
on ca.IdCancion = generoxcancion.IdCancion 
inner join genero ge
on generoxcancion.IdGenero = ge.idGenero
where (ge.genero like "Rock" or ge.genero like "Pop") AND ca.titulo REGEXP "^[mM]"; 


-- 2. Listar todas las canciones que pertenezcan a más de una playlist. Incluir en el
-- listado el nombre de la canción, el código y a cuántas playlists pertenecen.
select ca.titulo tit, ca.idCancion ID
from cancion ca inner join playlistxcancion 
on ca.idCancion = playlistxcancion.Idcancion
inner join playlist pl
on pl.idPlaylist = playlistxcancion.IdPlaylist
group by tit, ID
having count(playlistxcancion.IdPlaylist) > 1;


-- 3. Generar un reporte con el nombre del artista y el nombre de la canción que no
-- pertenecen a ninguna lista, ordenados alfabéticamente por el nombre del
-- artista.
select ar.nombre, ca.titulo
from cancion ca inner join album al 
on  ca.IdAlbum = al.idAlbum
inner join artista ar on ar.idArtista = al.idArtista
left join playlistxcancion pc on pc.Idcancion = ca.idCancion
where pc.IdPlaylist  is null
order by ar.nombre ASC;

-- 4. Modificar el país de todos los usuarios con el código postal “7600” a “Argentina”.
select  u.CP, 
case
when p.Pais = "Colombia" then "Argentina"
else "Argentina"
end as pais
from pais p join usuario u
on p.idPais = u.Pais_idPais
where u.CP = 7600;


-- 5. Listar todos los álbumes que tengan alguna canción que posea más de un
-- género.
select a.idAlbum, c.titulo, count(g.idGenero) generos 
from album a join cancion c on c.IdAlbum = a.idAlbum
join generoxcancion gc on gc.IdCancion = c.idCancion
join genero g on g.idGenero = gc.IdGenero
group by a.idAlbum, c.titulo
having generos > 1;

-- 6. Crear un índice agrupado para las canciones cuyo identificador sea el ID.
create index I_cancion_id on cancion (IdCancion)