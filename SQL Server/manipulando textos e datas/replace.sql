-- REPLACE: Substitui um determinado texto por outro texto
-- No texto 'O Excel é melhor', substitua 'Excel' por 'SQL'


SELECT REPLACE('O Excel é melhor', 'Excel', 'SQL') 


-- Crie uma consulta a partir de DimCustomer onde você retorna o Nome Completo dos Clientes, a coluna de Sexo (Abrev) e uma outra coluna de Sexo substituindo M por Masculino e F por Feminino

USE ContosoRetailDW;


SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    Gender AS 'Sexo Abreviado',
    REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo'
FROM
    DimCustomer
    