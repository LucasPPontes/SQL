USE ContosoRetailDW;

    --SELECT * FROM DimProduct;
    SELECT UnitPrice FROM DimProduct ORDER BY UnitPrice DESC 

    -- Filtrando uma coluna de números com WHERE
    SELECT ProductName, UnitPrice FROM DimProduct WHERE UnitPrice >= 1000;

    -- Filtrando uma coluna de letras com WHERE

    SELECT * FROM DimProduct;

    SELECT DISTINCT BrandName FROM DimProduct

    SELECT * FROM DimProduct WHERE BrandName = 'Fabrikam'

    SELECT * FROM DimProduct WHERE ColorName = 'Black'

    -- Filtrando uma coluna de datas com WHERE
    -- Quantos clientes nasceram após o dia 31/12/1970

    SELECT * FROM DimCustomer WHERE BirthDate >= '1970-12-31' ORDER BY BirthDate DESC

    -- Operadores lógicos

    -- AND
    SELECT * FROM DimProduct WHERE BrandName = 'Fabrikam' AND ColorName = 'Black';

    -- OR
    SELECT * FROM DimProduct WHERE BrandName = 'Contoso' OR ColorName = 'White';

    SELECT * FROM DimProduct WHERE BrandName = 'Contoso' OR BrandName = 'Fabrikam';

    -- NOT
    SELECT * FROM DimEmployee WHERE NOT DepartmentName = 'Marketing';

    -- WHERE & IN
    SELECT * FROM DimProduct WHERE ColorName IN ('Silver','Blue', 'White', 'Red', 'Black')

    SELECT * FROM DimEmployee WHERE DepartmentName IN ('Marketing', 'Production', 'Engineering')

    -- WHERE & LIKE
    SELECT * FROM DimProduct WHERE ProductName LIKE '%MP3 Player%'
    
    SELECT * FROM DimProduct WHERE ProductDescription LIKE '%Type%'

    SELECT * FROM DimProduct WHERE ProductDescription LIKE 'Type%'

    SELECT * FROM DimProduct WHERE ProductDescription LIKE '%WMA'

    -- WHERE & BETWEEN
    SELECT * FROM DimProduct WHERE UnitPrice BETWEEN 50 AND 100

    SELECT * FROM DimProduct WHERE UnitPrice NOT BETWEEN 50 AND 100

    SELECT * FROM DimEmployee WHERE HireDate BETWEEN '2000-01-1' AND '2000-12-31'

    SELECT * FROM DimEmployee WHERE HireDate NOT BETWEEN '2000-01-1' AND '2000-12-31' 

    -- WHERE & IS NULL & IS NOT NULL
    SELECT * FROM DimCustomer WHERE CompanyName IS NULL

    SELECT * FROM DimCustomer WHERE CompanyName IS NOT NULL