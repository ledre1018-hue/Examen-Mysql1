Biblioteca Campus
Sistema de gestión de biblioteca: libros, autores, publicaciones, transacciones y miembros.

Estructura del proyecto
biblioteca_campus/ ├── README.md └── storage/ ├── mysql/ │ ├── db.sql │ └── insert.sql └── diagrams/ ├── diagrama_logico.png └── diagrama_fisico.png └── ERM.png

Consultas
Listar todos los libros disponibles

SELECT * FROM Libro WHERE disponibilidad = TRUE;
Buscar libros por género

SELECT * FROM Libro WHERE genero = 'Novela';
Obtener información de un libro por ISBN

SELECT * FROM Libro WHERE isbn = '978-0307474728';
Contar el número de libros en la biblioteca

SELECT COUNT(*) AS total_libros FROM Libro;
Listar todos los autores

SELECT * FROM Autor;
Buscar autores por nombre

SELECT * FROM Autor WHERE nombre LIKE '%García%';
Obtener todos los libros de un autor específico

SELECT l.*
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor
WHERE a.id_autor = 1;
Listar todas las ediciones de un libro

SELECT *
FROM Publicacion
WHERE id_libro = 1;
Obtener la última edición de un libro

SELECT *
FROM Publicacion
WHERE id_libro = 1
ORDER BY fecha_publicacion DESC
LIMIT 1;
Contar cuántas ediciones hay de un libro específico

SELECT COUNT(*) AS total_ediciones
FROM Publicacion
WHERE id_libro = 1;
Listar todas las transacciones de préstamo

SELECT * FROM Transaccion;
Obtener los libros prestados actualmente

SELECT l.titulo, t.fecha_prestamo, m.nombre AS miembro
FROM Transaccion t
JOIN Libro l ON t.id_libro = l.id_libro
JOIN Miembro m ON t.id_miembro = m.id_miembro
WHERE t.estado = 'prestado';
Contar el número de transacciones de un miembro específico

SELECT COUNT(*) AS total_transacciones
FROM Transaccion
WHERE id_miembro = 1;
Listar todos los miembros de la biblioteca

SELECT * FROM Miembro;
Buscar un miembro por nombre

SELECT * FROM Miembro WHERE nombre LIKE '%Juan%';
Obtener las transacciones de un miembro específico

SELECT *
FROM Transaccion
WHERE id_miembro = 1;
Listar todos los libros y sus autores

SELECT l.titulo, a.nombre AS autor
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor;
Obtener el historial de préstamos de un libro específico

SELECT t.*, m.nombre AS miembro
FROM Transaccion t
JOIN Miembro m ON t.id_miembro = m.id_miembro
WHERE t.id_libro = 1;
Contar cuántos libros han sido prestados en total

SELECT COUNT(*) AS total_prestamos FROM Transaccion;
Listar todos los libros junto con su última edición y estado de disponibilidad

SELECT l.titulo, l.disponibilidad, p.edicion, p.fecha_publicacion
FROM Libro l
JOIN Publicacion p ON l.id_libro = p.id_libro
WHERE p.fecha_publicacion = (
    SELECT MAX(p2.fecha_publicacion)
    FROM Publicacion p2
    WHERE p2.id_libro = l.id_libro
);
