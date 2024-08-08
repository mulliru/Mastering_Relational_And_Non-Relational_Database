-- Tabela de tipos de clientes
CREATE TABLE TP_Cliente (
    id_tp_cliente INT PRIMARY KEY,
    tipo_cl CHAR(2) CHECK (tipo_cl IN ('PF', 'PJ'))
);

-- Tabela de gêneros
CREATE TABLE Genero (
    id_genero INT PRIMARY KEY,
    genero_cl CHAR(3) CHECK (genero_cl IN ('FEM', 'MAS', 'NON'))
);

-- Tabela de clientes
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nm_cliente VARCHAR(100),
    dt_nascimento DATE,
    cpf VARCHAR(14) UNIQUE,
    tipo_cl CHAR(2) REFERENCES TP_Cliente(tipo_cl),
    genero_cl CHAR(3) REFERENCES Genero(genero_cl)
);

-- Tabela de bairros
CREATE TABLE bairro (
    id_bairro INT PRIMARY KEY,
    nm_bairro VARCHAR(100) UNIQUE
);

-- Tabela de cidades
CREATE TABLE cidade (
    id_cidade INT PRIMARY KEY,
    nome_cidade VARCHAR(100) NOT NULL
);

-- Tabela de estados
CREATE TABLE estado (
    id_estado INT PRIMARY KEY,
    nome_estado VARCHAR(100) NOT NULL,
    sigla CHAR(2) NOT NULL UNIQUE
);

-- Tabela de países
CREATE TABLE pais (
    id_pais INT PRIMARY KEY,
    nome_pais VARCHAR(100) NOT NULL
);

-- Tabela de endereços
CREATE TABLE Endereco (
    id_endereco INT PRIMARY KEY,
    CEP CHAR(9),
    logradouro VARCHAR(100),
    complemento VARCHAR(50),
    numero VARCHAR(10),
    nm_bairro INT REFERENCES bairro(id_bairro),
    id_cidade INT REFERENCES cidade(id_cidade),
    id_estado INT REFERENCES estado(id_estado),
    id_pais INT REFERENCES pais(id_pais)
);

-- Realizando as alterações nas tabelas
Alter table Cliente add constraint fk_tipo foreign key (id_tipo) references tipo_cliente(id),