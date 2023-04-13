-- OS JOINS tem como principal objetivo deixar as tabelas mais informativas, permitindo buscar dados de uma tabela para outra, de acordo com uma coluna em comum que permita essa relação

-- 1 Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela DimProductSubcategory para a tabela DimProduct
USE ContosoRetailDW;

    SELECT * FROM DimProduct
    SELECT * FROM DimProductSubcategory

    SELECT 
        DimProduct.ProductSubcategoryKey,
        DimProduct.ProductName,
        DimProductSubcategory.ProductSubcategoryName
    FROM 
        DimProduct
    INNER JOIN DimProductSubcategory
        ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey

-- 2 Identifique uma coluna em comum entre as tabelas DimProductSubcategory e DimProductCategory. Utilize essa coluna para complementar informações na tabela DimProductSubcategory a partir da DimProductCategory. Utilize LEFT JOIN

USE ContosoRetailDW;

    SELECT * FROM DimProductSubcategory
    SELECT * FROM DimProductCategory

    SELECT
        DimProductSubcategory.ProductCategoryKey,
        DimProductSubcategory.ProductSubcategoryName,
        DimProductCategory.ProductCategoryName
    FROM
        DimProductSubcategory
    LEFT JOIN DimProductCategory
        ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey

-- 3 Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados (de acordo com DimGeography). Seu SELECT final deve contar apenas as seguintes colunas: StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT JOIN

USE ContosoRetailDW;

    SELECT * FROM DimStore
    SELECT * FROM DimGeography

    SELECT
        DimStore.StoreKey,
        DimStore.StoreName,
        DimStore.EmployeeCount,
        DimGeography.ContinentName,
        DimGeography.RegionCountryName
    FROM
        DimStore
    LEFT JOIN DimGeography
        ON DimGeography.GeographyKey = DimStore.GeographyKey

-- 4 Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize o LEFT JOIN e retorne seu SELECT apenas as 5 colunas que considerar mais relevantes
USE ContosoRetailDW;

    SELECT * FROM DimProduct
    SELECT * FROM DimProductCategory

    SELECT 
        DimProduct.ProductName,
        DimProduct.BrandName,
        DimProduct.ClassName,
        DimProduct.ColorName,
        DimProductCategory.ProductCategoryDescription
    FROM 
        DimProduct
    LEFT JOIN DimProductCategory
        ON DimProductCategory.ProductCategoryKey = DimProduct.ProductSubcategoryKey

-- 5 A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha representa um montante destinado a uma determinada AccountKey
-- a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela

    USE ContosoRetailDW;
        SELECT TOP (100) * FROM FactStrategyPlan
        SELECT * FROM DimAccount

-- b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas: StrategyPlanKey, DateKey, AccountName, Amount

    SELECT TOP(100)
        FactStrategyPlan.StrategyPlanKey,
        FactStrategyPlan.Datekey,
        DimAccount.AccountName,
        FactStrategyPlan.Amount
    FROM 
        FactStrategyPlan
    INNER JOIN DimAccount
        ON DimAccount.AccountKey = FactStrategyPlan.AccountKey

-- 6 Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.
-- Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas: StrategyPlanKey, DateKey, ScenarioName, Amount

USE ContosoRetailDW;
    
    SELECT TOP(100) * FROM FactStrategyPlan
    SELECT * FROM DimScenario

    SELECT 
        FactStrategyPlan.StrategyPlanKey,
        FactStrategyPlan.Datekey,
        DimScenario.ScenarioName,
        FactStrategyPlan.Amount
    FROM 
        FactStrategyPlan
    INNER JOIN DimScenario
        ON DimScenario.ScenarioKey = FactStrategyPlan.ScenarioKey

-- 7 Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que subcategorias são essas.
USE ContosoRetailDW;
    
    SELECT * FROM DimProduct
    SELECT * FROM DimProductSubcategory

    SELECT
        DimProduct.ProductSubcategoryKey,
        DimProduct.ProductName,
        DimProductSubcategory.ProductSubcategoryName
    FROM 
        DimProduct
    RIGHT JOIN DimProductSubcategory
        ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
        WHERE ProductName IS NULL

-- 8 A tabela abaixo mostra a combinação entre marca e canal de venda, para as marcas Contoso, Fabrikam e Litware. Crie um código SQL para chegar no mesmo resultado

/* BrandName	ChannelName
Contoso	Catalog
Contoso	Online
Contoso	Reseller
Contoso	Store
Fabrikam	Catalog
Fabrikam	Online
Fabrikam	Store
Litware	Catalog
Litware	Online
Litware	Reseller
Litware	Store
 */
USE ContosoRetailDW;    

    SELECT * FROM DimProduct
    SELECT * FROM DimChannel

    SELECT 
        DimProduct.BrandName,
        DimChannel.ChannelName
    FROM
        DimProduct
    INNER JOIN DimChannel
        ON DimChannel.ETLLoadID = DimProduct.ETLLoadID
    
-- 9 Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion. Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse relacionamento

-- Retorna uma tabela contendo as seguintes colunas: OnlineSalesKey, DateKey, PromotionName, SalesAmount
-- A sua consulta deve considerar apenas as linhas de vendas referente a produtos com desconto (PromotionName <> `No Discount`). Além disso, você deverá ordenar essa tabela de acordo com a coluna DateKey, em ordem crescente

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactOnlineSales
    SELECT TOP(100) * FROM DimPromotion

    SELECT TOP (100)
        FactOnlineSales.OnlineSalesKey,
        FactOnlineSales.DateKey,
        DimPromotion.PromotionName,
        FactOnlineSales.SalesAmount
    FROM
        FactOnlineSales
    LEFT JOIN DimPromotion
        ON DimPromotion.PromotionKey = FactOnlineSales.PromotionKey
    WHERE 
        DimPromotion.PromotionName <> 'No Discount'
    ORDER BY FactOnlineSales.DateKey 

-- 10 Realizar JOIN entre FactSales e as tabelas: DimChannel, DimStore e DimProduct

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales
    SELECT TOP(100) * FROM DimChannel
    SELECT TOP(100) * FROM DimStore
    SELECT TOP(100) * FROM DimProduct

    SELECT TOP(100)
        FactSales.SalesKey,
        DimChannel.ChannelName,
        DimStore.StoreName,
        DimProduct.ProductName,
        FactSales.SalesAmount
    FROM 
        FactSales
    INNER JOIN DimChannel
        ON DimChannel.ChannelKey = FactSales.channelKey
        INNER JOIN DimStore
            ON DimChannel.ETLLoadID = DimStore.ETLLoadID
            INNER JOIN DimProduct
                ON DimProduct.ETLLoadID = DimStore.ETLLoadID
    ORDER BY FactSales.SalesAmount DESC
