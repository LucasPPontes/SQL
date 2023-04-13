-- GROUP BY + JOIN
-- 1 a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear)
-- 1 b) Considere apenas o mês (CalendarMonthLabel) de 'January'
-- 1 c) Na tabela resultante, mostra apenas os anos com um total de vendas maior ou igual a de 1200000
USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimDate
    
    SELECT
        SUM(FactSales.SalesQuantity) AS 'TOTAL VENDIDO',
        DimDate.CalendarYear
    FROM 
        FactSales
    INNER JOIN DimDate
        ON DimDate.Datekey = FactSales.DateKey
    WHERE DimDate.CalendarMonthLabel = 'January'
    GROUP BY DimDate.CalendarYear
    HAVING SUM(FactSales.SalesQuantity) >= 1200000
    ORDER BY SUM(FactSales.SalesQuantity) DESC
