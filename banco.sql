CREATE DATABASE vortex2;
USE vortex2;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj VARCHAR(45),
    cep VARCHAR(45),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    numero VARCHAR(45),
    senha VARCHAR(45)
);



CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    fkUsuario INT,
    fkGerente INT,
    fkEmpresa INT,
    FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkGerente) REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE DadosInseridos (
    id_DadosInseridos INT PRIMARY KEY AUTO_INCREMENT,
    bairro VARCHAR(100),
    zona VARCHAR(45),
    valorM2 DECIMAL(10,2),
    variacaoPrecoM2 DECIMAL(10,2),
    variacaoAnualPrecoM2 DECIMAL(10,2),
    variacaoMensalPrecoM2 DECIMAL(10,2),
    idh VARCHAR(45),
    densidadeDemografica FLOAT,
    dtInsercao DATE
);

CREATE TABLE Prompt (
    idPrompt INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(45),
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE ExecucaoPrompt (
    id_ExecucaoPrompt INT PRIMARY KEY AUTO_INCREMENT,
    resposta VARCHAR(45),
    dataHora VARCHAR(45),
    prompt_idPrompt INT,
    FOREIGN KEY (prompt_idPrompt) REFERENCES Prompt(idPrompt)
);

INSERT INTO Usuario (idUsuario, nome, email, senha) VALUES 
(default, 'João Silva', 'joao.silva@exemplo.com', 'senha123'),
(default, 'Maria Oliveira', 'maria.oliveira@exemplo.com', 'senha456');

INSERT INTO Empresa (idEmpresa, nome, cnpj, cep, cidade, bairro, numero, senha) VALUES 
(default, 'Tech Solutions', '12345678901234', '12345-678', 'São Paulo', 'Centro', '100', 'Tech@123'),
(default, 'InovaTech', '98765432109876', '87654-321', 'São Paulo', 'Jardins', '200', 'Inova@123');

INSERT INTO Funcionario (idFuncionario, cpf, cargo, fkUsuario, fkGerente, fkEmpresa) VALUES 
(1, '12345678900', 'Gerente', 1, NULL, 1),
(2, '98765432100', 'Analista', 2, 1, 1);

INSERT INTO Prompt (idPrompt, Descricao, fkEmpresa) VALUES 
(1, 'Análise mensal de vendas', 1),
(2, 'Relatório de crescimento', 2);

INSERT INTO ExecucaoPrompt (id_ExecucaoPrompt, resposta, dataHora, prompt_idPrompt) VALUES 
(1, 'Execução bem-sucedida', '2024-11-01 10:00:00', 1),
(2, 'Dados processados', '2024-11-02 15:30:00', 2);

INSERT INTO DadosInseridos (id_DadosInseridos, zona, bairro, cidade, valorM2, dtInsercao, idh, rendaPerCapita, densidadeDemografica) VALUES
(1, 'Zona Norte', 'A', 'SP', 7000.00, DATE_FORMAT(CURDATE(), '%Y-%m-%d'), '0.85', 3500.50, 1200.75),
(2, 'Zona Sul', 'B', 'SP',7200.00, DATE_FORMAT(CURDATE(), '%Y-%m-%d'), '0.88', 3700.60, 1300.80),
(3, 'Zona Leste', 'C', 'SP', 6800.00, DATE_FORMAT(CURDATE(), '%Y-%m-%d'), '0.80', 3200.75, 1100.55),

(6, 'Zona Leste', 'A', 'SP', 6950.00, DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d'), '0.85', 3400.00, 1190.50),
(7, 'Zona Leste', 'B', 'SP', 7100.00, DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d'), '0.88', 3500.00, 1210.25),
(8, 'Zona Leste', 'C', 'SP',  6700.00, DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d'), '0.80', 3100.50, 1130.30),
(9, 'Zona Sul', 'D', 'SP', 6500.00, DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d'), '0.75', 2950.75, 1080.45),
(10, 'Zona Norte', 'E', 'SP', 7400.00, DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d'), '0.90', 3600.80, 1255.40),

(11, 'Zona Leste', 'A', 'SP', 6900.00, DATE_FORMAT(CURDATE() - INTERVAL 2 MONTH, '%Y-%m-%d'), '0.85', 3300.50, 1180.75),
(12, 'Zona Leste', 'B', 'SP', 7050.00, DATE_FORMAT(CURDATE() - INTERVAL 2 MONTH, '%Y-%m-%d'), '0.88', 3450.90, 1215.60),
(13, 'Zona Sul', 'C', 'SP', 6600.00, DATE_FORMAT(CURDATE() - INTERVAL 2 MONTH, '%Y-%m-%d'), '0.80', 3150.00, 1105.30),
(14, 'Zona Sul', 'D', 'SP',  6400.00, DATE_FORMAT(CURDATE() - INTERVAL 2 MONTH, '%Y-%m-%d'), '0.75', 2900.25, 1070.90),
(15, 'Zona Norte', 'E', 'SP',  7300.00, DATE_FORMAT(CURDATE() - INTERVAL 2 MONTH, '%Y-%m-%d'), '0.90', 3550.75, 1240.20),

(16, 'Zona Leste', 'A', 'SP',6850.00, DATE_FORMAT(CURDATE() - INTERVAL 3 MONTH, '%Y-%m-%d'), '0.85', 3250.50, 1170.65),
(17, 'Zona Leste', 'B', 'SP',  7000.00, DATE_FORMAT(CURDATE() - INTERVAL 3 MONTH, '%Y-%m-%d'), '0.88', 3400.80, 1205.35),
(18, 'Zona Sul', 'C', 'SP',  6550.00, DATE_FORMAT(CURDATE() - INTERVAL 3 MONTH, '%Y-%m-%d'), '0.80', 3100.60, 1090.50),
(19, 'Zona Sul', 'D', 'SP',  6300.00, DATE_FORMAT(CURDATE() - INTERVAL 3 MONTH, '%Y-%m-%d'), '0.75', 2850.90, 1060.25),
(20, 'Zona Norte', 'E', 'SP', 7200.00, DATE_FORMAT(CURDATE() - INTERVAL 3 MONTH, '%Y-%m-%d'), '0.90', 3500.25, 1230.15),

(21, 'Zona Leste', 'A', 'SP',  6800.00, DATE_FORMAT(CURDATE() - INTERVAL 4 MONTH, '%Y-%m-%d'), '0.85', 3200.00, 1165.80),
(22, 'Zona Leste1', 'B', 'SP',  6950.00, DATE_FORMAT(CURDATE() - INTERVAL 4 MONTH, '%Y-%m-%d'), '0.88', 3350.20, 1195.40),
(23, 'Zona Sul', 'C', 'SP',  6500.00, DATE_FORMAT(CURDATE() - INTERVAL 4 MONTH, '%Y-%m-%d'), '0.80', 3050.75, 1085.20),
(24, 'Zona Sul', 'D', 'SP',  6200.00, DATE_FORMAT(CURDATE() - INTERVAL 4 MONTH, '%Y-%m-%d'), '0.75', 2800.40, 1055.00),
(25, 'Zona Norte', 'E', 'SP',  7100.00, DATE_FORMAT(CURDATE() - INTERVAL 4 MONTH, '%Y-%m-%d'), '0.90', 3450.60, 1220.70),

(26, 'Zona Leste', 'A', 'SP',  6750.00, DATE_FORMAT(CURDATE() - INTERVAL 5 MONTH, '%Y-%m-%d'), '0.85', 3150.00, 1155.35),
(27, 'Zona Leste', 'B', 'SP',  6900.00, DATE_FORMAT(CURDATE() - INTERVAL 5 MONTH, '%Y-%m-%d'), '0.88', 3300.50, 1185.50),
(28, 'Zona Sul', 'C', 'SP',  6450.00, DATE_FORMAT(CURDATE() - INTERVAL 5 MONTH, '%Y-%m-%d'), '0.80', 3000.30, 1075.40),
(29, 'Zona Sul', 'D', 'SP', 6150.00, DATE_FORMAT(CURDATE() - INTERVAL 5 MONTH, '%Y-%m-%d'), '0.75', 2750.75, 1045.90),
(30, 'Zona Norte', 'E', 'SP',7050.00, DATE_FORMAT(CURDATE() - INTERVAL 5 MONTH, '%Y-%m-%d'), '0.90', 3400.20, 1210.65),
(31, 'Zona Norte', 'A', 'SP',7050.00, DATE_FORMAT(CURDATE() - INTERVAL 12 MONTH, '%Y-%m-%d'), '0.90', 3400.20, 1210.65),
(32, 'Zona Sul', 'B', 'SP',7250.00, DATE_FORMAT(CURDATE() - INTERVAL 12 MONTH, '%Y-%m-%d'), '0.90', 3400.20, 1210.65);
