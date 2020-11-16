CREATE DATABASE Unidad5
USE Unidad5

/*
    Crear todas las tablas	 
*/
CREATE TABLE Municipio
(
    CODIGO INT PRIMARY KEY,
    Nombres VARCHAR(40)
)

CREATE TABLE Sexo
(
    CODIGO INT PRIMARY KEY,
    Nombres VARCHAR(40)
)

CREATE TABLE Empleados
(
    CODIGO INT PRIMARY KEY,
    Nombres VARCHAR(50),
    Puestos VARCHAR(40),
    Salario FLOAT,
    Edad INT,
    Municipio INT,
    Sexo int,

    FOREIGN KEY(Municipio) REFERENCES Municipio(CODIGO),
    FOREIGN KEY(Sexo) REFERENCES Sexo(CODIGO)
)
/*
    Insertar informacion en las tablas
*/
INSERT into dbo.Municipio
VALUES
    (1, 'Cotui'),
    (2, 'Fantino'),
    (3, 'Cevicos'),
    (4, 'Villa La Mata')

SELECT *
FROM dbo.Municipio

INSERT into dbo.Sexo
VALUES
    (1, 'Masculino'),
    (2 , 'Femenino')

SELECT *
from dbo.Sexo

INSERT into dbo.Empleados
VALUES
    (10001, 'Albert Contreras', 'Gerente', 30000, 22, 1 , 1),
    (10002 , 'Jose Disla' , 'Secretario', 12000 , 36 , 2 , 1),
    (10003, 'María Peralta', 'Secretaria', 12000, 20, 2, 2 ),
    (10004, 'Wendy Santana' , 'Recepcionista' , 15000 , 22, null, 2),
    (10005, 'Luis Acosta', 'Contable', 25000, 45, 3, 1),
    (10006, 'Fráncico Cruz', 'Cajero', 8000, 30, 2, 1),
    (10007, 'Amelia Severino', 'Secretaria', 12000, 28, 1, 2),
    (10008, 'Birma Frias', 'Cajera', 8000, 23, 3, 2),
    (10010, 'Heriberto Rivas', 'Tesorero', 22000, 35, 1, 1)

SELECT *
FROM dbo.Empleados

/*
    Query en la base de datos
*/

--1. Listar la cantidad de Empleados que existen 
SELECT COUNT(CODIGO) as Cantidad_Empleados
FROM dbo.Empleados

/*2. Actualiza el Idmunicipio a 2 donde el código del empelado sea 
igual 10004, en la tabla empleados*/ 
UPDATE Empleados
set Municipio = 2
WHERE(CODIGO = 10004)

--3. Listar cantidad de empleados que hay por municipio
SELECT m.Nombres as Municipio, COUNT(*) AS Cantidad_Empleados from dbo.Empleados e
JOIN Municipio m on m.CODIGO = e.Municipio
GROUP BY (m.Nombres)

--4. Mostrar los 2 últimos empleados
SELECT top(2) *
FROM dbo.Empleados
ORDER BY CODIGO DESC

--5. Mostrar nombre, puesto y salario ordenado por salario de mayor a menor
SELECT Nombres, Puestos, Salario
FROM dbo.Empleados
ORDER BY (Salario) DESC

--6. Mostrar el Empleado con mayor salario
SELECT * FROM dbo.Empleados
WHERE Salario = (SELECT MAX(Salario) FROM dbo.Empleados)

--7. Mostrar el empleado con menor salario 
SELECT * FROM dbo.Empleados
WHERE Salario = (SELECT MIN(Salario) FROM dbo.Empleados)

--8. Calcular el promedio de salario pagado 
SELECT  AVG(Salario) AS PromedioSalario
FROM dbo.Empleados

--9. Mostrar todos los empleados que sean de Cotui y Fantino
SELECT e.CODIGO, e.Nombres, e.Edad, e.Sexo, e.Puestos, m.Nombres AS Municipio
FROM dbo.Empleados e
    JOIN Municipio m on m.CODIGO  = e.Municipio
WHERE(Municipio = 1 OR Municipio = 2)

--10. Listar los empleados que sean de Cotui o Cevicos
SELECT e.CODIGO, e.Nombres,e.Salario, e.Edad, m.Nombres FROM dbo.Empleados	e
JOIN Municipio m on m.CODIGO = e.Municipio 
WHERE(Municipio = 1 OR Municipio = 3)