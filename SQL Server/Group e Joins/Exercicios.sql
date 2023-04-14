-- FACTSALES

-- 1. a)Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o nome do canal de vendas (ChannelName). Você deve ordernar a tabela final de acordo com o SalesQuantity, em ordem decrescente.
USE ContosoRetailDW;   

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimChannel

    SELECT
        DimChannel.ChannelName,
        SUM(FactSales.SalesQuantity) AS 'SOMA TOTAL DE VENDAS'
    FROM
        FactSales
    INNER JOIN DimChannel
        ON DimChannel.ChannelKey = FactSales.channelKey
    GROUP BY DimChannel.ChannelName
    ORDER BY SUM(FactSales.SalesQuantity) DESC

-- b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e a quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
USE ContosoRetailDW;
    
    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimStore

    SELECT
        DimStore.StoreName,
        SUM(FactSales.SalesQuantity) AS 'QTDE TOTAL VENDIDA',
        SUM(FactSales.ReturnQuantity) AS 'QTDE TOTAL DEVOLVIDA'
    FROM 
        FactSales
    INNER JOIN DimStore
        ON DimStore.StoreKey = FactSales.StoreKey
    GROUP BY DimStore.StoreName
    ORDER BY Dimstore.StoreName

-- c) Faça um resumo do valor total vendido (SalesQuantity) para cada mês (CalendarMonthLabel) e ano (CalendarYear)
USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimDate

    SELECT
        DimDate.CalendarMonthLabel,
        DimDate.CalendarYear,
        SUM(FactSales.SalesQuantity) AS 'Valor total vendido'
    FROM
        FactSales
    INNER JOIN DimDate
        ON DimDate.Datekey = FactSales.DateKey
    GROUP BY DimDate.CalendarMonthLabel, DimDate.CalendarYear, dimdate.CalendarMonth
    ORDER BY Dimdate.CalendarMonth

-- 2 Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesQuantity) por produto
-- a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity)
USE ContosoRetailDW;
    
    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimProduct

    SELECT TOP(1)
        DimProduct.ColorName,
        SUM(FactSales.SalesQuantity) AS 'TOTAL VENDIDO'
    FROM
        FactSales
    INNER JOIN DimProduct
        ON DimProduct.ProductKey = FactSales.ProductKey
    GROUP BY DimProduct.ColorName
    ORDER BY SUM(FactSales.SalesQuantity) DESC

-- b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000?

    SELECT
        DimProduct.ColorName,
        SUM(FactSales.SalesQuantity) AS 'TOTAL VENDIDO'
    FROM
        FactSales
    INNER JOIN DimProduct
        ON DimProduct.ProductKey = FactSales.ProductKey
    GROUP BY DimProduct.ColorName
    HAVING SUM(FactSales.SalesQuantity) >= 3000000
    
-- 3 Crie um agrupamento do zero. Obs: precisará fazer mais do que 1 INNER JOIN, dado que a relação entre FactSales e DimProductCategory não é direta

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimProduct
    SELECT TOP(100) * FROM DimProductSubcategory
    SELECT TOP(100) * FROM DimProductCategory

    SELECT 
        DimProductCategory.ProductCategoryName,
        SUM(FactSales.SalesQuantity) AS 'TOTAL VENDIDO'
    FROM
        DimProductCategory

    INNER JOIN DimProductSubcategory
        ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey

        INNER JOIN DimProduct
            ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

            INNER JOIN FactSales
                ON FactSales.ProductKey = DimProduct.ProductKey

    GROUP BY DimProductCategory.ProductCategoryName

-- FACTONLINESALES
-- 4 a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity) -- 7665

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactOnlineSales
    SELECT TOP(100) * FROM DimCustomer

    SELECT TOP(1)
        DimCustomer.CustomerKey AS 'ID Cliente',
        DimCustomer.FirstName AS 'Nome',
        DimCustomer.LastName AS 'Sobrenome',
        SUM(FactOnlineSales.SalesQuantity) AS 'Qtde Vendida'
    FROM
        FactOnlineSales
    INNER JOIN DimCustomer
        ON DimCustomer.CustomerKey = FactOnlineSales.CustomerKey
    WHERE DimCustomer.CustomerType = 'Person'
    GROUP BY DimCustomer.CustomerKey, DimCustomer.FirstName, DimCustomer.LastName
    ORDER BY SUM(FactOnlineSales.SalesQuantity) DESC

-- b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a), considerando o nome do produto

    SELECT * FROM DimCustomer
    SELECT TOP(100) * FROM FactOnlineSales
    SELECT * FROM DimProduct

    SELECT TOP(10)
        DimCustomer.CustomerKey AS 'ID Cliente',
        DimCustomer.FirstName AS 'Nome',
        DimCustomer.LastName AS 'Sobrenome',
        DimProduct.ProductName AS 'Nome Produto',
        SUM(FactOnlineSales.SalesQuantity) AS 'Quantidade Vendida'
    FROM
        FactOnlineSales
    INNER JOIN DimProduct
        ON FactOnlineSales.ProductKey = DimProduct.ProductKey
        INNER JOIN DimCustomer
            ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
    WHERE DimCustomer.CustomerKey = 7665
    GROUP BY 
    DimCustomer.CustomerKey, 
    DimCustomer.FirstName, 
    DimCustomer.LastName, 
    DimProduct.ProductName
    ORDER BY SUM(FactOnlineSales.SalesQuantity) DESC

-- 5 Faça um resumo mostrando o total de produtos comprados (SalesQuantity) de acordo com o sexo dos clientes

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactOnlineSales
    SELECT * FROM DimCustomer

    SELECT
        DimCustomer.Gender,
        SUM(FactOnlineSales.SalesQuantity) AS 'TOTAL VENDIDO'
    FROM 
        FactOnlineSales
    INNER JOIN DimCustomer
        ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
    WHERE DimCustomer.Gender IS NOT NULL
    GROUP BY DimCustomer.Gender
    ORDER BY SUM(FactOnlineSales.SalesQuantity) DESC

-- FACTEXCHANGERATE

-- 6 Faça uma tabela resumo mostrando a taxa de cambio média de acordo com cada CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100

USE ContosoRetailDW;

    SELECT * FROM DimCurrency
    SELECT * FROM FactExchangeRate

    SELECT
        DimCurrency.CurrencyDescription,
        AVG(FactExchangeRate.AverageRate) AS 'Taxa de cambio média'
    FROM FactExchangeRate
    INNER JOIN DimCurrency
        ON FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
    WHERE FactExchangeRate.AverageRate BETWEEN 10 AND 100
    GROUP BY DimCurrency.CurrencyDescription

-- FACTSTRATEGYPLAN

-- 7 Descubra o valor total na tabela FactExchangeRate destinado para os cenários: Actual e Budget

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactStrategyPlan
    SELECT TOP(100) * FROM DimScenario
    SELECT TOP(100) * FROM FactExchangeRate

    SELECT
        DimScenario.ScenarioName,
        SUM(FactStrategyPlan.Amount) AS 'total'
    FROM
        FactStrategyPlan
    INNER JOIN DimScenario
        ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
    GROUP BY DimScenario.ScenarioName
    HAVING DimScenario.ScenarioName IN ('Actual', 'Budget')

-- 8 Faça uma tabela resumo mostrando o resultado do planejamento estratégico agrupado por ano

USE ContosoRetailDW;    

    SELECT TOP(100) * FROM FactStrategyPlan
    SELECT * FROM DimDate

    SELECT TOP(100)
        Dimdate.CalendarYear,
        SUM(FactStrategyPlan.Amount) AS 'Total '
    FROM
        FactStrategyPlan
    INNER JOIN DimDate
        ON FactStrategyPlan.Datekey = DimDate.Datekey
    GROUP BY DimDate.CalendarYear

-- DIMPRODUCT/ DIMPRODUCTSUBCATEGORY

-- 9 Faça um agrupamento da quantidade de produtos por ProductSubCategoryName. Leve em consideração em sua análise apenas a marca Contoso e a cor Silver

USE ContosoRetailDW;

    SELECT * FROM DimProduct
    SELECT * FROM DimProductSubcategory

    SELECT
        DimProduct.BrandName,
        DimProduct.ColorName,
        DimProductSubcategory.ProductSubcategoryName,
        COUNT(DimProductSubcategory.ProductSubcategoryName) AS 'TOTAL SUBCATEGORIA'
    FROM
        DimProduct
    INNER JOIN DimProductSubcategory
        ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
    WHERE BrandName = 'Contoso' AND ColorName = 'Silver'
    GROUP BY 
    DimProduct.BrandName, 
    DimProduct.ColorName, 
    DimProductSubcategory.ProductSubcategoryName

-- 10 Faça um agrupamento duplo de quantidade de produtos por BrandName e ProductSubCategoryName. A tabela final deverá ser ordenada de acordo com a coluna BrandName

USE ContosoRetailDW;

    SELECT * FROM DimProduct
    SELECT * FROM DimProductSubcategory

    SELECT 
        DimProduct.BrandName,
        DimProductSubcategory.ProductSubcategoryName,
        COUNT(DimProduct.ProductName) AS 'Total de produtos'
    FROM 
        DimProduct
    INNER JOIN DimProductSubcategory
        ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
    GROUP BY DimProduct.BrandName, DimProductSubcategory.ProductSubcategoryName
    ORDER BY DimProduct.BrandName ASC