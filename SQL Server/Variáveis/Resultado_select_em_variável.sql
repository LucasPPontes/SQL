-- Armazenando o resultado de um SELECT em uma variável
-- Exemplo 1: Crie uma variável para armazenar a quantidade total de funcionários da tabela DimEmployee
USE ContosoRetailDW;

DECLARE @total_funcionarios INT
SET @total_funcionarios = (SELECT COUNT(*) FROM DimEmployee)
SELECT @total_funcionarios AS 'Total funcionarios'

-- Exemplo 2: Crie uma variável para armazenar a quantidade total de lojas com status off

DECLARE @status_off INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')
SELECT @status_off AS 'Qtde off'
