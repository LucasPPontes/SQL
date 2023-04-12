# GROUP BY 
### O comando GROUP BY em SQL é usado para agrupar um conjunto de resultados por uma ou mais colunas. Ele é comumente usado em conjunto com funções de agregação, como SUM, COUNT, AVG, MIN e MAX, para calcular estatísticas em cada grupo.
A sintaxe básica do comando GROUP BY é a seguinte:
SELECT coluna1, coluna2, ..., funcao_agregacao(coluna)
FROM tabela
GROUP BY coluna1, coluna2, ...
Onde "coluna1, coluna2, ..." são as colunas que serão usadas para agrupar os resultados e "funcao_agregacao" é uma função de agregação que será aplicada a uma ou mais colunas da tabela.
# WHERE E HAVING
### WHERE É UTILIZADO PARA REALIZAR OS FILTROS NA TABELA ORIGINAL ANTES DO AGRUPAMENTO DA TABELA
### HAVING É UTILIZADO PARA RELIZAR OS FILTROS DEPOIS DO AGRUPAMENTO DA TABELA