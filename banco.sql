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

INSERT INTO DadosInseridos (bairro, zona, cidade, dtInsercao)
VALUES
    ("Água Rasa", "Zona Leste", "São Paulo", CURDATE()),
    ("Alto de Pinheiros", "Zona Oeste", "São Paulo", CURDATE()),
    ("Americanópolis", "Zona Sul", "São Paulo", CURDATE()),
    ("Aricanduva", "Zona Leste", "São Paulo", CURDATE()),
    ("Artur Alvim", "Zona Leste", "São Paulo", CURDATE()),
    ("Bela Vista", "Centro", "São Paulo", CURDATE()),
    ("Belenzinho", "Zona Leste", "São Paulo", CURDATE()),
    ("Bom Retiro", "Centro", "São Paulo", CURDATE()),
    ("Brasilândia", "Zona Norte", "São Paulo", CURDATE()),
    ("Brás", "Centro", "São Paulo", CURDATE()),
    ("Cachoeirinha", "Zona Norte", "São Paulo", CURDATE()),
    ("Cambuci", "Zona Sul", "São Paulo", CURDATE()),
    ("Campo Belo", "Zona Sul", "São Paulo", CURDATE()),
    ("Campo Grande", "Zona Sul", "São Paulo", CURDATE()),
    ("Campo Limpo", "Zona Sul", "São Paulo", CURDATE()),
    ("Capão Redondo", "Zona Sul", "São Paulo", CURDATE()),
    ("Carrão", "Zona Leste", "São Paulo", CURDATE()),
    ("Casa Verde", "Zona Norte", "São Paulo", CURDATE()),
    ("Cerqueira César", "Centro", "São Paulo", CURDATE()),
    ("Cidade Dutra", "Zona Sul", "São Paulo", CURDATE()),
    ("Cidade Líder", "Zona Leste", "São Paulo", CURDATE()),
    ("Cidade Tiradentes", "Zona Leste", "São Paulo", CURDATE()),
    ("Consolação", "Centro", "São Paulo", CURDATE()),
    ("Cursino", "Zona Sul", "São Paulo", CURDATE()),
    ("Ermelino Matarazzo", "Zona Leste", "São Paulo", CURDATE()),
    ("Freguesia do Ó", "Zona Norte", "São Paulo", CURDATE()),
    ("Fazenda Cangaçu", "Zona Sul", "São Paulo", CURDATE()),
    ("Grajaú", "Zona Sul", "São Paulo", CURDATE()),
    ("Guaianases", "Zona Leste", "São Paulo", CURDATE()),
    ("Higienópolis", "Centro", "São Paulo", CURDATE()),
    ("Iguatemi", "Zona Sul", "São Paulo", CURDATE()),
    ("Indianópolis", "Zona Sul", "São Paulo", CURDATE()),
    ("Interlagos", "Zona Sul", "São Paulo", CURDATE()),
    ("Ipiranga", "Zona Sul", "São Paulo", CURDATE()),
    ("Itaim Bibi", "Zona Sul", "São Paulo", CURDATE()),
    ("Itaim Paulista", "Zona Leste", "São Paulo", CURDATE()),
    ("Itaquera", "Zona Leste", "São Paulo", CURDATE()),
    ("Jabaquara", "Zona Sul", "São Paulo", CURDATE()),
    ("Jaçanã", "Zona Norte", "São Paulo", CURDATE()),
    ("Jaraguá", "Zona Norte", "São Paulo", CURDATE()),
    ("Jardim Ângela", "Zona Sul", "São Paulo", CURDATE()),
    ("Jardim Capela", "Zona Sul", "São Paulo", CURDATE()),
    ("Jardim dos Estados", "Zona Oeste", "São Paulo", CURDATE()),
    ("Jardim Europa", "Zona Oeste", "São Paulo", CURDATE()),
    ("Jardim Guarani", "Zona Oeste", "São Paulo", CURDATE()),
    ("Jardim Helena", "Zona Leste", "São Paulo", CURDATE()),
    ("Jardim Paulista", "Zona Sul", "São Paulo", CURDATE()),
    ("Jardim São Luís", "Zona Oeste", "São Paulo", CURDATE()),
    ("José Bonifácio", "Zona Leste", "São Paulo", CURDATE()),
    ("Lajeado", "Zona Leste", "São Paulo", CURDATE()),
    ("Lapa", "Zona Oeste", "São Paulo", CURDATE()),
    ("Liberdade", "Centro", "São Paulo", CURDATE()),
    ("Limão", "Zona Norte", "São Paulo", CURDATE()),
    ("Luz", "Centro", "São Paulo", CURDATE()),
    ("M'Boi Mirim", "Zona Sul", "São Paulo", CURDATE()),
    ("Moema", "Zona Sul", "São Paulo", CURDATE()),
    ("Mooca", "Zona Leste", "São Paulo", CURDATE()),
    ("Morumbi", "Zona Oeste", "São Paulo", CURDATE()),
    ("Paraíso", "Zona Sul", "São Paulo", CURDATE()),
    ("Parelheiros", "Zona Sul", "São Paulo", CURDATE()),
    ("Pari", "Zona Leste", "São Paulo", CURDATE()),
    ("Parque São Jorge", "Zona Leste", "São Paulo", CURDATE()),
    ("Pedreira", "Zona Sul", "São Paulo", CURDATE()),
    ("Penha", "Zona Leste", "São Paulo", CURDATE()),
    ("Perdizes", "Zona Oeste", "São Paulo", CURDATE()),
    ("Pinheiros", "Zona Oeste", "São Paulo", CURDATE()),
    ("Ponte Rasa", "Zona Leste", "São Paulo", CURDATE()),
    ("Raposo Tavares", "Zona Oeste", "São Paulo", CURDATE()),
    ("República", "Centro", "São Paulo", CURDATE()),
    ("Sacomã", "Zona Sul", "São Paulo", CURDATE()),
    ("Santa Cecília", "Centro", "São Paulo", CURDATE()),
    ("Santana", "Zona Norte", "São Paulo", CURDATE()),
    ("Santo Amaro", "Zona Sul", "São Paulo", CURDATE()),
    ("São Francisco", "Zona Oeste", "São Paulo", CURDATE()),
    ("São Lucas", "Zona Leste", "São Paulo", CURDATE()),
    ("São Mateus", "Zona Leste", "São Paulo", CURDATE()),
    ("São Miguel", "Zona Leste", "São Paulo", CURDATE()),
    ("São Rafael", "Zona Leste", "São Paulo", CURDATE()),
    ("Sapopemba", "Zona Leste", "São Paulo", CURDATE()),
    ("Sé", "Centro", "São Paulo", CURDATE()),
    ("Socorro", "Zona Sul", "São Paulo", CURDATE()),
    ("Tatuapé", "Zona Leste", "São Paulo", CURDATE()),
    ("Terceira Divisão", "Zona Norte", "São Paulo", CURDATE()),
    ("Tucuruvi", "Zona Norte", "São Paulo", CURDATE()),
    ("Vila Andrade", "Zona Sul", "São Paulo", CURDATE()),
    ("Vila Curuçá", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Dionísia", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Esperança", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Fachini", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Formosa", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Guilherme", "Zona Norte", "São Paulo", CURDATE()),
    ("Vila Jacuí", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Leopoldina", "Zona Oeste", "São Paulo", CURDATE()),
    ("Vila Maria", "Zona Norte", "São Paulo", CURDATE()),
    ("Vila Mariana", "Zona Sul", "São Paulo", CURDATE()),
    ("Vila Matilde", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Medeiros", "Zona Norte", "São Paulo", CURDATE()),
    ("Vila Prudente", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Ré", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Regente Feijó", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila São Vicente", "Zona Leste", "São Paulo", CURDATE()),
    ("Vila Sônia", "Zona Sul", "São Paulo", CURDATE());

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
