CREATE DATABASE Unidad5
USE Unidad5

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
)
INSERT into Municipio VALUES(1, 'Cotui'),(2, 'Fantino'),(3, 'Cevicos'),(4, 'Villa La Mata')

SELECT * FROM Municipio

INSERT into Sexo VALUES (1, 'Masculino'), (2 , 'Femenino')

SELECT * FROM Sexo

INSERT into Empleados VALUES(10001, 'Albert Contreras', 'Gerente', 30000, 22, 1 , 1),(10002 , 'Jose Disla' , 'Secretario', 12000 , 36 , 2 , 1),(10003, 'María Peralta', 'Secretaria', 12000, 20, 2, 2 ),(10004, 'Wendy Santana' , 'Recepcionista' , 15000 , 22, null, 2),(10005, 'Luis Acosta', 'Contable', 25000, 45, 3, 1),(10006, 'Fráncico Cruz', 'Cajero', 8000, 30, 2, 1),(10007, 'Amelia Severino', 'Secretaria', 12000, 28, 1, 2),(10008, 'Birma Frias', 'Cajera', 8000, 23, 3, 2),(10010, 'Heriberto Rivas', 'Tesorero', 22000, 35, 1, 1)

SELECT * FROM Empleados

USE Unidad5
--1. Listar la cantidad de Empleados que existen 
SELECT COUNT(CODIGO) as Cantidad_Empleados FROM Empleados

/*2. Actualiza el Idmunicipio a 2 donde el código del empelado 
sea igual 10004, en la tabla empleados*/ 
UPDATE Empleados
set Municipio = 2
WHERE(CODIGO = 10004)

--3. Listar cantidad de empleados que hay por municipio
SELECT m.Nombres as Municipio, COUNT(*) AS Empleados from Empleados e
JOIN Municipio m on m.CODIGO = e.Municipio
GROUP BY (m.Nombres)

--4. Mostrar los 2 últimos empleados
SELECT top(2) * FROM Empleados
ORDER BY CODIGO DESC

--5. Mostrar nombre, puesto y salario ordenado por salario de mayor a menor
SELECT Nombres, Puestos, Salario FROM Empleados
ORDER BY (Salario) DESC

--6. Mostrar el Empleado con mayor salario
SELECT top 1 Nombres, max(Salario) AS Salario_Mayor FROM Empleados
GROUP BY(Nombres)

--7. Mostrar el empleado con menor salario 
SELECT top 1 Nombres, min(Salario) from Empleados
GROUP BY (Nombres), Salario

--8. Calcular el promedio de salario pagado 
SELECT  AVG(Salario) AS PromedioSalario FROM Empleados

--9. Mostrar todos los empleados que sean de Cotui y Fantino
SELECT e.CODIGO, e.Nombres, e.Edad, e.Sexo, e.Puestos, m.Nombres AS 
Municipio FROM Empleados e

JOIN Municipio m on m.CODIGO  = e.Municipio
WHERE(Municipio = 1 and Municipio = 2)

--10. Listar los empleados que sean de Cotui o Cevicos
SELECT emple.CODIGO, emple.Nombres,emple.Salario, emple.Edad, m.Nombres 
FROM Empleados emple
JOIN Municipio m on m.CODIGO = emple.Municipio 
WHERE(Municipio = 1 OR Municipio = 3)