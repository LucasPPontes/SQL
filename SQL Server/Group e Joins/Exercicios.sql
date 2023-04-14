-- FACTSALES

-- 1. a)Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o nome do canal de vendas (ChannelName). Você deve ordernar a tabela final de acordo com o SalesQuantity, em ordem decrescente.
USE ContosoRetailDW;   

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimChannel

    SELECT
        SUM(FactSales.SalesQuantity) AS 'SOMA TOTAL DE VENDAS',
        DimChannel.ChannelName
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

-- c) Faça um resumo do valor total vendido (SalesAmount) para cada mês (CalendarMonthLabel) e ano (CalendarYear)
USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimDate

    SELECT
        SUM(FactSales.SalesAmount) AS 'Valor total vendido',
        DimDate.CalendarMonthLabel,
        DimDate.CalendarYear
    FROM
        FactSales
    INNER JOIN DimDate
        ON DimDate.Datekey = FactSales.DateKey
    GROUP BY DimDate.CalendarMonthLabel, DimDate.CalendarYear
    ORDER BY DimDate.CalendarMonthLabel

-- 2 Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesAmount) por produto
-- a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity)
USE ContosoRetailDW;
    
    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimProduct

    SELECT TOP(1)
        DimProduct.ColorName,
        SUM(FactSales.SalesAmount) AS 'TOTAL VENDIDO'
    FROM
        FactSales
    INNER JOIN DimProduct
        ON DimProduct.ProductKey = FactSales.ProductKey
    GROUP BY DimProduct.ColorName
    ORDER BY SUM(FactSales.SalesQuantity) DESC

-- b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000?

    SELECT
        DimProduct.ColorName,
        SUM(FactSales.SalesAmount) AS 'TOTAL VENDIDO'
    FROM
        FactSales
    INNER JOIN DimProduct
        ON DimProduct.ProductKey = FactSales.ProductKey
    GROUP BY DimProduct.ColorName
    HAVING SUM(FactSales.SalesAmount) >= 3000000
    
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
