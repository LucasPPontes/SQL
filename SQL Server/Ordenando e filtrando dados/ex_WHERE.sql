USE ContosoRetailDW;

-- 1 Selecionar todas as linhas da tabela dimEmployee de funcionários do sexo feminino e do departamento de finanças 
SELECT * FROM DimEmployee WHERE Gender = 'F' AND DepartmentName = 'Finance'

-- 2 Selecione todas as linhas da tabela dimProduct de produtos da marca contoso e da cor vermeha e que tenham um UnitPrice maior ou igual a $100
SELECT * FROM DimProduct WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 100

-- 3 Selecione todas as linhas da tabela dimProduct com produtos da marca Litware ou da marca Fabrikam ou da cor preta
SELECT * FROM DimProduct WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'

-- 4 Selecione todas as linhas da tabela dimSalesTerritory onde o continente é a Europa mas o país não é igual a Itália 
SELECT * FROM DimSalesTerritory WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy';