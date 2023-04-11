-- 1 Você é o gerente da área de compras e precisa criar um relatório com as top 100 vendas, de acordo com a quantidade vendida. Você precisa fazer isso em 10 min pois o diretor de compras solicitou essa informação para apresentar em uma reunião
-- Buscar essas top 100 vendas de acordo com o total vendido (salesAmount)

USE ContosoRetailDW;

    SELECT TOP(100) * FROM FactSales ORDER BY SalesAmount DESC

-- 2 Os top 10 produtos com maior UnitPrice possuem exatamente o mesmo preço. Porém, a empresa quer diferenciar esses preços de acordo com o peso (Weight) de cada um

USE ContosoRetailDW;

    SELECT TOP(10) * FROM DimProduct ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate

-- 3 Você é responsável pelo setor de logística da empresa Contoso e precisa dimensionar o transporte de todos os produtos em categorias, de acordo com o peso
-- Os produtos da categoria A, com peso acima de 100kg, deverão ser transportados na primeira leva.
-- Faça uma consulta no banco de dados para descobrir quais são estes produtos que não estão na categoria A
-- a) Você deverá retornar apenas 2 colunas nesse consulta: Nome do produto e peso
-- b) Renomeie essas colunas com nomes mais intuitivos
-- c) Ordene esses produtos do mais pesado para o mais leve

USE ContosoRetailDW;
    
    SELECT 
        ProductName AS NomeProduto, 
        Weight AS PESO 
    FROM 
        DimProduct 
    WHERE 
        BrandName = 'Contoso' AND Weight > 100 
    ORDER BY 
        PESO DESC

-- 4 Você foi alocado para criar um relatório das lojas registradas atualmente na Contoso
-- a) Descubra quantas lojas a empresa tem no total. Na consulta que você deverá fazer à tabela dimStore, retorne as seguintes informações: StoreName, OpenDate, EmployeeCount
-- b) Renomeie as colunas anteriores para deixar a sua consulta mais intuitiva
-- c) Dessas lojas, descubra quantas (e quais) lojas ainda estão ativas

USE ContosoRetailDW;
    
    SELECT 
        StoreName AS NomeLoja,
        OpenDate AS DataAbertura,
        EmployeeCount AS TotalFuncionarios
    FROM 
        DimStore
    WHERE EmployeeCount IS NOT NULL

-- 5 O gerente da área de controle de qualidade notificou à Contoso que todos os produtos Home Theater da marca Litware, disponibilizados para venda no dia 15 de março de 2009 foram identificados com defeitos de fábrica
-- O que você deverá fazer é identificar os ID's desses produtos e repassar ao gerente para que ele possa notificar as lojas e consequentemente solicitar a suspensão das vendas desses produtos

USE ContosoRetailDW;
    
    SELECT 
        * FROM DimProduct
    WHERE
        BrandName = 'Litware' 
        AND ProductName LIKE '%Home Theater%'
        AND AvailableForSaleDate = '20090315' -- Quanto trabalhamos com uma coluna com data & hora utilizamos a data nesse formato sem o " - "

-- 6 Imagine que você precise extrair um relatório da tabela DimStore, com informações de lojas. Mas você precisa apenas das lojas que não estão mais funcionando atualmente
-- a) utilize a coluna de status para filtrar a tabela e trazer apenas as lojas que não estão mais funcionando
-- b) agora imagine que essa coluna de status não existe na sua tabela. Qual seria a outra forma que você teria de descobrir quais são as lojas que não estão mais funcionando 

USE ContosoRetailDW;
    -- a)
    SELECT 
        * FROM DimStore
    WHERE 
        Status = 'Off'

    -- b) 
    SELECT 
        * FROM DimStore
    WHERE 
        CloseDate IS NOT NULL