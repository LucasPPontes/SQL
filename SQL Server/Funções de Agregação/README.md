# Funções de agregação em SQL

## SUM
### Realiza soma entre as tabelas ou colunas

SELECT 
        SUM(SalesQuantity) AS 'Total vendido',
        SUM(ReturnQuantity) AS 'Total Devolvido'
    FROM    
        FactSales

## COUNT 
### Realiza a contagem de quantos elementos tem existentes dentro da coluna ou tabela, desconsiderando valores nulos

SELECT 
        COUNT(ProductName) AS 'QTDE PRODUTOS'
    FROM
        DimProduct

### COUNT & DISTINCT
SELECT
        COUNT(DISTINCT BrandName)
    FROM
        DimProduct

## MAX | MIN
### MAX : Coleta o valor máximo dentro da tabela ou coluna
### MIN : Coleta o valor minímo dentro da tabela ou coluna

 SELECT 
        MAX(UnitPrice) AS 'Preco Maximo',
        MIN(UnitPrice) AS 'Preco Minimo'
    FROM
        DimProduct

## AVG 
### Coleta a média dentro da tabela ou coluna

SELECT
        AVG(YearlyIncome) AS 'MEDIA'
    FROM
        DimCustomer

