CREATE DATABASE BACKUP_TESTE_HROADS

USE BACKUP_TESTE_HROADS;

----------------------------------------------------------------------------------------------------------------------
drop database BACKUP_TESTE_HROADS



CREATE TABLE TIPO_HABILIDADE(
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(250) NOT NULL UNIQUE
)

CREATE TABLE HABILIDADES(
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(255) NOT NULL UNIQUE 
	,ID_TIPO_HABILIDADE INT FOREIGN KEY REFERENCES TIPO_HABILIDADE(ID)
)

CREATE TABLE CLASSES(
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(255) NOT NULL UNIQUE
)

CREATE TABLE PERSONAGENS(
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(255) NOT NULL UNIQUE
	,CAPACIDADE_MAXIMA_VIDA INT NOT NULL
	,CAPACIDADE_MAXIMA_MANA INT NOT NULL
	,DATA_DE_ATUALIZACAO DATETIME NOT NULL
	,DATA_DE_CRIACAO DATETIME NOT NULL
)


CREATE TABLE CLASSE_HABILIDADE(
	ID_CLASSE INT FOREIGN KEY REFERENCES CLASSES(ID) NOT NULL
	,ID_HABILIDADE INT FOREIGN KEY REFERENCES HABILIDADES(ID)
)



-----------------------------------------------------------------------------------------------------------------------



ALTER TABLE PERSONAGENS
ADD ID_CLASSE INT FOREIGN KEY REFERENCES CLASSES(ID)

INSERT INTO TIPO_HABILIDADE(NOME)
VALUES ('Ataque'), ('Defesa'), ('Magia')

INSERT INTO TIPO_HABILIDADE(NOME)
VALUES ('Cura')

INSERT INTO HABILIDADES(NOME,ID_TIPO_HABILIDADE)
VALUES ('Lan�a Mortal', '1'),('Escudo Supremo', '2'),('Recuperar vida', '4')

INSERT INTO CLASSES(NOME)
VALUES ('B�rbaro'),('Cruzado'),('Ca�adora'),('Monge'),('Necromante'),('Feiticeiro'),('Arcanista')

INSERT INTO PERSONAGENS(NOME, CAPACIDADE_MAXIMA_VIDA, CAPACIDADE_MAXIMA_MANA, DATA_DE_ATUALIZACAO, DATA_DE_CRIACAO, ID_CLASSE)
VALUES ('DeuBug', '100', '80', GETDATE(), '18/01/2019', 1),('BitBug', '70', '100', GETDATE(), '17/03/2019', 4),('Fer8', '75', '60', GETDATE(), '18/03/2019', 7)

INSERT INTO CLASSE_HABILIDADE(ID_CLASSE, ID_HABILIDADE)
VALUES (1, 1), (1, 2), (2, 2), (3, 1), (4, 3), (4, 2), (6, 3)



----------------------------------------------------------------------------------------------------------------------



USE ;

BACKUP DATABASE BACKUP_TESTE_HROADS -- Seleciona o banco de dados que ira ser feito o backup

TO DISK = 'C:\Backup_teste_hroads\BDteste.BAK' -- Informa o local que ficara armazenado o backup

-- outras op��es opcional
		WITH FORMAT,
		MEDIANAME = 'SENAI_HROADS_TARDE',
		NAME = 'Full Backup of SENAI_HROADS_TARDE'