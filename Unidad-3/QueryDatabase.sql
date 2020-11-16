USE Unidad3

--1. Listar los datos completos de los empleados 
SELECT *
FROM dbo.Empleados

--2. Listar los datos de los empleados con cargo ‘Secretaria’.
SELECT * 
FROM dbo.Empleados e
WHERE e.Puesto LIKE '%Secretari%'

--3. Listar los 4 primeros empleados.
SELECT TOP(4)
    *
FROM dbo.Empleados

--4. Listar los datos de los empleados cajero, ordenado por nombre.
SELECT *
FROM dbo.Empleados e
WHERE e.Puesto LIKE '%Cajer%'
ORDER BY e.Nombres

--5. Listar el nombre y cargo de todos los empleados, ordenado por salario.
SELECT e.Nombres, e.Puesto as Cargo, e.Salario
FROM dbo.Empleados e
ORDER BY e.Salario

--6. Listar la lista de los empleados que ganan entre 10 mil y 20 mil.
SELECT *
FROM dbo.Empleados e
WHERE (e.Salario >= 10000) AND (e.Salario <= 20000)

--7. Listar el nombre, Puesto y salario de los empleados. (Alias Nombre Empleado, Puesto Cargo, Salario Sueldo)

SELECT e.Nombres AS Empeleado, e.Puesto AS Cargo, e.Salario AS Sueldo
FROM dbo.Empleados e

--8. Muestra los empleados cuyo nombre empiece entre las letras J y A (rango).
SELECT *
FROM dbo.Empleados e
WHERE (e.Nombres LIKE 'J%') OR (e.Nombres LIKE 'A%')

--9. Listar la lista de los empleados que sean de Cotui, ganan más de 20 mil pesos.

SELECT e.Nombres, e.Puesto, m.Nombres AS Municipio, e.Salario
FROM dbo.Empleados e
    JOIN dbo.Municipio m ON m.codigo = e.Municipio
WHERE (e.Municipio = 1 or m.Nombres LIKE '%Cotui%')
    AND Salario > 20000

--10. Listar la lista de los empleados que su cargo sean Secretario y Secretaria.

SELECT e.Nombres, e.Puesto AS cargo
FROM dbo.Empleados e
WHERE e.Puesto LIKE '%Secretari%'

--11. Listar los empleados cuyo nombre no contiene la letra “A”
SELECT *
FROM dbo.Empleados e
WHERE (e.Nombres NOT LIKE '%A%') OR (e.Nombres NOT LIKE '%a%')
--12. Agregar una columna llamada Comisión
ALTER TABLE dbo.Empleados ADD Comision INT

--13. Listar los empleados cuyo nombre no contiene Municipio definido

SELECT *
FROM dbo.Empleados e
WHERE (e.Municipio is null)

--14. Listar los empleados cuyo sexo sea femenino y gane más de 20 mil pesos 

SELECT *
FROM dbo.Empleados e
    JOIN dbo.Sexo s on e.Sexo = s.Codigo
WHERE (e.Salario > 20000 AND s.Codigo = 2)