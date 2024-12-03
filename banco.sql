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
    zona   VARCHAR(45),
    cidade VARCHAR(45),
    valorM2 FLOAT,
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

INSERT INTO DadosInseridos (cidade) 
VALUES ('São Paulo');


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

ALTER TABLE Usuario 
ADD COLUMN fkEmpresa INT,
ADD CONSTRAINT fk_usuario_empresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa);
