-- FACTSALES
-- 1 a) faça um resumo da quantidade vendida (salesquantity) de acordo com o canal de vendas (channelkey)
-- b) Faça um agrupamento mostrando a quantidade total vendida (salesquantity) e quantidade total devolvida (return quantity) de acordo com o ID das lojas (storekey)
-- c) faça um resumo do valor total vendido (salesamount) para cada canal de venda, mas apenas para o ano de 2007

USE ContosoRetailDW;

    SELECT * FROM FACTSALES
-- a)
    SELECT 
        ChannelKey,
        SUM(SalesQuantity) AS 'Quantidade vendida'
    FROM 
        FactSales
    GROUP BY channelKey

-- b)
    SELECT  
        StoreKey,
        SUM(SalesQuantity) AS 'Quantidade total vendida',
        SUM(ReturnQuantity) AS 'Quantidade total devolvida'
    FROM FactSales
    GROUP BY StoreKey

-- c) 
    SELECT 
        ChannelKey,
        SUM(SalesAmount)
    FROM FactSales
    WHERE DateKey BETWEEN '20070101' AND '20071231'
    GROUP BY channelKey
    
-- 2 Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesAmount) por produto
-- a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso, mostrar apenas os produtos que tiveram um resultado final de vendas maior que $5.000.000
-- b) Faça uma adaptação no exercício anterior e mostra os Top 10 produtos com mais vendas. Desconsidere o filtro de $5.000.000

USE ContosoRetailDW;
    SELECT TOP(10) * FROM FactSales
-- a)    
    SELECT
        ProductKey AS 'Chave Produto',
        SUM(SalesAmount) AS 'Valor total vendido'
    FROM
        FactSales
    GROUP BY ProductKey
    HAVING SUM(SalesAmount) > 5000000
-- b)
    ORDER BY SUM(SalesAmount) DESC

-- FACTONLINESALES
-- 3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity)
-- b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a)

USE ContosoRetailDW;
    
    SELECT TOP(1000)* FROM FactOnlineSales
-- a)
    SELECT TOP(1)
        CustomerKey AS 'Chave cliente',
        SUM(SalesQuantity) AS 'Total de compras'
    FROM
        FactOnlineSales
    GROUP BY CustomerKey
    ORDER BY SUM(SalesQuantity) DESC  

-- b)
    SELECT TOP(3)
        ProductKey AS 'Chave produto',
        SUM(SalesQuantity) AS 'Total vendido'
    FROM FactOnlineSales
    GROUP BY ProductKey
    ORDER BY SUM(SalesQuantity) DESC

-- DIMPRODUCT
-- 4. a)Faça um agrupamento e descubra a quantidade total de produtos por marca
-- b) determine a média do preço unitário (unitprice) para cada ClassName
-- c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui
USE ContosoRetailDW;

    SELECT * FROM DimProduct
-- a)
    SELECT
        BrandName AS 'Marca',
        COUNT(ProductName) AS 'Qtde Produtos'
    FROM DimProduct
    GROUP BY BrandName
-- b)
    SELECT 
        ClassName,
        AVG(UnitPrice) AS 'Media preço'
    FROM
        DimProduct
    GROUP BY ClassName
-- c)
    SELECT
        ColorName,
        SUM(Weight) AS 'Peso total'
    FROM
        DimProduct
    GROUP BY ColorName

-- 5 Você deverá descobrir o peso total para cada tipo de produto (StockTypeName). A tabela final deve considerar apenas a marca Contoso e ter os seus valores classificados em ordem decrescente 

USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT
        StockTypeName,
        SUM(Weight) AS 'Peso total'
    FROM 
        DimProduct
    WHERE BrandName = 'Contoso'
    GROUP BY 
        StockTypeName
    
-- 6 Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as 16 opções de cores?
USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT 
        COUNT(DISTINCT ColorName) AS 'cores distintas',
        BrandName
    FROM
        DimProduct
    GROUP BY BrandName

-- DIMCUSTOMER
-- 7 Faça um agrupamento para saber o total de clientes de acordo com o sexo e também a média salarial de acordo com o sexo. Corrija qualquer resultado 'inesperado'
USE ContosoRetailDW;

    SELECT * FROM DimCustomer

    SELECT 
        Gender,
        COUNT(FirstName),
        AVG(YearlyIncome) AS 'Media salarial'
    FROM DimCustomer
    WHERE Gender IS NOT NULL
    GROUP BY Gender

-- 8 Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de acordo com o seu nível escolar. Utilize a coluna Education da tabela dimCustumer para fazer esse agrupamento

USE ContosoRetailDW;

    SELECT 
        COUNT(FirstName) AS 'Contagem de clientes',
        AVG(YearlyIncome) AS 'Media salarial',
        Education
    FROM 
        DimCustomer
    WHERE Education IS NOT NULL
    GROUP BY Education

-- DIMEMPLOYEE
-- 9 Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o Departamento (DepartmentName) e considerar apenas funcionários ativos

USE ContosoRetailDW;

    SELECT * FROM DimEmployee

    SELECT 
        COUNT(FirstName) AS 'Contagem de funcionários',
        DepartmentName AS 'Nome departamento'
    FROM 
        DimEmployee
    WHERE Status = 'Current'
    GROUP BY DepartmentName

-- 10 Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Você deve considerar apenas as mulheres dos departamentos de production, marketing, engineering e finance, para os funcionários contratados entre os anos 1999 e 2000

USE ContosoRetailDW;

    SELECT * FROM DimEmployee

    SELECT
        Title,
        SUM(VacationHours) AS 'Total de horas'
    FROM 
        DimEmployee
    WHERE 
        Gender = 'F' 
        AND DepartmentName IN ('Production','Marketing', 'Engineering', 'Finance') 
        AND HireDate BETWEEN '1999-01-01' AND '2000-12-31'
    GROUP BY Title
