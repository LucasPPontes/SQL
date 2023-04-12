-- LEFT (OUTER) JOIN

SELECT * FROM produtos

SELECT * FROM subcategoria

SELECT  
    produtos.id_produto,
    produtos.nome_produto,
    produtos.id_subcategoria,
    subcategoria.nome_subcategoria
FROM
    produtos
LEFT JOIN subcategoria
    ON produtos.id_subcategoria = subcategoria.id_subcategoria