--DROP DATABASE BDatos
USE master
--crear la base de datos
CREATE DATABASE BDatos
--Poner en uso la base de datos
USE BDatos

--Crear tabla Estudiantes 
CREATE TABLE Estudiantes
(
    Matricula VARCHAR(10),
    Nombre VARCHAR(60),
    Carrera VARCHAR(60),
    Facultad VARCHAR(60),
    Edad int,
    IDMunicipio int,
    IDSexo int
);
--Crear tabla Sexo
CREATE TABLE Sexo
(
    idSexo int,
    Sexo VARCHAR(50)
);
--Eliminar Tabla sexo
DROP TABLE dbo.Sexo

--Crear tabla municipio
CREATE TABLE Municipio
(
    IdMunicipio INT IDENTITY(1,1),
    Municipio VARCHAR(70)
);
/*
    Tuplas en las tablas
*/
--Tuplas en tabla estudiantes
INSERT INTO dbo.Estudiantes
VALUES
    ('2010-0125', 'Juan Pérez', 'Informática' , 'Ingeniería', 17, 1, 1),
    ('2012-0125', 'Ana Disla', 'Mercadeo', 'Ciencias', 16, 2, 2),
    ('2017-0125', 'Luis Peralta', 'Contabilidad', 'Ciencias', 20 , 1 , 1),
    ('2013-0125' , 'Carlos Santana' , 'Derecho' , 'Ciencias', 22, null , 1),
    ('2009-0125', 'Andry Contreras', 'Informática', 'Ingeniería', 45, 3, 2),
    ('2011-0125', 'Perla Santos', 'Educación', 'Ciencias' , 30 , 3 , 2),
    ('2012-0125' , 'Dioni Ruiz' , 'Bioanalisis' , 'Ciencias', 28, 2, 1),
    ('2017-0125', 'Carmen Liz', 'Derecho', 'Ciencias', 23, 1, 2),
    ('2016-0125' , 'Alfredo Acosta', 'Ingeniería Civil', 'Ingeniería', 35, null, 1)

--Tuplas en tabla Sexo
INSERT INTO dbo.Sexo
VALUES
    (1, 'Femenino'),
    (2, 'Masculino')

--Tuplasen tabla Municipio
INSERT INTO dbo.Municipio
VALUES
    ('cotui'),
    ('Fantino'),
    ('Cevicos'),
    ('Villa la Mata')

SELECT * FROM dbo.Municipio
SELECT * FROM dbo.Estudiantes
--WHERE (IDMunicipio is null)
SELECT * FROM dbo.Sexo