-- Acumulando valores em uma variável
-- Exemplo: Printe na tela uma lista com os nomes das funcionárias do departamento de Marketing
USE ContosoRetailDW;

    SELECT 
        FirstName,
        DepartmentName
    FROM
        DimEmployee
    WHERE DepartmentName = 'Marketing' AND Gender = 'F'

-- Solução 

DECLARE @lista_nomes VARCHAR(50)
SET @lista_nomes = ''

SELECT 
    @lista_nomes = @lista_nomes + FirstName + ', '
FROM
    DimEmployee
WHERE 
    DepartmentName = 'Marketing' AND Gender = 'F'

PRINT LEFT(@lista_nomes, DATALENGTH(@lista_nomes) - 2) -- filtro de texto para tirar ', ' do final