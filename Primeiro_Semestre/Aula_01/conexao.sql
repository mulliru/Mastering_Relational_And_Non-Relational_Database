-- Tabela de tipos de clientes
CREATE TABLE tp_cliente (
    id_tp_cliente INT PRIMARY KEY,
    tipo_cl CHAR(2) CHECK (tipo_cl IN ('PF', 'PJ'))
);

-- Tabela de gêneros
CREATE TABLE genero (
    id_genero INT PRIMARY KEY,
    genero_cl CHAR(3) CHECK (genero_cl IN ('FEM', 'MAS', 'NON'))
);

-- Tabela de clientes
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nm_cliente VARCHAR(100) NOT NULL,
    dt_nascimento DATE NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    id_tp_cliente INT REFERENCES tp_cliente(id_tp_cliente),
    id_genero INT REFERENCES genero(id_genero)
);

-- Tabela de bairros
CREATE TABLE bairro (
    id_bairro INT PRIMARY KEY,
    nm_bairro VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela de cidades
CREATE TABLE cidade (
    id_cidade INT PRIMARY KEY,
    nm_cidade VARCHAR(100) NOT NULL
);

-- Tabela de estados
CREATE TABLE estado (
    id_estado INT PRIMARY KEY,
    nm_estado VARCHAR(100) NOT NULL,
    sigla CHAR(2) NOT NULL UNIQUE
);

-- Tabela de países
CREATE TABLE pais (
    id_pais INT PRIMARY KEY,
    nm_pais VARCHAR(100) NOT NULL
);

-- Tabela de endereços
CREATE TABLE endereco (
    id_endereco INT PRIMARY KEY,
    cep VARCHAR(9),
    logradouro VARCHAR(100),
    complemento VARCHAR(50),
    numero VARCHAR(10),
    id_bairro INT REFERENCES bairro(id_bairro),
    id_cidade INT REFERENCES cidade(id_cidade),
    id_estado INT REFERENCES estado(id_estado),
    id_pais INT REFERENCES pais(id_pais)
);

-- Realizando Inserts 

--- Adicionando dados à tabela de tipos de clientes
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (1, 'PF');
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (2, 'PJ');
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (3, 'PF');
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (4, 'PJ');
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (5, 'PF');
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (6, 'PJ');
INSERT INTO tp_cliente (id_tp_cliente, tipo_cl) VALUES (7, 'PF');

-- Adicionando dados à tabela de gêneros
INSERT INTO genero (id_genero, genero_cl) VALUES (1, 'FEM');
INSERT INTO genero (id_genero, genero_cl) VALUES (2, 'MAS');
INSERT INTO genero (id_genero, genero_cl) VALUES (3, 'NON');
INSERT INTO genero (id_genero, genero_cl) VALUES (4, 'FEM');
INSERT INTO genero (id_genero, genero_cl) VALUES (5, 'MAS');
INSERT INTO genero (id_genero, genero_cl) VALUES (6, 'NON');
INSERT INTO genero (id_genero, genero_cl) VALUES (7, 'FEM');

-- Adicionando dados à tabela de clientes
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (1, 'Maria da Silva', '1990-01-01', '123.456.789-00', 1, 1);
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (2, 'João da Silva', '1985-05-12', '234.567.890-01', 2, 2);
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (3, 'Ana Pereira', '1978-11-23', '345.678.901-02', 3, 3);
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (4, 'Carlos Santos', '1982-09-15', '456.789.012-03', 4, 4);
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (5, 'Fernanda Lima', '1995-02-02', '567.890.123-04', 5, 5);
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (6, 'Roberto Souza', '1970-08-30', '678.901.234-05', 6, 6);
INSERT INTO cliente (id_cliente, nm_cliente, dt_nascimento, cpf, id_tp_cliente, id_genero) VALUES (7, 'Juliana Oliveira', '1988-12-20', '789.012.345-06', 7, 7);

-- Adicionando dados à tabela de bairros
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (1, 'Centro');
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (2, 'Jardim');
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (3, 'Bela Vista');
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (4, 'Vila Nova');
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (5, 'Alto da Lapa');
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (6, 'Moema');
INSERT INTO bairro (id_bairro, nm_bairro) VALUES (7, 'Pinheiros');

-- Adicionando dados à tabela de cidades
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (1, 'São Paulo');
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (2, 'Rio de Janeiro');
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (3, 'Belo Horizonte');
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (4, 'Porto Alegre');
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (5, 'Curitiba');
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (6, 'Recife');
INSERT INTO cidade (id_cidade, nm_cidade) VALUES (7, 'Salvador');

-- Adicionando dados à tabela de estados
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (1, 'São Paulo', 'SP');
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (2, 'Rio de Janeiro', 'RJ');
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (3, 'Minas Gerais', 'MG');
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (4, 'Rio Grande do Sul', 'RS');
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (5, 'Paraná', 'PR');
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (6, 'Pernambuco', 'PE');
INSERT INTO estado (id_estado, nm_estado, sigla) VALUES (7, 'Bahia', 'BA');

-- Adicionando dados à tabela de países
INSERT INTO pais (id_pais, nm_pais) VALUES (1, 'Brasil');
INSERT INTO pais (id_pais, nm_pais) VALUES (2, 'Argentina');
INSERT INTO pais (id_pais, nm_pais) VALUES (3, 'Uruguai');
INSERT INTO pais (id_pais, nm_pais) VALUES (4, 'Chile');
INSERT INTO pais (id_pais, nm_pais) VALUES (5, 'Paraguai');
INSERT INTO pais (id_pais, nm_pais) VALUES (6, 'Bolívia');
INSERT INTO pais (id_pais, nm_pais) VALUES (7, 'Peru');

-- Adicionando dados à tabela de endereços
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (1, '01001-000', 'Rua A', 'Apto 101', '123', 1, 1, 1, 1);
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (2, '20010-000', 'Rua B', '', '456', 2, 2, 2, 1);
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (3, '30130-000', 'Rua C', 'Casa 2', '789', 3, 3, 3, 1);
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (4, '90010-000', 'Av. D', '', '101', 4, 4, 4, 1);
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (5, '80010-000', 'Rua E', '', '202', 5, 5, 5, 1);
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (6, '50010-000', 'Av. F', 'Apto 303', '345', 6, 6, 6, 1);
INSERT INTO endereco (id_endereco, cep, logradouro, complemento, numero, id_bairro, id_cidade, id_estado, id_pais) VALUES (7, '40010-000', 'Rua G', '', '678', 7, 7, 7, 1);
