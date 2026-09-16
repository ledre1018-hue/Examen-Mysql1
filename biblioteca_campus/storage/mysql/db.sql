-- ============================================
-- Biblioteca Campus - Estructura de Base de Datos
-- ============================================

DROP DATABASE IF EXISTS biblioteca_campus;
CREATE DATABASE biblioteca_campus CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE biblioteca_campus;

-- ============================================
-- Tabla: Libro
-- ============================================
CREATE TABLE Libro (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    disponibilidad BOOLEAN NOT NULL DEFAULT TRUE
);

-- ============================================
-- Tabla: Autor
-- ============================================
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- ============================================
-- Tabla intermedia: LibroAutor (N:M entre Libro y Autor)
-- ============================================
CREATE TABLE LibroAutor (
    id_libro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================
-- Tabla: Editorial
-- ============================================
CREATE TABLE Editorial (
    id_editorial INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- ============================================
-- Tabla: Publicacion (ediciones de un libro)
-- ============================================
CREATE TABLE Publicacion (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    edicion VARCHAR(30) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    id_editorial INT NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================
-- Tabla: Miembro
-- ============================================
CREATE TABLE Miembro (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    fecha_registro DATE NOT NULL
);

-- ============================================
-- Tabla: Transaccion (préstamos y devoluciones)
-- ============================================
CREATE TABLE Transaccion (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado ENUM('prestado', 'devuelto') NOT NULL DEFAULT 'prestado',
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_miembro) REFERENCES Miembro(id_miembro)
        ON DELETE CASCADE ON UPDATE CASCADE
);

START TRANSACTION;

INSERT INTO Transaccion (id_libro, id_miembro, fecha_prestamo, estado)
VALUES (3, 2, CURDATE(), 'prestado');

UPDATE Libro
SET disponibilidad = FALSE
WHERE id_libro = 3;

COMMIT;