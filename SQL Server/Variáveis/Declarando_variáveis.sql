
--  ESTRUTURA

  /*   DECLARE @var tipo
    SET @var = valor
    SELECT @ var */

--  EM VEZ DE:
    SELECT 1000
    SELECT 1000 * 1000
    SELECT FORMAT(1000 * 1000, 'N')

--  SERIA MELHOR:
    DECLARE @numero FLOAT
    SET @numero = 1000

    SELECT @numero
    SELECT @numero * @numero
    SELECT FORMAT(@numero * @numero, 'N')

-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 30

DECLARE @idade INT 
SET @idade = 30
SELECT @idade AS 'Idade'

-- Exemplo 2: Declare uma variável chamada 'preco' e armazene o valor 10.89

DECLARE @preco FLOAT
SET @preco = 10.89
SELECT @preco AS 'Preço'

-- Exemplo 3: Declare uma variável chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome VARCHAR(30)
SET @nome = 'Mateus'
SELECT @nome AS 'Nome'

-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje

DECLARE @data DATETIME
SET @data = '18/04/2023'
SELECT @data AS 'Data Hoje'