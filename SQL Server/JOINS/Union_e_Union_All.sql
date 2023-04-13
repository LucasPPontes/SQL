-- UNION > EXCLUI LINHAS DUPLICADAS
USE ContosoRetailDW;

    SELECT 
        *
    FROM
        DimCustomer
    WHERE 
        Gender = 'F'
    UNION
    SELECT
        *
    FROM
        DimCustomer
    WHERE   
        Gender = 'M'

-- UNION ALL NÃO TIRA AS LINHAS DUPLICADAS

    SELECT  
        FirstName,
        BirthDate
    FROM
        DimCustomer
    WHERE 
        Gender = 'F'
    UNION ALL
        SELECT  
        FirstName,
        BirthDate
    FROM
        DimCustomer
    WHERE 
        Gender = 'M'