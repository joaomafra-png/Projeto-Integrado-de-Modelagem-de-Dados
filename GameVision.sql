/* ==========================================================
   PROJETO INTEGRADO: GAMEVISION ANALYTICS
   SCRIPT COMPLETO - MYSQL WORKBENCH
   ========================================================== */

-- 1. CONFIGURAÇÃO DO BANCO DE DADOS
-- Apaga o banco se já existir para começar limpo
DROP DATABASE IF EXISTS GameVision;
CREATE DATABASE GameVision;
USE GameVision;

-- 2. CRIAÇÃO DAS TABELAS (DDL)

-- Tabela: Gêneros
CREATE TABLE Genero (
    ID_Genero INT PRIMARY KEY,
    Descricao VARCHAR(50)
);

-- Tabela: Plataformas
CREATE TABLE Plataforma (
    ID_Plataforma INT PRIMARY KEY,
    Nome_Console VARCHAR(50)
);

-- Tabela: Clientes
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome_Completo VARCHAR(100),
    Pais_Origem VARCHAR(50)
);

-- Tabela: Jogos (Liga com Gênero)
CREATE TABLE Jogo (
    ID_Jogo INT PRIMARY KEY,
    Titulo_Game VARCHAR(100),
    Preco DECIMAL(10, 2),
    ID_Genero INT,
    FOREIGN KEY (ID_Genero) REFERENCES Genero(ID_Genero)
);

-- Tabela: Vendas (Liga com tudo)
CREATE TABLE Vendas (
    ID_Venda INT PRIMARY KEY,
    Data_Venda DATE,
    ID_Cliente INT,
    ID_Jogo INT,
    ID_Plataforma INT,
    Quantidade INT,
    Valor_Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Jogo) REFERENCES Jogo(ID_Jogo),
    FOREIGN KEY (ID_Plataforma) REFERENCES Plataforma(ID_Plataforma)
);

-- 3. INSERÇÃO DE DADOS (DML)

-- Gêneros
INSERT INTO Genero VALUES (1, 'RPG'), (2, 'FPS'), (3, 'Esporte'), (4, 'Terror'), (5, 'Estratégia');

-- Plataformas
INSERT INTO Plataforma VALUES (1, 'PC'), (2, 'PlayStation 5'), (3, 'Xbox Series X'), (4, 'Nintendo Switch');

-- Clientes
INSERT INTO Cliente VALUES 
(1, 'Lucas Silva', 'Brasil'),
(2, 'Maria Oliveira', 'Portugal'),
(3, 'John Smith', 'EUA'),
(4, 'Yuki Tanaka', 'Japão'),
(5, 'Ana Souza', 'Brasil');

-- Jogos (Nomes Criativos)
INSERT INTO Jogo VALUES 
(101, 'Crônicas de Aetheria', 250.00, 1),
(102, 'Operação Tempestade', 300.00, 2),
(103, 'Super Liga Gol 2025', 350.00, 3),
(104, 'Hotel dos Pesadelos', 120.00, 4),
(105, 'Império Galáctico X', 180.00, 5),
(106, 'Aventura do Robô Bob', 299.00, 2),
(107, 'Lenda do Samurai Azul', 280.00, 1);

-- Vendas (20 Registros)
INSERT INTO Vendas VALUES 
(1, '2025-01-05', 1, 101, 1, 1, 250.00),
(2, '2025-01-08', 2, 103, 2, 1, 350.00),
(3, '2025-01-12', 3, 102, 3, 1, 300.00),
(4, '2025-01-15', 1, 104, 1, 2, 240.00),
(5, '2025-01-20', 4, 106, 4, 1, 299.00),
(6, '2025-02-02', 5, 101, 2, 1, 250.00),
(7, '2025-02-05', 2, 105, 1, 1, 180.00),
(8, '2025-02-10', 3, 103, 3, 1, 350.00),
(9, '2025-02-14', 1, 107, 2, 1, 280.00),
(10, '2025-02-18', 4, 101, 1, 1, 250.00),
(11, '2025-02-22', 5, 102, 2, 1, 300.00),
(12, '2025-03-01', 1, 103, 1, 1, 350.00),
(13, '2025-03-03', 2, 106, 4, 1, 299.00),
(14, '2025-03-05', 3, 104, 1, 3, 360.00),
(15, '2025-03-10', 4, 107, 2, 1, 280.00),
(16, '2025-03-12', 5, 101, 3, 1, 250.00),
(17, '2025-03-15', 1, 105, 1, 1, 180.00),
(18, '2025-03-18', 2, 102, 2, 1, 300.00),
(19, '2025-03-20', 3, 101, 1, 1, 250.00),
(20, '2025-03-25', 4, 103, 2, 1, 350.00);

-- 4. RELATÓRIO DE CONFERÊNCIA (Isso mostra os nomes na tela)
SELECT 
    v.Data_Venda,
    c.Nome_Completo AS Cliente,
    j.Titulo_Game AS Jogo,
    p.Nome_Console AS Plataforma,
    v.Valor_Total
FROM Vendas v
JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente
JOIN Jogo j ON v.ID_Jogo = j.ID_Jogo
JOIN Plataforma p ON v.ID_Plataforma = p.ID_Plataforma
ORDER BY v.Data_Venda;genero