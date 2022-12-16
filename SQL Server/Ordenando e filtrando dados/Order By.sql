SELECT TOP(100) * FROM DimStore
    ORDER BY EmployeeCount ASC

--ORDER BY POR PADRÃO FICA EM ASC menor para o maior
-- DESC maior para o menor 

-- Exemplo 1: Selecione as 10 primeiras linhas da tabela DimProduct e ordene de acordo com a UnitCost

SELECT 
    TOP(10) ProductName,
    UnitCost,
    Weight
FROM 
    DimProduct
ORDER BY UnitCost DESC, Weight DESC
