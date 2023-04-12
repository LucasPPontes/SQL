-- WHERE REALIZA OS FILTROS ANTES DO AGRUPAMENTO
-- HAVING REALIZA OS FILTROS DEPOIS DO AGRUPAMENTO
USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT 
        BrandName AS 'Marca',
        COUNT(BrandName) AS 'Total por marca'
    FROM 
        DimProduct
    GROUP BY BrandName
    HAVING COUNT(BrandName) >= 200