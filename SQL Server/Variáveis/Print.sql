-- Utilizando o PRINT para mostrar o resultado de uma consulta
USE ContosoRetailDW;

    SELECT * FROM DimProduct
    SELECT COUNT(*) FROM DimProduct

-- Exemplo 1: Printa na tela a quantidade de lojas On e a quantidade de lojas off da tabela DimStore. Utilize variáveis para isso

DECLARE @loja_on INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On')

DECLARE @loja_off INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')

SELECT
    @loja_on AS 'Loja On',
    @loja_off AS 'Loja Off'

PRINT 'O total de lojas abertas é: ' + CAST(@loja_on AS VARCHAR(30))
PRINT 'O total de lojas fechadas é: ' + CAST(@loja_off AS VARCHAR(30))