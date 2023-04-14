USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT
        COUNT(DISTINCT ColorName)
    FROM
        DimProduct

    SELECT
        COUNT(DISTINCT BrandName)
    FROM
        DimProduct