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

## Não necessariamente uma relação acontece somente entre uma tabela fato e uma tabela dimensão
## Duas tabelas dimensão também podem se relacionar entre si
## O que não podem se relacionar são duas tabelas fato

# TIPOS DE JOIN
## INNER JOIN: retorna somente as linhas que possuem correspondência em ambas as tabelas. Ou seja, apenas os registros que têm um valor correspondente em ambas as tabelas serão retornados.

## LEFT JOIN (ou LEFT OUTER JOIN): retorna todas as linhas da tabela da esquerda e os registros correspondentes da tabela da direita. Se não houver correspondência, as colunas da tabela da direita serão preenchidas com valores NULL.

## RIGHT JOIN (ou RIGHT OUTER JOIN): retorna todas as linhas da tabela da direita e os registros correspondentes da tabela da esquerda. Se não houver correspondência, as colunas da tabela da esquerda serão preenchidas com valores NULL.

## FULL OUTER JOIN:  retorna todas as linhas de ambas as tabelas. Se houver correspondência, as colunas serão combinadas em uma única linha. Se não houver correspondência, as colunas da tabela que não correspondem serão preenchidas com valores NULL.

## CROSS JOIN: retorna todas as combinações possíveis entre as linhas de ambas as tabelas. Não há necessidade de ter uma coluna de correspondência. Se houver m linhas em uma tabela e n linhas na outra tabela, o resultado terá m x n linhas.

## SELF JOIN: é usado para se juntar a uma tabela consigo mesma. É útil para consultas hierárquicas e autoreferenciadas.

## ANTI JOIN: é um tipo de JOIN que retorna todas as linhas da primeira tabela que não têm correspondência com a segunda tabela. Em outras palavras, o Anti Join retorna todos os registros da primeira tabela que não possuem uma correspondência em comum com a segunda tabela.