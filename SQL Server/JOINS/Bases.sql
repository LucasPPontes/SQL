--Consulta 1:

CREATE TABLE produtos(
id_produto int,
nome_produto varchar(30),
id_subcategoria int)

INSERT INTO produtos(id_produto, nome_produto, id_subcategoria)
VALUES
(1, 'Fone Bluetooth JBL', 5),
(2, 'PS4', 6),
(3, 'Notebook Samsung i3', 2),
(4, 'iPhone 11', 1),
(5, 'Moto G9', 1)

--Consulta 2:

CREATE TABLE subcategoria(
id_subcategoria int,
nome_subcategoria varchar(30))

INSERT INTO subcategoria(id_subcategoria, nome_subcategoria)
VALUES
(1, 'Celular'),
(2, 'Notebook'),
(3, 'Câmera Digital'),
(4, 'Televisão'),
(5, 'Fone de Ouvido')