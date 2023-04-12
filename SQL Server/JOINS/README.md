# Chave Primária VS Chave Estrangeira

## Chave Primária
### É uma coluna que identifica as informações distintas em uma tabela. Geralmente é uma coluna de ID, seus valores não podem se repetir

## Chave Estrangeira
### É uma coluna que permite relacionar as linhas de uma segunda tabela com a Chave Primária de uma primeira tabela, os valores podem acabar se repetindo 

# Tabela Fato VS Tabela Dimensão

## Tabela Dimensão
### É uma tabela que contém características de um determinado elemento: lojas, produtos, funcionários, clientes, etc.
### Nesta tabela, nenhum dos elementos principais irá se repetir. É onde vamos encontrar as CHAVES PRIMÁRIAS

## Tabela Fato
### É uma tabela que vai registrar os fatos ou acontecimentos de uma empresa/negócio em determinados períodos de tempo (vendas, devoluções, aberturas de chamadas, receitas, despesas, etc).
### Geralmente é uma tabela com milhares de informações e composto essencialmente por colunas de ID usadas para buscar as informações complementares de uma tabela dimensão conhecidas como CHAVES ESTRANGEIRAS