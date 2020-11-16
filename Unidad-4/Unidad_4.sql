CREATE DATABASE Unidad4
USE Unidad4

CREATE TABLE Empleados
(
    Codigo INT PRIMARY key,
    Nombres VARCHAR(80),
    Puesto VARCHAR(50),
    Salario FLOAT,
    Edad INT,
    MunicipioID INT,
    SexoID INT,
)
CREATE TABLE Sexo
(
    Codigo INT IDENTITY(1,1),
    Sexo VARCHAR(34)
)

DROP TABLE Municipio

CREATE TABLE Municipio
(
    Codigo INT IDENTITY(1,1),
    Municipio VARCHAR(60)
)
INSERT into Municipio VALUES
('Cotui'),
('Fantino'),
('Cevicos'),
('Villa La Mata')

INSERT INTO Sexo VALUES
('Masculino'),
('Femenino')

INSERT into Municipio
VALUES
('Cotui'),
('Fantino'),
('Cevicos'),
('Villa La Mata')

INSERT INTO Empleados
VALUES(10001, 'Albert Contreras', 'Gerente', 30000, 22, 1, 1 ),(10002, 'Jose Disla', 'Secretario', 12000, 36, 2, 1),(10003, 'María Peralta', 'Secretaria', 12000, 20, 2, 2),(10004, 'Wendy Santana' , 'Recepcionista', 15000, 22, null, 2),(10005, 'Luis Acosta', 'Contable', 25000, 45, 3, 1),(10006, 'Fráncico Cruz', 'Cajero', 8000, 30, 2, 1),(10007, 'Amelia Severino', 'Secretaria', 12000, 28, 1, 2),(10008, 'Birma Frias', 'Cajera', 8000, 23, 3, 2),(10010, 'Heriberto Rivas', 'Tesorero', 22000, 35, 1, 1)


--1. Listar todos los empleados y ordénalo por nombre
SELECT *
FROM dbo.Empleados
ORDER BY(Nombres)

--2. Agrega un campo llamado Email en la tabla empleados
ALTER TABLE dbo.Empleados
ADD Email VARCHAR(50)

--3. Actualiza el campo Email personas@uteco.edu.do sexo Femenino
UPDATE dbo.Empleados
SET Email = 'personas@uteco.edu.do'
WHERE(SexoID = 2)

--4. Actualiza el campo Email correo@uteco.edu.do sexo Masculino
UPDATE dbo.Empleados
SET Email = 'correo@uteco.edu.do'
WHERE(SexoID = 1)

--5. Debemos aumentarle 500 pesos a los sueldos de los empleados que pertenecen al municipio Fantino
UPDATE dbo.Empleados
set Salario = Salario + 500
WHERE(MunicipioID = 2)

--6. Incrementar un 2% a los empleados que ganan menos de 10 mil pesos. 
UPDATE dbo.Empleados
SET Salario = Salario + (Salario * 0.02)
WHERE(Salario <10000)

--7. Agrega un campo llamado Estatus en la tabla empleados
ALTER TABLE dbo.Empleados
ADD Estatus VARCHAR(50)

--8. Elimina el campo estatus
ALTER TABLE dbo.Empleados
DROP COLUMN Estatus


SELECT * FROM dbo.Municipio
SELECT * FROM dbo.Sexo
SELECT * FROM dbo.Empleados