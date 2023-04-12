USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT 
        BrandName AS 'Nome da marca',
        COUNT(*) AS 'Qtde total'
    FROM 
        DimProduct
    GROUP BY BrandName

-- TABELA DE LOJAS --

    SELECT * FROM DimStore

    SELECT 
        StoreType,
        SUM(EmployeeCount)
    FROM 
        DimStore
    GROUP BY StoreType

-- TABELA DE PRODUTOS --

    SELECT * FROM DimProduct

    SELECT 
        BrandName,
        AVG(UnitCost)
    FROM DimProduct
    GROUP BY BrandName

    SELECT
        ClassName,
        MAX(UnitPrice)
    FROM
        DimProduct
    GROUP BY ClassName