USE ContosoRetailDW;

    SELECT * FROM DimStore;

    SELECT TOP(100) * FROM 
        DimStore 
    ORDER BY EmployeeCount DESC;
    
    SELECT TOP(100) 
        ProductName, 
        UnitCost 
        FROM 
            DimProduct 
        ORDER BY UnitCost DESC