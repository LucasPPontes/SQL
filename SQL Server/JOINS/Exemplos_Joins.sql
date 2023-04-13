-- EXEMPLOS DE JOINS

USE ContosoRetailDW;

SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct

SELECT ProductSubcategoryKey, ProductSubcategoryName FROM DimProductSubcategory

-- INNER JOIN

SELECT
    ProductKey,
    ProductName,
    DimProduct.ProductSubcategoryKey,
    ProductSubcategoryName
FROM
    DimProduct
INNER JOIN DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey

-- LEFT JOIN

SELECT
    ProductKey,
    ProductName,
    DimProduct.ProductSubcategoryKey,
    ProductSubcategoryName
FROM
    DimProduct
LEFT JOIN DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey

-- RIGHT JOIN

SELECT
    ProductKey,
    ProductName,
    DimProduct.ProductSubcategoryKey,
    ProductSubcategoryName
FROM
    DimProduct
RIGHT JOIN DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey

