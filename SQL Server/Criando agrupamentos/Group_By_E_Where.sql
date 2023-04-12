USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT  
        ColorName AS 'Cor do produto',
        COUNT(*) AS 'Total de produtos'
    FROM
        DimProduct
    WHERE 
        BrandName = 'Contoso'
    GROUP BY ColorName