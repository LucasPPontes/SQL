/* 
Exercício 1: Declare 4 variáveis internas. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7 

*/

DECLARE 
    @valor1 FLOAT = 10,
    @valor2 FLOAT = 5,
    @valor3 FLOAT = 34,
    @valor4 FLOAT = 7

-- a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.

DECLARE @soma FLOAT = @valor1 + @valor2
PRINT @soma

-- b) Cria uma nova variável para armazenar o resultado da subtração entre valor3 e valor4. Chame essa variável de subtracao

DECLARE @subtracao FLOAT = @valor3 - @valor4
PRINT @subtracao

-- c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor 4. Chame essa variável de multiplicação

DECLARE @multiplicacao FLOAT = @valor1 * @valor3
PRINT @multiplicacao

-- d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisão. OBS: O resultado deverá ser decimal e não em inteiro.

DECLARE @divisao FLOAT = @valor3 / @valor4
PRINT ROUND(@divisao, 2)

-- e) Arredonde o resultado da letra d) para 2 casas decimais


-- 2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser especificado.
-- a) Declare uma variável chamada 'produto' e atribua o valor de 'Celular'
DECLARE @produto VARCHAR(10) = 'Celular'
PRINT @produto
-- b) Declare uma variável chamada 'quantidade' e atribua o valor de 12.
DECLARE @quantidade INT = 12
PRINT @quantidade
-- c) Declare uma variável chamada 'preco' e atribua o valor 9.99.
DECLARE @preco DECIMAL = 9.99
PRINT @preco
-- d) Declare uma variável chamada 'faturamento' e atribua o resultado da multiplicação entre 'quantidade' e 'preco'
DECLARE @faturamento DECIMAL = @quantidade * @preco
PRINT @faturamento
-- e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT
SELECT
    @produto AS 'Produto',
    @quantidade AS 'Quantidade',
    @preco AS 'Preco',
    @faturamento AS 'Faturamento'


-- 3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de usuários. Em resumo, esses dados são:

-- Nome de usuário
-- Data de nascimento
-- Quantidade de pets que aquele usuário possui

-- Você precisará criar um código SQL capaz de juntar as informações fornecidas por este usuário. Para simular estes dados, crie 3 variáveis, chamadas: 'nome', 'data_nascimento', e 'num_pets'. Você deverá armazenar os valores 'Andre', '10/02/1998' e 2, respectivamente o resultado final a ser alcançado será:
-- Meu nome é Andre, nasci em 10/02/1998 e tenho 2 pets

DECLARE 
    @nome VARCHAR(50) = 'Andre',
    @data_nascimento DATETIME = '10/02/1998',
    @num_pets INT = 2


PRINT'Meu nome é ' + @nome + ', nasci em ' + FORMAT(CAST(@data_nascimento AS DATETIME),'dd/MM/yyyy') + ' e tenho ' + CAST(@num_pets AS VARCHAR) + ' pets' 

-- 4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as lojas da empresa
-- A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
-- O resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
-- 'As lojas fechadas no ano de 2008 foram: ' + nome_das_lojas'

USE ContosoRetailDW;

DECLARE @varListaLojas VARCHAR(50)
SET @varListaLojas = ''
SELECT
   StoreName,
   CloseDate
FROM
    DimStore
WHERE
   FORMAT(CloseDate, 'yyyy') = 2008

SELECT
   @varListaLojas =  @varListaLojas + StoreName + ', '
FROM
    DimStore
WHERE 
    FORMAT(CloseDate, 'yyyy') = 2008

PRINT 'As lojas fechadas no ano de 2008 foram: ' + @varListaLojas

-- 5 Você precisa criar uma consulta para mostrar a lista de produtos da tabela dimProduct para uma subcategoria específica: 'Lamps'
-- Utilize o conceito de variáveis para chegar nesse resultado

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

DECLARE @varNomeSubcategoria VARCHAR(50) = 'Lamps'
DECLARE @varIdSubcategoria INT 

SET @varIdSubcategoria = (SELECT ProductSubcategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = @varNomeSubcategoria)

SELECT 
    *
FROM 
    DimProduct
WHERE 
    ProductSubcategoryKey = @varIdSubcategoria