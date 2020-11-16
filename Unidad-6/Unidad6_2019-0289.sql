--CREATE DATABASE Unidad6
USE Unidad6

/*
    EUDY REYNOSO GONZALEZ 2019-0289
*/
CREATE TABLE Empleados
(
    CODIGO INT NOT NULL ,
    Nombres VARCHAR(50),
    Puestos VARCHAR(40),
    Salario money,
    Edad INT,
    Municipio INT, 
    Sexo int,
)

INSERT into dbo.Empleados
VALUES
    (10001, 'Albert Contreras', 'Gerente', 30000, 22, 1 , 1),
    (10002, 'Jose Disla' , 'Secretario', 12000 , 36 , 2 , 1),
    (10003, 'María Peralta', 'Secretaria', 12000, 20, 2, 2 ),
    (10004, 'Wendy Santana' , 'Recepcionista' , 15000 , 22, null, 2),
    (10005, 'Luis Acosta', 'Contable', 25000, 45, 3, 1),
    (10006, 'Fráncico Cruz', 'Cajero', 8000, 30, 2, 1),
    (10007, 'Amelia Severino', 'Secretaria', 12000, 28, 1, 2),
    (10008, 'Birma Frias', 'Cajera', 8000, 23, 3, 2),
    (10010, 'Heriberto Rivas', 'Tesorero', 22000, 35, 1, 1)

USE Unidad6
exec TotalPerson
--1. Seleccionar el salario promedio de todos los empleados
SELECT CAST(AVG(Salario) AS decimal(10,1)) AS SalarioPromedio
FROM dbo.Empleados

--2. Obtener el numero de empleados
SELECT COUNT(*)  AS NumeroDeEmpleados
FROM dbo.Empleados 

--3. Obtener el salario promedio por municipio, mostrando el codigo de municipio
SELECT Municipio as CodigoMunicipio, CAST((AVG(Salario)) AS decimal(10,1)) AS SalarioPromedioPagado FROM dbo.Empleados
GROUP BY(Municipio)

--4. Mostrar el nombre, cargo y salario del empleado con mayor salario
SELECT e.Nombres, e.Puestos, cast(e.Salario as decimal(10,0)) as SalarioMayor
FROM dbo.Empleados e
WHERE  Salario = (SELECT CAST(MAX(Salario) AS decimal(10,1)) FROM dbo.Empleados)

--5. Aplicar un aumento a los empleado de sexo 1
UPDATE dbo.Empleados 
SET Salario = Salario + 1500 
WHERE(Sexo = 1)

--6. Aplicar un descuento de 10 pesos a los empleados de sexo 2
UPDATE dbo.Empleados
SET Salario = Salario - 10
WHERE(Sexo = 2)

--7. Obtener número de empleados por sexo
SELECT e.Sexo, COUNT(*) AS CantidadDePersonas
FROM dbo.Empleados e
GROUP BY(Sexo)

--8. Obtener los empleados cuyo valor medio de salario sea mayor 10000
SELECT * FROM dbo.Empleados
WHERE Salario = (SELECT AVG(Salario) FROM dbo.Empleados HAVING AVG(Salario) > 10000)
