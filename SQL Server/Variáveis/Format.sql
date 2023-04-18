-- FORMAT: Função para formatação de valores no SQL

-- a) Numéricos:
    SELECT FORMAT(1000, 'N') -- number
    SELECT FORMAT(1000, 'G') -- geral

-- b) Personalizados: 
    SELECT FORMAT(123456789, '###-###-###')

-- c) Data:
    SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'dd/MM/yyyy')
    SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dddd')

-- Exercício 3: Cria uma consulta juntando o texto 'A data de validade do produto é: ' com a data 17/abr/2022. Obs: Você deverá usar o CAST para garantir que a data é entendida como o tipo DATETIME

SELECT 
    'A data de validade do produto é: ' + FORMAT(CAST('17/04/2022' AS DATETIME), 'dd/MM/yyyy')