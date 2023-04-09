USE ContosoRetailDW;

    --SELECT * FROM DimProduct;
    SELECT UnitPrice FROM DimProduct
    ORDER BY UnitPrice DESC 

    -- Quantos produtos tem o preço unitário maior que $1000?
    SELECT ProductName, UnitPrice 
        FROM DimProduct
        WHERE UnitPrice >= 1000;


    --SELECT * FROM DimProduct;
    SELECT DISTINCT BrandName FROM DimProduct

    SELECT * FROM DimProduct
        WHERE BrandName = 'Fabrikam'