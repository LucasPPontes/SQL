SELECT * FROM marcas
SELECT * FROM subcategoria

SELECT 
    marcas.marca,
    subcategoria.nome_subcategoria
FROM
    marcas CROSS JOIN subcategoria