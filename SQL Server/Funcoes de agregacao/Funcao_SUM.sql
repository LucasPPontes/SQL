USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales

    SELECT 
        SUM(SalesQuantity) AS 'Total vendido',
        SUM(ReturnQuantity) AS 'Total Devolvido'
    FROM    
        FactSales

