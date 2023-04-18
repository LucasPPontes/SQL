-- Exemplo 1: Aplique um desconto de 10% em todos os preços dos produtos. Sua consulta final deve conter as colunas ProductKey, ProductName, UnitPrice e Preço com desconto

/* 
preco = 100
desconto = 10 %
valor_desconto = (preco * desconto) / 100 
preco_com_desconto = preco - valor_desconto
*/

USE ContosoRetailDW;

DECLARE 
    @desconto FLOAT = 10.0,
    @valor_com_desconto FLOAT 

SELECT 
    ProductKey AS 'ID',
    ProductName AS 'Nome do produto',
    UnitPrice AS 'Preço unitário',
    UnitPrice - (UnitPrice * @desconto / 100) AS 'Valor do produto com desconto'
FROM
    DimProduct

-----------------------------------

DECLARE @varData DATETIME
SET @varData = '01/01/1980'

SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    BirthDate AS 'Nascimento',
    'Cliente' AS 'Tipo'
FROM
    DimCustomer
WHERE BirthDate >= @varData

UNION 

SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    BirthDate AS 'Nascimento',
    'Funcionário' AS 'Tipo'
FROM
    DimEmployee
WHERE BirthDate >= @varData
ORDER BY Nascimento