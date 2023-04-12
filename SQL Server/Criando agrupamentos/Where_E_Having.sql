USE ContosoRetailDW;

    SELECT 
        BrandName AS 'Marca',
        COUNT(BrandName) AS 'Total Marca'
    FROM
        DimProduct
    
    WHERE ClassName = 'Economy' -- Filtra a tabela original antes do agrupamento
    GROUP BY BrandName
    HAVING COUNT(BrandName) >= 200 -- Filtra a tabela depois do agrupamento