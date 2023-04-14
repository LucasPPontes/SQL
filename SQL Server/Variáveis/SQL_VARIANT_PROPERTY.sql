-- 1) SQL_VARIANT_PROPERTY

SELECT 
    10 AS 'Número',
    49.50 AS 'DECIMAL',
    'Lucas' AS 'Texto',
    '21/12/2000' AS 'Data'

SELECT 
    SQL_VARIANT_PROPERTY(10, 'BaseType') AS 'INT',
    SQL_VARIANT_PROPERTY(49.50, 'BaseType') AS 'DECIMAL',
    SQL_VARIANT_PROPERTY('Lucas', 'BaseType') AS 'TEXT',
    SQL_VARIANT_PROPERTY('21/12/2000', 'BaseType') AS 'Data'