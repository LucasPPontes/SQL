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

-- A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha representa um montante destinado a uma determinada AccountKey
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