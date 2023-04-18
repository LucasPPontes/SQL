-- Declarando mais de uma variável

-- Opção 1

DECLARE @var1 INT
DECLARE @texto VARCHAR(30)
DECLARE @data DATETIME

SET @var1 = 10
SET @texto = 'Texto qualquer'
SET @data = '18/04/2023'

SELECT @var1, @texto, @data

-- Opção 2

DECLARE
    @var1 INT,
    @texto VARCHAR(50),
    @data DATETIME

SET @var1 = 10
SET @texto = 'Texto qualquer'
SET @data = '18/04/2023'

SELECT @var1, @texto, @data

-- Opção 3

DECLARE
    @var1 INT = 10,
    @texto VARCHAR(50) = 'Texto qualquer',
    @data DATETIME = '18/04/2023'

SELECT @var1, @texto, @data

-- Exercício 1: A sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Faça um SELECT para obter o resultado do faturamento (quantidade * preço)

DECLARE
    @qtde_camisas INT = 100,
    @preco FLOAT = 89.99

SELECT 
    @qtde_camisas * @preco AS 'Faturamento'
 