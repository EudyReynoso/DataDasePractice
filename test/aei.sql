USE BDatos
SELECT * FROM dbo.Estudiantes

TRUNCATE TABLE dbo.Estudiantes

UPDATE dbo.Estudiantes
set IDMunicipio = null
WHERE(Matricula LIKE '2013-0125')

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
