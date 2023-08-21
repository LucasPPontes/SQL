-- LEFT: Extrai uma determinada quantidade de caracteres de um texto da esquerda para a direita
-- RIGHT: Extrai uma determinada quantidade de caracteres de um texto da direita para a esquerda

USE ContosoRetailDW;


SELECT 
    LEFT('Product0101001', 7) AS 'NomeProduto',
    RIGHT('Product0101001', 7) AS 'CodProduto'


SELECT * FROM DimProduct

SELECT
    ProductName AS 'Produto',
    UnitPrice AS 'Preço',
    LEFT(StyleName, 7) AS 'Cod 1',
    RIGHT(StyleName, 7) AS 'Cod 2'
FROM
    DimProduct