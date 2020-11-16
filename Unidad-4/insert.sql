USE Unidad4

INSERT INTO dbo.Sexo
VALUES
    ('Masculino'),
    ('Femenino')

INSERT into dbo.Municipio
VALUES
    ('Cotui'),
    ('Fantino'),
    ('Cevicos'),
    ('Villa La Mata')

INSERT INTO dbo.Empleados
VALUES
    (10001, 'Albert Contreras', 'Gerente', 30000, 22, 1, 1 ),
    (10002, 'Jose Disla', 'Secretario', 12000, 36, 2, 1),
    (10003, 'María Peralta', 'Secretaria', 12000, 20, 2, 2),
    (10004, 'Wendy Santana' , 'Recepcionista', 15000, 22, null, 2),
    (10005, 'Luis Acosta', 'Contable', 25000, 45, 3, 1),
    (10006, 'Fráncico Cruz', 'Cajero', 8000, 30, 2, 1),
    (10007, 'Amelia Severino', 'Secretaria', 12000, 28, 1, 2),
    (10008, 'Birma Frias', 'Cajera', 8000, 23, 3, 2),
    (10010, 'Heriberto Rivas', 'Tesorero', 22000, 35, 1, 1)


SELECT *
FROM dbo.Municipio

SELECT *
FROM dbo.Sexo

SELECT *
FROM dbo.Empleados