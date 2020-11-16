USE Unidad4

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