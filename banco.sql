


USE vortex;


CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE Cargo (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    cargo VARCHAR(45) NOT NULL
);

CREATE TABLE Funcionario (
    cpf INT PRIMARY KEY,
    nomeCompleto VARCHAR(45) NOT NULL,
    Usuario_idUsuario INT,
    Cargo_idCargo INT,
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (Cargo_idCargo) REFERENCES Cargo(idCargo)
);


CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    cnpj CHAR(18) NOT NULL,
    endereco VARCHAR(45),
    Funcionario_cpf INT,
    FOREIGN KEY (Funcionario_cpf) REFERENCES Funcionario(cpf)
);



CREATE TABLE Custo (
    idCusto INT PRIMARY KEY AUTO_INCREMENT,
    custo_por_m2 DECIMAL(10, 2),
    variacao_custo_medio DECIMAL(10, 2),
    variacao_anual DECIMAL(10, 2),
    variacao_mensal DECIMAL(10, 2)
);

CREATE TABLE Localidade (
    idlocalidade INT PRIMARY KEY AUTO_INCREMENT,
    zona VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    Custo_idCusto INT,
    FOREIGN KEY (Custo_idCusto) REFERENCES Custo(idCusto)
);






CREATE TABLE Simulacao (
    idSimulacao INT PRIMARY KEY AUTO_INCREMENT,
    data_da_simulacao DATE NOT NULL,
    Usuario_idUsuario INT,
    localidade_idlocalidade INT,
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (localidade_idlocalidade) REFERENCES Localidade(idlocalidade)
);





