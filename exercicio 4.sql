CREATE TABLE Produtos
(
	Codprod		INT,
	Descri��o	VARCHAR(20),
	Preco		NUMERIC(9,2),
	Qtde		INT,
	Cor			CHAR(20)
	CONSTRAINT PK_Codprod PRIMARY KEY (Codprod)
)

-- B) Inserir 10 registros;
INSERT INTO Produtos VALUES
(1, 'Feij�o 500g', 6.99, 12, 'Preto'),
(2, 'Arroz 1KG', 14.99, 32, 'Branco' ),
(3, 'Alface', 4.50, 4, 'Verde'),
(4, 'Ma��', 1.99, 20, 'Vermelho'),
(5, 'Carne', 29.99, 7, 'Vermelho'),
(6, 'Laranja', 1.99, 63, 'Laranja'),
(7, 'Balas', 0.50, 230, 'Azul'),
(8, 'P�o de queijo', 3.99, 28, 'Amarelo'),
(9, 'Banana', 0.99, 63, 'Amarelo'),
(10, 'Abacate', 4.99, 21, 'Verde')

-- c) Quantos produtos temos no cadastro?

SELECT COUNT(Codprod) AS 'Quantidade de produtos' FROM Produtos

-- d) Selecionar os produtos com pre�o entre 10 e 50 reais.

SELECT * FROM Produtos WHERE Preco BETWEEN 10 AND 50

-- e) Qual o valor do produto mais caro?

SELECT MAX(Preco) AS 'Valor do produto mais caro' FROM Produtos

-- f) Qual o valor do produto mais barato?

SELECT MIN(Preco) AS 'Valor do produto mais barato' FROM Produtos

-- g) Qual a m�dia de pre�os?

SELECT AVG(Preco) AS 'M�dia de pre�os' FROM Produtos

-- h) Quantos produtos vermelhos temos no cadastro?
SELECT COUNT(Codprod) AS 'Quantidade de produtos vermelhos' FROM Produtos WHERE Cor = 'Vermelho'

-- i) Atualizar o pre�o dos produtos com pre�o abaixo de 10.00 acrescentando 15%;

UPDATE Produtos
SET Preco = (1.15 * Preco) WHERE Preco < 10

-- j) Atualizar o pre�o dos produtos com pre�o acima de 500.00 com um desconto de 5%

UPDATE Produtos
SET Preco = (1.05 * Preco) WHERE Preco > 500

-- k) Excluir todos os produtos com qtde abaixo de 5;

DELETE Produtos WHERE Qtde < 5

-- l) Listar as cores sem duplicidade

SELECT DISTINCT Cor FROM Produtos

-- m) Selecionar todos os produtos de cor Azul, vermelho, branco e preto.

SELECT * FROM Produtos WHERE Cor IN('Azul', 'Vermelho', 'Branco', 'Preto')

-- n) Qual o somat�rio das quantidades?

SELECT SUM(Qtde) AS 'Somat�rio das quantidades' FROM Produtos

-- o) Listar todos os produtos que tem descri��o iniciado em �A�.

SELECT * FROM Produtos WHERE Descri��o LIKE('A%')
