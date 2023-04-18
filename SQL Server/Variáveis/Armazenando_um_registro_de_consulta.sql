-- Armazenando em uma variável um registro de uma consulta
USE ContosoRetailDW;

DECLARE @produto_mais_vendido INT
DECLARE @total_mais_vendido INT 

    SELECT TOP(1) 
       @produto_mais_vendido = ProductKey, 
       @total_mais_vendido =  SalesQuantity 
    FROM 
        FactSales
    ORDER BY SalesQuantity DESC

PRINT @produto_mais_vendido
PRINT @total_mais_vendido

SELECT 
    ProductKey, 
    ProductName
FROM
    DimProduct
WHERE ProductKey = @produto_mais_vendido