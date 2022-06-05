CREATE TABLE Cursos
(
Codcurso	INT,
Nome		VARCHAR(20)
CONSTRAINT PK_Codcurso PRIMARY KEY (Codcurso)
)

CREATE TABLE Disciplinas
(
Codisc		INT,
Nome		VARCHAR(20)
CONSTRAINT PK_Codisc PRIMARY KEY (Codisc)
)

CREATE TABLE Alunos
(
RM			INT,
Nome		VARCHAR(45),
Curso		INT,
Serie		INT,
Periodo		VARCHAR(20),
CONSTRAINT PK_RM PRIMARY KEY (RM),
CONSTRAINT FK_Curso FOREIGN KEY (Curso) REFERENCES Cursos (Codcurso)
)

CREATE TABLE Notas
(
RM			INT,
Discipl		INT,
Nota1		NUMERIC(10,2),
Nota2		NUMERIC(10,2),
CONSTRAINT FK_RM FOREIGN KEY (RM) REFERENCES Alunos (RM),
CONSTRAINT FK_Discipl FOREIGN KEY (Discipl) REFERENCES Disciplinas (Codisc),
)

--b)Inserir 5 registros em cada tabela.
	INSERT INTO Cursos VALUES 
	(1, 'Informática'),
	(2, 'Plástico'),
	(3, 'Design'),
	(4, 'Administração'),
	(5, 'DSM');

	INSERT INTO Disciplinas VALUES
	(1, 'Banco de Dados'),
	(2, 'Polímeros'),
	(3, 'Tipografia'),
	(4, 'Matemática'),
	(5, 'LPII');

	INSERT INTO Alunos VALUES
	(1, 'Amanda Silva', 3, 2, 'Manhã'),
	(2, 'Bruno Almeida', 1, 4, 'Noite'),
	(3, 'Caio Alves', 5, 3, 'Manhã'),
	(4, 'Daira Menezes', 2, 3, 'Tarde'),
	(5, 'Leonardo Guimarães', 4, 5, 'Noite');

	INSERT INTO Notas VALUES
	(4, 2, 9.0, 7.5),
	(5, 4, 9.0, 10.0);

	INSERT INTO Notas(RM, DISCIPL, NOTA1) VALUES
	(1, 3, 5.5),
	(2, 1, 6.0);

	INSERT INTO Notas(RM, DISCIPL, NOTA2) VALUES
	(3, 5, 9.0);

SELECT * FROM Cursos
SELECT * FROM Disciplinas
SELECT * FROM Notas
SELECT * FROM Alunos

-- c) Selecionar nome, período e série de todos os alunos do curso de Informática;
SELECT Alunos.Nome, Periodo, Serie FROM Alunos INNER JOIN Cursos ON
Codcurso = Curso WHERE Cursos.Nome = 'Informática'

-- d) Selecionar Nome do aluno, curso, nome da disciplina, nota1 e nota2, de todos os alunos.
SELECT Alunos.Nome, Curso, Disciplinas.Nome, Nota1, Nota2 FROM Alunos
INNER JOIN Notas ON Notas.RM = Alunos.RM INNER JOIN Disciplinas
ON Codisc = Discipl

-- e) Selecionar todas as notas do aluno (Seu nome);
SELECT Nota1, Nota2 FROM Notas INNER JOIN Alunos ON Notas.RM = Alunos.RM
WHERE Nome = 'Daira Menezes'

-- f) Selecionar RM, nome e curso de todos os alunos com nota1 superior a 8 na  disciplina Matem�tica;
SELECT Alunos.RM, Alunos.Nome, Alunos.Curso FROM Alunos INNER JOIN Notas
ON Notas.RM = Alunos.RM WHERE Discipl = 4 AND Nota1 > 8

-- g) Quantas notas (nota1) inferior a 6,0, em Banco de Dados, temos no Cadastro de Notas?
SELECT COUNT(*) AS 'Quantidade de notas menor que 6' FROM Notas
WHERE Discipl = 1 AND Nota1 < 6.0

-- h) Qual a média de Notas (Nota2) na disciplina LPII? 
SELECT AVG(Nota2) AS 'Média da NP2' FROM Notas WHERE
Discipl = 5

-- i) Quantos alunos temos no curso de Informática? 
SELECT COUNT(RM) AS 'Qntd. alunos no curso de inf.' FROM Alunos
WHERE Curso = 1

-- j) Quantos alunos temos no curso de Plástico?
SELECT COUNT(RM) AS 'Qntd. alunos no curso de Plástico.' FROM Alunos
WHERE Curso = 2

-- k) Selecionar todos os alunos que n�o possuem Nota1
SELECT Alunos.* FROM Alunos INNER JOIN Notas ON Notas.RM = Alunos.RM
WHERE Nota1 IS NULL

-- l) Selecionar todos os alunos que não possuem Nota2
SELECT Alunos.* FROM Alunos INNER JOIN Notas ON Notas.RM = Alunos.RM
WHERE Nota2 IS NULL

-- m) Selecionar todos os alunos que não possuem Nota1 em Matemática.
SELECT Alunos.* FROM Alunos INNER JOIN Notas ON Notas.RM = Alunos.RM
WHERE Discipl = 4 AND Nota1 IS NULL


