-- CAST ESPECIFICANDO O TIPO DE DADO

-- com o cast podemos forçar um elemento ter qualquer formato, ex um número int se tornar um varchar. 

SELECT 
    SQL_VARIANT_PROPERTY(CAST(21.45 AS INT), 'BaseType'),
    SQL_VARIANT_PROPERTY(CAST(21.45 AS FLOAT), 'BaseType'),
    SQL_VARIANT_PROPERTY(CAST(18.7 AS FLOAT), 'BaseType'),
    SQL_VARIANT_PROPERTY(CAST('15.6' AS FLOAT), 'BaseType'),
    SQL_VARIANT_PROPERTY(CAST(15.5 AS VARCHAR), 'BaseType'),
    SQL_VARIANT_PROPERTY(CAST('21/12/2000' AS DATETIME), 'BaseType')


-- Exercício 1: Crie uma consulta juntando o texto "o preço do produto é: 'com o valor de 30.99'"

SELECT
    'O preço do produto é: ' + CAST(30.99 AS VARCHAR)

-- Exercício 2: Adicione 1 dia à data '20/06/2021'

SELECT 
    CAST('20/06/2021' AS DATETIME) + 1 AS DATA