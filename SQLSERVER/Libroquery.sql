
CREATE DATABASE DBLibros;


USE DBLibros;

-- Crear la tabla Autores
CREATE TABLE Autores (
    IdAutor INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

-- Insertar datos en la tabla Autores
INSERT INTO Autores (IdAutor, Nombre)
VALUES
    (001, 'Autor1'),
    (002, 'Autor2'),
    (003, 'Autor3');

-- Crear la tabla Libros
CREATE TABLE Libros (
    IdLibro INT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    IdAutor INT,
    FOREIGN KEY (IdAutor) REFERENCES Autores(IdAutor)
);

-- Insertar datos en la tabla Libros
INSERT INTO Libros (IdLibro, Titulo, Precio, IdAutor)
VALUES
    (001, 'Libro1', 10.50, 001),
    (002, 'Libro2', 15.75, 002),
    (003, 'Libro3', 12.00, 001),
    (004, 'Libro4', 8.99, 003),
    (005, 'Libro5', 20.00, 002);


USE DBLibros;


SELECT * FROM Libros;



SELECT *
FROM Libros
WHERE Precio > ALL (SELECT Precio FROM Libros WHERE IdAutor = 001);


SELECT Precio FROM Libros Where IdAutor = 001;