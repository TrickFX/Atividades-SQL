CREATE TABLE Est_Cliente
(
CPF		VARCHAR(13),
Nome	VARCHAR(40),
Nascto	DATETIME
CONSTRAINT PK_CPF PRIMARY KEY (CPF)
)

CREATE TABLE Est_Modelo
(
CodMod	INT,
Descr	VARCHAR(40)
CONSTRAINT PK_CodMod PRIMARY KEY (CodMod)
)

CREATE TABLE Est_patio
(
Num			INT,
ender		VARCHAR(40),
capacidade	int
CONSTRAINT PK_Num PRIMARY KEY (Num)
)

CREATE TABLE Est_Veiculo
(
Placa			VARCHAR(8),
Cliente_cpf		VARCHAR(13),
Modelo			INT,
Cor				VARCHAR(20),
Ano				INT
CONSTRAINT PK_Placa PRIMARY KEY (Placa),
CONSTRAINT FK_Cliente_cpf FOREIGN KEY (Cliente_cpf) REFERENCES Est_Cliente (CPF),
CONSTRAINT FK_Modelo FOREIGN KEY (Modelo) REFERENCES Est_Modelo (CodMod)
)

CREATE TABLE Est_Estaciona
(
codigo		INT,
patio_num	INT,
placa_veic	VARCHAR(8),
data_entr	DATETIME,
data_saida	DATETIME,
hora_entr	VARCHAR(10),
hora_saida	VARCHAR(10)
CONSTRAINT PK_codigo PRIMARY KEY (codigo),
CONSTRAINT FK_placa_veic FOREIGN KEY (placa_veic) REFERENCES Est_Veiculo (Placa),
CONSTRAINT FK_patio_num FOREIGN KEY (patio_num) REFERENCES Est_patio (Num)
)

-- b) Inserir 5 registros em cada tabela;
INSERT INTO Est_Cliente VALUES
('52936199858', 'João Sousa', '19971208'),
('44789314871', 'Tonh�o Sousa', '20030625'),
('38616792846', 'Erike Neves', '19700506'),
('54477895889', 'Ana Lucia', '19901005'),
('41763954005', 'João Abdala', '20040605');

INSERT INTO Est_Modelo VALUES
(1, 'Fiat Duo'),
(2, 'Opala Uno'),
(3, 'Vorskeglbegm'),
(4, 'Land Hover'),
(5, 'Porta Aviões da Shield');

INSERT INTO Est_Patio VALUES
(1, 'R Carlos Aires', 20),
(2, 'R da Goiaba', 13),
(3, 'R das flores', 3),
(4, 'Av Belmira Marim', 50),
(5, 'R União Popular', 23);

INSERT INTO Est_Veiculo VALUES
('JJJ-2020', '52936199858', 3, 'Azul-bebe', 2020),
('JEX-1010', '44789314871', 1, 'Verde', 2012),
('MBL-1717', '41763954005', 5, 'Preto', 2022),
('NFT-1337', '54477895889', 2, 'Vermelho', 2018),
('ABC-1234', '38616792846', 4, 'Marrom', 2015);

INSERT INTO Est_Estaciona VALUES
(1, 5, 'NFT-1337', '20220510', '20220512', '08:13', '21:24'),
(2, 4, 'MBL-1717', '20220417', '20220513', '17:05', '13:13'),
(3, 3, 'ABC-1234', '20211220', '20220126', '10:32', '19:24'),
(4, 2, 'JEX-1010', '20220415', '20220418', '23:59', '01:30'),
(5, 1, 'JJJ-2020', '20220508', '20220530', '10:24', '10:15');

-- c) Exiba a placa e o nome do dono de todos os veiculos;
SELECT Est_Veiculo.Placa, Est_Cliente.Nome FROM Est_Cliente
INNER JOIN Est_Veiculo ON Est_Veiculo.Cliente_cpf = Est_Cliente.CPF

-- d) Exiba o CPF e o nome do cliente que possui o veículo de placa JJJ-2020

SELECT Est_Cliente.CPF, Est_Cliente.Nome FROM
Est_Veiculo INNER JOIN Est_Cliente ON Est_Veiculo.Cliente_cpf = Est_Cliente.CPF
WHERE Est_Veiculo.Placa = 'JJJ-2020'

-- e) Exiba a placa e a cor do veículo que possui o código de estacionamento 1;
SELECT Est_Veiculo.Placa, Est_Veiculo.Cor FROM
Est_Veiculo INNER JOIN Est_Estaciona ON Est_Veiculo.Placa = Est_Estaciona.placa_veic
WHERE Est_Estaciona.codigo = 1

-- f) Exiba a placa e o ano do veículo que possui o código de estacionamento 1;
SELECT Placa, Ano FROM Est_Veiculo INNER JOIN Est_Estaciona ON Placa = placa_veic
WHERE codigo = 1

-- g) Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000;
SELECT Placa, Ano, Est_Modelo.Descr FROM Est_Veiculo
INNER JOIN Est_Modelo ON Modelo = CodMod WHERE Ano >= 2000

-- h) Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa "JEX-1010"
SELECT ender, data_entr, data_saida FROM Est_Estaciona
INNER JOIN Est_patio ON Num = patio_num WHERE placa_veic = 'JEX-1010'

-- i) Exiba a quantidade de vezes os veículos de cor verde estacionaram
SELECT COUNT(Cor) AS 'Quantidade de vezes os veículos de cor verde estacionaram'
FROM Est_Veiculo INNER JOIN Est_Estaciona ON placa_veic = Placa WHERE Cor = 'Verde'

-- j) Liste todos os clientes que possuem carro de modelo 1
SELECT Nome FROM Est_Cliente INNER JOIN Est_Veiculo ON Cliente_cpf = CPF
WHERE Modelo = 1

-- k) Liste as placas, os horários de entrada e saída dos veículos de cor verde;

SELECT Placa, hora_entr, hora_saida FROM Est_Estaciona INNER JOIN
Est_Veiculo ON placa_veic = Placa WHERE Cor = 'Verde'

-- l) Liste todos os estacionamentos do veículo de placa “JJJ-2020”
SELECT * FROM Est_Estaciona WHERE placa_veic = 'JJJ-2020'

-- m) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2
SELECT Nome FROM Est_Cliente INNER JOIN Est_Veiculo ON Cliente_cpf = CPF
INNER JOIN Est_Estaciona ON Placa = placa_veic WHERE codigo = 2

-- n) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3;

SELECT CPF FROM Est_Cliente INNER JOIN Est_Veiculo ON Cliente_cpf = CPF
INNER JOIN Est_Estaciona ON placa_veic = Placa WHERE codigo = 3

-- o) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2;

SELECT Descr FROM Est_Modelo INNER JOIN Est_Veiculo ON Modelo = CodMod
INNER JOIN Est_Estaciona ON placa_veic = Placa WHERE codigo = 2

-- p) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos;

SELECT Placa, Nome, Descr FROM Est_Cliente INNER JOIN Est_Veiculo
ON Cliente_cpf = CPF INNER JOIN Est_Modelo ON Modelo = CodMod

-- q) Selecionar todos os clientes com nome iniciado por 'João';
SELECT * FROM Est_Cliente WHERE Nome LIKE 'João%'

-- r) Selecionar as cores de veículos sem duplicidade;
SELECT DISTINCT Cor FROM Est_Veiculo

-- s) Quantos veículos com ano maior que 2020 temos no cadastro?
SELECT COUNT(*) AS 'Quantidade de veículos com o ano maior que 2020'
FROM Est_Veiculo WHERE Ano > 2020


