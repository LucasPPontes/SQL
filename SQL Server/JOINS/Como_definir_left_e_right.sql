-- 1 LEFT JOIN para complementar informações da tabela produtos (LEFT) de acordo com a tabela categoria (RIGHT)

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


-- 2 Obtendo o LEFT JOIN do caso 1 usando um RIGHT JOIN e invertendo as tabelas de lado 

SELECT * FROM produtos
SELECT * FROM subcategoria

SELECT
    produtos.id_produto,
    produtos.nome_produto,
    produtos.id_subcategoria,
    subcategoria.nome_subcategoria
FROM   
    subcategoria
RIGHT JOIN produtos
    ON produtos.id_subcategoria = subcategoria.id_subcategoria
