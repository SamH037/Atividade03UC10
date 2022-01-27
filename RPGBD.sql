--DDL (criação de dados)
CREATE DATABASE RpgOnlineDB

USE RpgOnlineDB

CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR (100) UNIQUE NOT NULL,
	Senha VARCHAR (255) NOT NULL
)

CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) UNIQUE NOT NULL,
	Descricao VARCHAR (255)
)

CREATE TABLE Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR (15) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
)

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)

--DML (manipulação de dados)
INSERT INTO Usuarios VALUES ('Email@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição do Bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeuBug' , 1 , 1)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (1, 1) , (1, 2)

INSERT INTO Usuarios VALUES ('Email2@email2.com' , '123456')
INSERT INTO Classes VALUES ('Monge' , 'Descrição do Monge')
INSERT INTO Habilidades VALUES ('Recuperar vida')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('Bitbug' , 2 , 2)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (2, 2) , (2, 3)

--DQL (seleção e junção de dados em tabelas especificas)

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade


SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseId = Classes.ClasseId

SELECT P.NomePersonagem, C.Nome AS 'Classe', C.Descricao FROM Personagens AS P
INNER JOIN Classes AS C 
ON P.ClasseId = C.ClasseId

--DML Atividade03UC10
INSERT INTO Usuarios VALUES ('email3@email.com','123456')
INSERT INTO Classes VALUES ('Paladino','Descrição do Paladino')
INSERT INTO Habilidades VALUES ('Escudo Divino'),('Martelo Celestial')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('NoBug', 3, 3)

INSERT INTO Usuarios VALUES ('email1@email.com','123456')
INSERT INTO Classes VALUES ('Ladino','Descrição do Ladino')
INSERT INTO Habilidades VALUES ('Adaga Envenenada'),('Esconder nas Sombras')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('SameBug', 4, 6)

UPDATE  Usuarios
SET Senha = 654321
WHERE UsuarioId = 4


INSERT INTO Usuarios VALUES ('email4@email.com','123456')

DELETE FROM Usuarios WHERE UsuarioId = 5 

-- Criando e permitindo jogador, Atividade04UC10
CREATE LOGIN Jogador
WITH PASSWORD = '123456'

CREATE USER Jogador FOR LOGIN Jogador

GRANT SELECT TO Jogador 

SELECT * FROM Personagens