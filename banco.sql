CREATE DATABASE vortex2;
USE vortex2;

DROP DATABASE vortex2;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45)
);


CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY,
    nome VARCHAR(45),
    cnpj VARCHAR(45),
    cep VARCHAR(45),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    numero VARCHAR(45)
);


CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY,
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
    id_DadosInseridos INT PRIMARY KEY,
    zona VARCHAR(45),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    densidade VARCHAR(45),
    valorM2 VARCHAR(45),
    dtInsercao VARCHAR(45),
    idh VARCHAR(45),
    Funcionarios_idFuncionario INT,
    FOREIGN KEY (Funcionarios_idFuncionario) REFERENCES Funcionario(idFuncionario)
);


CREATE TABLE Prompt (
    idPrompt INT PRIMARY KEY,
    Descricao VARCHAR(45),
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE ExecucaoPrompt (
    id_ExecucaoPrompt INT PRIMARY KEY,
    resposta VARCHAR(45),
    dataHora VARCHAR(45),
    prompt_idPrompt INT,
    FOREIGN KEY (prompt_idPrompt) REFERENCES Prompt(idPrompt)
);
