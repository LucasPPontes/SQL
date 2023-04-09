USE ContosoRetailDW;

    --SELECT * FROM DimProduct;
    SELECT UnitPrice FROM DimProduct
    ORDER BY UnitPrice DESC 

    -- Filtrando uma coluna de números com WHERE
    SELECT ProductName, UnitPrice 
        FROM DimProduct
        WHERE UnitPrice >= 1000;

    -- Filtrando uma coluna de letras com WHERE

    SELECT * FROM DimProduct;
    SELECT DISTINCT BrandName FROM DimProduct

    SELECT * FROM DimProduct
        WHERE BrandName = 'Fabrikam'

    SELECT * FROM DimProduct
        WHERE ColorName = 'Black'

    -- Filtrando uma coluna de datas com WHERE
    -- Quantos clientes nasceram após o dia 31/12/1970

    SELECT * FROM DimCustomer
        WHERE BirthDate >= '1970-12-31'
        ORDER BY BirthDate DESC

    -- Operadores lógicos

    -- AND
    SELECT * FROM DimProduct
        WHERE BrandName = 'Fabrikam' AND ColorName = 'Black';

    -- OR
    SELECT * FROM DimProduct
        WHERE BrandName = 'Contoso' OR ColorName = 'White';

    SELECT * FROM DimProduct
        WHERE BrandName = 'Contoso' OR BrandName = 'Fabrikam';

    -- NOT
    SELECT * FROM DimEmployee
        WHERE NOT DepartmentName = 'Marketing';