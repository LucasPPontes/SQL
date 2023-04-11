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
        ProductKey FROM DimProduct
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

-- 7 De acordo com a quantidade de funcionários, cada loja receberá uma determinada quantidade de máquinas de café. As lojas serão divididas em 3 categorias:
-- Categoria 1: de 1 a 20 funcionários > 1 máquina de café
-- Categoria 2: de 21 a 50 funcionários > 2 máquinas de café
-- Categoria 3: Acima de 51 funcionários > 3 máquinas de café

-- Identifique, para cada caso, quais lojas de cada uma das 3 categorias acima

USE ContosoRetailDW;
    
    -- Categoria 1:
    SELECT 
        * FROM DimStore
    WHERE EmployeeCount BETWEEN 1 AND 20

    -- Categoria 2:
    SELECT 
        * FROM DimStore
    WHERE EmployeeCount BETWEEN 21 AND 50

    -- Categoria 3:
    SELECT 
        * FROM DimStore
    WHERE EmployeeCount > 50

-- 8 A empresa decidiu que todas as televisões de LCD receberão um super desconto no próximo mês. O seu trabalho é fazer uma consulta à tabela DimProduct e retornar os ID's, Nomes e Preços de todos os produtos LCD existentes

USE ContosoRetailDW;
    
    SELECT 
        ClassID, ProductName, UnitPrice
        FROM DimProduct
    WHERE 
        ProductName LIKE '%LCD%'

-- 9 Faça uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. Estes produtos devem ser exclusivamente das marcas: Contoso, Litware e Fabrikam

USE ContosoRetailDW;

    SELECT 
        * FROM DimProduct
    WHERE
        BrandName IN ('Contoso', 'Litware', 'Fabrikam')
    AND
        ColorName IN ('Green','Orange', 'Black','Silver','Pink')

-- 10 A empresa possui 16 produtos da marca Contoso, da cor Silver e com um UnitPrice entre 10 e 30. Descubra quais são esses produtos e ordene o resultado em ordem descrecente de acordo com o preço (UnitPrice)

USE ContosoRetailDW;

    SELECT 
        * FROM DimProduct
    WHERE
        BrandName = 'Contoso'
    AND 
        ColorName = 'Silver'
    AND 
        UnitPrice BETWEEN 10 AND 30
    ORDER BY UnitPrice DESC