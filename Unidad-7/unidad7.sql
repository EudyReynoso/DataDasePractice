--USE master
--CREATE DATABASE Torneo;
USE Torneo;
CREATE TABLE Paises
(
  IdPais INT PRIMARY KEY NOT NULL,
  Pais VARCHAR(50)
);

CREATE TABLE Ciudades
(
  IdCiudad INT PRIMARY KEY NOT NULL,
  Ciudad VARCHAR(60),
  IdPais INT,
  FOREIGN KEY(IdPais) REFERENCES Paises(IdPais)
);

CREATE TABLE Jugadores
(
  IdJugador INT PRIMARY KEY NOT NULL,
  Nombres VARCHAR(68),
  Apellidos VARCHAR(50),
  FechaIngreso VARCHAR(40),
  Nivel VARCHAR(69),
  IdCiudad INT,
  FOREIGN KEY(IdCiudad) REFERENCES Ciudades(IdCiudad)
);

INSERT INTO dbo.Paises
VALUES
  (1, 'Francia'),
  (2, 'España'),
  (3, 'Portugal');


INSERT INTO dbo.Ciudades
VALUES
  (1, 'Paris', 1),
  (2, 'Marsella', 1),
  (3, 'Madrid', 2),
  (4, 'Barcelona' , 2),
  (5, 'Lisboa', 3),
  (6, 'Oporto', 3);

INSERT INTO dbo.Jugadores
VALUES
  (1, 'Quin', 'York', '03/17/1977', 'Semi-profesional', 1),
  (2, 'Alika', 'Browning', '07/12/1978', 'Semi-profesional', 1),
  (3, 'Zena', 'Bryan', '01/02/1962', 'Amateur', 1),
  (4, 'Dominique', 'Mcneil', '01/19/1978', 'Amateur', 2),
  (5, 'Shaeleigh', 'Brock', '08/13/1989', 'Profesional', 2),
  (6, 'Reed', 'Skinner', '12/24/1989', 'Profesional', 2),
  (7, 'Deborah', 'Francis', '08/15/1960', 'Profesional', 2),
  (8, 'Aretha', 'Gonzales', '07/05/1988', 'Semi-profesional', 3),
  (9, 'Madeline', 'Chambers', '06/07/1992', 'Profesional', 3),
  (10, 'Kiona', 'Valdez', '10/11/1968', 'Profesional', 3);

SELECT * FROM dbo.Jugadores
SELECT * FROM dbo.Ciudades
SELECT * FROM dbo.Paises

-- 1. Selecciona Nombres, Apellidos, FechaIngreso, Nivel detodos los jugadores
SELECT j.Nombres, j.Apellidos, j.FechaIngreso, j.Nivel FROM dbo.Jugadores j

-- 2. Selecciona Nombres, Apellidos, Ciudad de todos los jugadores que sean de la ciudad de "Madrid"
SELECT j.Nombres, j.Apellidos, c.Ciudad FROM dbo.Jugadores j
JOIN Ciudades c ON c.IdCiudad = j.IdCiudad
WHERE (c.IdCiudad = 4 OR c.Ciudad like 'Barcelona')

-- 3. Selecciona Nombres, Apellidos, Ciudad, Pais de todos los jugadores que sean de la ciudad de "Marsella"
SELECT j.Nombres, j.Apellidos, c.Ciudad, p.Pais FROM dbo.Jugadores j
JOIN Ciudades c on c.IdCiudad = j.IdCiudad
JOIN Paises p ON p.IdPais = c.IdPais
WHERE(c.IdCiudad = 2)

-- 4. Determina cuantos jugadores pertenecen a la ciudad de "Barcelona"
SELECT COUNT(IdCiudad) AS JugadoresBarcelona FROM dbo.Jugadores
WHERE(IdCiudad = 4)

-- 5. Todos los jugadores y ordenala por nombre
SELECT * FROM dbo.Jugadores j
ORDER BY j.Nombres

-- 6. Mostrar Nombre, apellidos y Ciudad (Mostrar cuantos jugadores hay por ciudad)
SELECT c.Ciudad, COUNT(*) AS Jugadores FROM dbo.Jugadores j
  JOIN Ciudades c ON c.IdCiudad = j.IdCiudad
GROUP BY(c.Ciudad)
--Las funciones de grupo no actuan en campos individuales 

-- 7. Montrar Nombre, apellidos, FechaIngreso (del Jugador más viejo)
SELECT j.Nombres, j.Apellidos, j.FechaIngreso FROM dbo.Jugadores j
WHERE(FechaIngreso like '%1960%')

-- 8. Actualiza el Apellido del Jugado que tiene el codigo No 7 a "Severino"
UPDATE dbo.Jugadores
SET Apellidos = 'Severino'
WHERE(IdJugador = 7)

--9.Montrar Nombre, apellidos, Ciudad ( de los jugadores que entraron en el año 1989)
SELECT j.Nombres, j.Apellidos, c.Ciudad, j.FechaIngreso FROM dbo.Jugadores j
JOIN Ciudades c ON c.IdCiudad = j.IdCiudad
WHERE(j.FechaIngreso like '%1989%')

--10.Montrar Nombre, apellidos, Ciudad ( de los jugadores que pertencen a Barcelona y Madrid)
SELECT j.Nombres, j.Apellidos, c.Ciudad FROM dbo.Jugadores j 
JOIN Ciudades c ON c.IdCiudad = j.IdCiudad
WHERE c.IdCiudad IN (3,4)

--11.Mostrar el nombre de la ciudad y cuantos jugadores tiene
SELECT c.Ciudad, COUNT(*) AS Jugadores FROM dbo.Jugadores j
JOIN Ciudades c ON c.IdCiudad = j.IdCiudad
GROUP BY(c.Ciudad)