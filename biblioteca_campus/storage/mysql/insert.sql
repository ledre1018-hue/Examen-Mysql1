-- ============================================
-- Biblioteca Campus - Datos de prueba (INSERTs)
-- ============================================
USE biblioteca_campus;

-- Libros
INSERT INTO Libro (titulo, genero, isbn, disponibilidad) VALUES
('Cien años de soledad', 'Novela', '978-0307474728', TRUE),
('El principito', 'Fábula', '978-0156012195', TRUE),
('1984', 'Distopía', '978-0451524935', FALSE),
('Fahrenheit 451', 'Ciencia ficción', '978-1451673319', TRUE),
('La sombra del viento', 'Misterio', '978-8408043645', TRUE),
('Clean Code', 'Tecnología', '978-0132350884', FALSE);

-- Autores
INSERT INTO Autor (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Antoine de Saint-Exupéry', 'Francesa'),
('George Orwell', 'Británica'),
('Ray Bradbury', 'Estadounidense'),
('Carlos Ruiz Zafón', 'Española'),
('Robert C. Martin', 'Estadounidense');

-- LibroAutor (relación N:M)
INSERT INTO LibroAutor (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Editoriales
INSERT INTO Editorial (nombre) VALUES
('Editorial Sudamericana'),
('Reynal & Hitchcock'),
('Secker & Warburg'),
('Ballantine Books'),
('Planeta'),
('Prentice Hall');

-- Publicaciones (ediciones de los libros)
INSERT INTO Publicacion (id_libro, edicion, fecha_publicacion, id_editorial) VALUES
(1, '1ra Edición', '1967-05-30', 1),
(1, '2da Edición', '1982-10-01', 1),
(2, '1ra Edición', '1943-04-06', 2),
(3, '1ra Edición', '1949-06-08', 3),
(4, '1ra Edición', '1953-10-19', 4),
(5, '1ra Edición', '2001-04-17', 5),
(6, '1ra Edición', '2008-08-01', 6);

-- Miembros
INSERT INTO Miembro (nombre, email, telefono, fecha_registro) VALUES
('Juan Pérez', 'juan.perez@correo.com', '3001234567', '2023-01-15'),
('María Gómez', 'maria.gomez@correo.com', '3009876543', '2023-03-22'),
('Carlos Rodríguez', 'carlos.rodriguez@correo.com', '3012345678', '2023-05-10'),
('Ana López', 'ana.lopez@correo.com', '3023456789', '2023-07-08');

-- Transacciones (préstamos y devoluciones)
INSERT INTO Transaccion (id_libro, id_miembro, fecha_prestamo, fecha_devolucion, estado) VALUES
(3, 1, '2024-01-10', NULL, 'prestado'),
(6, 2, '2024-02-05', NULL, 'prestado'),
(1, 3, '2024-02-15', '2024-03-01', 'devuelto'),
(2, 4, '2024-03-10', '2024-03-20', 'devuelto'),
(4, 1, '2024-04-01', '2024-04-15', 'devuelto'),
(5, 2, '2024-04-20', NULL, 'prestado');