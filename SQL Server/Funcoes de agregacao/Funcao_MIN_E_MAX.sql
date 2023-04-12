USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT 
        MAX(UnitPrice) AS 'Preco Maximo',
        MIN(UnitPrice) AS 'Preco Minimo'
    FROM
        DimProduct