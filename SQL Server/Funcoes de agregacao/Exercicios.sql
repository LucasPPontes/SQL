-- 1 O gerente comercial pediu a você uma análise da quantidade vendida e quantidade devolvida para o canal de venda mais importante da empresa: Store
-- Fazer a análise utilizando a tabela FactSales

USE ContosoRetailDW;
    
    SELECT * FROM FactSales
    
    SELECT
        SUM(SalesQuantity) AS 'Quantidade Vendida',
        SUM(ReturnQuantity) AS 'Quantidade devolvida'
    FROM 
        FactSales
    WHERE 
        channelKey = 1

-- 2 Uma nova ação do setor de marketing precisará avaliar a média salarial de todos os clientes da empresa, mas apenas de ocupação profissional. utilize o comando sql para atingir esse resultado

USE ContosoRetailDW;

    SELECT * FROM DimCustomer

    SELECT
        AVG(YearlyIncome) AS 'Media salarial Professional'
    FROM 
        DimCustomer
    WHERE 
        Occupation = 'Professional'

-- 3 Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na empresa. O seu gerente te pediu os seguintes números e informações:
-- a) quantos funcionários tem a loja com mais funcionários?
-- b) qual é o nome dessa loja?
-- c) Quantos funcionários tem a loja com menos funcionários?
-- d) Qual é o nome dessa loja?

USE ContosoRetailDW;

    SELECT * FROM DimStore

    -- a)
    SELECT 
        MAX(EmployeeCount) AS 'Máximo de funcionários'
    FROM 
        DimStore

    -- b)
    SELECT TOP(1) 
        StoreName AS 'Nome Loja',
        EmployeeCount AS 'Qtd Funcionários'
    FROM 
        DimStore 
    ORDER BY EmployeeCount DESC

    -- c) 
    SELECT
        MIN(EmployeeCount) AS 'Minímo de funcionários'
    FROM    
        DimStore

    -- d)
    SELECT TOP(1) 
        StoreName AS 'Nome Loja',
        EmployeeCount AS 'Qtd Funcionários'
    FROM 
        DimStore 
    WHERE EmployeeCount IS NOT NULL
    ORDER BY EmployeeCount 
    
-- 4 A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade total de funcionários do sexo masculino e do sexo feminino 
-- a) descubra essas duas informações utilizando SQL
-- b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as seguintes informações de cada um deles: Nome, E-mail, Data de contratação

USE ContosoRetailDW;

    SELECT * FROM DimEmployee

-- Masculino
    SELECT 
        COUNT(FirstName) AS 'Primeiro Nome'
    FROM DimEmployee
    WHERE Gender = 'M'

-- Feminino
    SELECT 
        COUNT(FirstName) AS 'Primeiro Nome'
    FROM DimEmployee
    WHERE Gender = 'F'

-- Funcionário mais antigo 
    SELECT TOP(1) 
        FirstName,
        EmailAddress,
        HireDate
    FROM DimEmployee
    WHERE Gender = 'M'
    ORDER BY HireDate

-- Funcionária mais antiga
    SELECT TOP(1) 
        FirstName,
        EmailAddress,
        HireDate
    FROM DimEmployee
    WHERE Gender = 'F'
    ORDER BY HireDate

-- 5 Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes informações:
-- a) Quantidade distinta de cores de produtos
-- b) quantidade distintas de marcas
-- c) Quantidade distinta de classes de produto

USE ContosoRetailDW;

    SELECT * FROM DimProduct

    SELECT
        COUNT(DISTINCT ColorName) AS 'Cores distintas',
        COUNT(DISTINCT BrandName) AS 'Marcas distintas',
        COUNT(DISTINCT ClassName) AS 'Classes dinstintas'
    FROM DimProduct