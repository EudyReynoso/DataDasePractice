USE master
CREATE DATABASE Unidad3
USE Unidad3

CREATE TABLE Empleados (
    Codigo INT,
    Nombres VARCHAR(70),
    Puesto VARCHAR(40),
    Salario INT,
    Edad INT,
    Municipio INT,
    Sexo INT
)

CREATE TABLE Sexo (
    Codigo INT,
    Nombre VARCHAR(29)
)
CREATE TABLE Municipio (
    codigo INT IDENTITY(1,1),
    Nombres VARCHAR(50)
)

SELECT * FROM dbo.Empleados
SELECT * FROM dbo.Municipio
SELECT * FROM dbo.Sexo