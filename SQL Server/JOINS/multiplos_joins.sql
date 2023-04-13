USE ContosoRetailDW;

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory
SELECT * FROM DimProductCategory

SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct

SELECT ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey FROM DimProductSubcategory

SELECT ProductCategoryKey, ProductCategoryName FROM dimProductCategory


SELECT
    DimProduct.ProductKey,
    DimProduct.ProductName,
    DimProduct.ProductSubcategoryKey,
    DimProductCategory.ProductCategoryName
FROM
    DimProduct
INNER JOIN DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
        INNER JOIN DimProductCategory
            ON DimProductSubcategory.ProductSubcategoryKey = DimProductCategory.ProductCategoryKey
            
