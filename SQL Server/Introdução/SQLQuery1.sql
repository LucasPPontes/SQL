/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT
	*
FROM
	DimAccount
WHERE 
	AccountLabel = 100000--comentário


SELECT TOP(15) * FROM DimAccount -- MOSTRA AS 15 PRIMEIRAS LINHAS TA TABELA

SELECT TOP(30) PERCENT * FROM DimAccount -- MOSTRA 30% DAS PRIMEIRAS LINHAS TA TABELA

SELECT DISTINCT ColorName FROM DimProduct -- RETORNA OS VALORES DISTINTOS, RETIRANDO AS DUPLICAÇÕES

SELECT
	DISTINCT DepartmentName
FROM
	DimEmployee

SELECT
	DISTINCT
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct