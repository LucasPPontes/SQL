/* 
Exercício 1: Declare 4 variáveis internas. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7 

*/

DECLARE 
    @valor1 INT = 10,
    @valor2 INT = 5,
    @valor3 INT = 34,
    @valor4 INT = 7

-- a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.

DECLARE @soma INT = @valor1 + @valor2
PRINT @soma

-- b) Cria uma nova variável para armazenar o resultado da subtração entre valor3 e valor4. Chame essa variável de subtracao

DECLARE @subtracao INT = @valor3 - @valor4
PRINT @subtracao

-- c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor 4. Chame essa variável de multiplicação

DECLARE @multiplicacao INT = @valor1 * @valor3
PRINT @multiplicacao

-- d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisão. OBS: O resultado deverá ser decimal e não em inteiro.

DECLARE @divisao INT = @valor3 / @valor4
PRINT CAST(@divisao AS DECIMAL)

-- e) Arredonde o resultado da letra d) para 2 casas decimais

