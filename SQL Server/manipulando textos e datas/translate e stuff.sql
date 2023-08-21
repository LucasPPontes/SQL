-- TRANSLATE E STUFF: Outras funções de substituição
-- TRANSLATE: Substitui cada caractere na ordem encontrada no texto

SELECT TRANSLATE('10.241/444.124k23/1', './k', '---')

SELECT TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ')

-- STUFF: Substitui qualquer texto com uma quantidade de caracteres limitados, por um outro texto


SELECT STUFF('VBA Impressionador', 1, 3, 'Excel')

SELECT
    STUFF('MT98-Moto G', 1, 2, 'CEL'),
    STUFF('AP01-Iphone', 1, 2, 'CEL'),
    STUFF('SS61-Samsung Galaxy', 1, 2, 'CEL')