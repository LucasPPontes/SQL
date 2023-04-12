USE ContosoRetailDW;

    SELECT * FROM DimCustomer

    SELECT
        AVG(YearlyIncome) AS 'MEDIA'
    FROM
        DimCustomer