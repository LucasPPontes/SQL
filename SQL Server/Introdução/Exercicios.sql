SELECT * FROM DimProduct

SELECT CustomerKey AS ID, FirstName AS PRIMEIRONOME, EmailAddress AS EMAIL, BirthDate AS NASCIMENTO FROM DimCustomer

SELECT TOP(100) * FROM DimCustomer 

SELECT TOP(10) PERCENT * FROM DimCustomer

SELECT TOP(100) FirstName, EmailAddress, BirthDate FROM DimCustomer 

SELECT TOP(100) FirstName AS PrimeiroNome, EmailAddress AS Email, BirthDate AS Aniversario FROM DimCustomer 

SELECT ProductName AS PRODUTO FROM DimProduct

SELECT * FROM DimProduct