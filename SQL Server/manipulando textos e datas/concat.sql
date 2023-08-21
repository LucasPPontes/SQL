-- CONCAT: Permite juntar mais de um texto em uma única palavra
-- Faça uma consulta à tabela DimCustomer onde seja possível visualizar o nome completo de cada cliente

Use ContosoRetailDW;

SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
    EmailAddress AS 'E-mail'
FROM
    DimCustomer