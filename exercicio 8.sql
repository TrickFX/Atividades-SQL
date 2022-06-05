CREATE TABLE Clientes (
	Codeli		INT,
	Nome		VARCHAR(30),
	Ender		VARCHAR(40),
	Bairro		VARCHAR(20),
	Cidade		VARCHAR(20),
	Idade		INT
	CONSTRAINT PK_Clientes PRIMARY KEY (Codeli)
)

CREATE TABLE Produtos (
	Codprod		INT,
	Descrição	VARCHAR(20),
	Preco		NUMERIC(9,2)
	CONSTRAINT PK_Produtos PRIMARY KEY (Codprod)
)

CREATE TABLE Pedidos (
	Codped		INT,
	Codeli		INT,
	Data		DATETIME
	CONSTRAINT PK_Pedidos PRIMARY KEY (Codped)
	CONSTRAINT FK_Clientes FOREIGN KEY (Codeli) REFERENCES Clientes (Codeli)
)

CREATE TABLE Itens_pedido (
	Codped		INT,
	Codprod		INT,
	Qtde		INT,
	CONSTRAINT FK_ItensPed FOREIGN KEY (Codped) REFERENCES Pedidos (Codped),
	CONSTRAINT FK_Codprod FOREIGN KEY (Codprod) REFERENCES Produtos (Codprod)
)

-- B) Inserir 5 registros em cada tabela

INSERT INTO Clientes VALUES
(1, 'Cassio Menezes', 'R Carlos Aires', 'Jardim Stella', 'Santo André', 24),
(2, 'Daira Grotolli', 'R da Goiaba', 'Vila Natal', 'Mauá', 22),
(3, 'Leonor Paiva', 'R das flores', 'Nova petrópolis', 'SBC', 36),
(4, 'Nicolle Marinho', 'R União Popular', 'Grajaú', 'São Paulo', 28),
(5, 'Antonio Kauã', 'R São Salvador da Torre', 'Santa Maria', 'SCS', 19)

INSERT INTO Produtos VALUES
(1, 'Arroz 1KG', '13.50'),
(2, 'Feijão 500G', '6.99'),
(3, 'Alface', '7.55'),
(4, 'Carne', '15.99'),
(5, 'Tomates 500G', '18.99')

INSERT INTO Pedidos VALUES 
(1,1,'20220325'),
(2,1,'20220310'),
(3,3,'20220325'),
(4,4,'20220406'),
(5,5,'20220420')

INSERT INTO Itens_pedido VALUES
(1, 2, 2),
(2, 1, 2),
(3, 4, 1),
(4, 3, 5),
(5, 5, 2)

-- C) Selecionar todos os pedidos com preço entre 10 e 70

SELECT * FROM Produtos WHERE Preco BETWEEN 10 AND 70

-- D) Qual a média de idade dos clientes 

SELECT AVG(Idade) AS 'Média das idades' FROM Clientes

-- E) Qual a média de preços dos produtos 

SELECT AVG(Preco) AS 'Média dos preços' FROM Produtos

-- F) Quantos pedidos temos no cadastro?

SELECT COUNT(Codped) AS 'Quantidade de pedidos' FROM Pedidos

-- G) Selecionar todos os clientes que moram em Santo André, SBC, SCS ou Mauá.

SELECT * FROM Clientes WHERE Cidade IN('Santo André', 'SBC', 'SCS', 'Mauá')

-- H) Selecionar todas as cidades onde temos clientes, sem repetição.

SELECT DISTINCT Cidade FROM Clientes

-- I) Selecionar todos os produtos com preço acima da média.

SELECT * FROM Produtos WHERE Preco > (SELECT AVG(Preco) FROM Produtos);

-- J) Reajustar o preço de todos os produtos com 10% de aumento.

UPDATE Produtos
SET Preco = (1.1 * Preco)

-- K) Quantos itens tem o Pedido de código 01?

SELECT COUNT(*) AS 'Quantidade de pedidos' FROM Itens_pedido WHERE Codped = 1

-- L) Quantos pedidos temos na data mais recente?

SELECT * FROM Pedidos WHERE Data = (SELECT MAX(Data) FROM Pedidos)

-- M) Adicionar o atributo Qtde_estq na tabela produtos.

ALTER TABLE Produtos
ADD Qtde_estq	INT

-- N) Alterar os registros adicionando quantidade em estoque de cada produto, um  valor para cada código.

UPDATE Produtos
SET Qtde_estq = 32
WHERE Codprod = 1

UPDATE Produtos
SET Qtde_estq = 20
WHERE Codprod = 2

UPDATE Produtos
SET Qtde_estq = 17
WHERE Codprod = 3

UPDATE Produtos
SET Qtde_estq = 5
WHERE Codprod = 4

UPDATE Produtos
SET Qtde_estq = 13
WHERE Codprod = 5

-- O) Selecionar os clientes com nome iniciado pela letra 'A'

SELECT Nome FROM Clientes WHERE Nome LIKE 'A%'



