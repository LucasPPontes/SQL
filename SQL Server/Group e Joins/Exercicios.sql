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
    