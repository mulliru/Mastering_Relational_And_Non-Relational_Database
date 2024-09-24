-- Seleciona todos os registros da tabela alunos
select * from alunos;

-- Declaração de variáveis
declare
    ra number := 1;
    nome varchar2(30) := 'João Maria';
begin
    -- Insere um registro na tabela alunos
    insert into alunos values (ra, nome);
    commit;
end;

-- Criação de procedimento para inserir alunos
create procedure PRD_INSERT_ALUNOS(pRa alunos.ra%type, pNome alunos.nome%type) as
begin
    -- Insere um registro na tabela alunos
    insert into alunos values (pRa, pNome);
    commit;
end;

begin
    -- Chama o procedimento para inserir um aluno
    PRD_INSERT_ALUNOS(4, 'Rafael');
end;

-- Chama o procedimento para inserir alunos
call prd_insert_alunos(6, 'Gustavo');
exec prd_insert_alunos(8, 'Emerson');
execute prd_insert_alunos(9, 'Thais');

-- Seleciona todos os registros da tabela alunos ordenados por ra
select * from alunos order by ra;

-- Criação de procedimento para deletar alunos
create procedure PRD_DELETE_ALUNOS(pRa alunos.ra%type) as
begin
    -- Deleta um registro da tabela alunos
    delete from alunos where ra = pRa;
    commit;
end;

-- Chama o procedimento para deletar um aluno
call prd_delete_alunos(9);

-- Seleciona todos os registros da tabela alunos ordenados por ra
select * from alunos order by ra;

-- Criação de procedimento para atualizar alunos
create procedure PRD_UPDATE_ALUNOS(pRa alunos.ra%type, pNome alunos.nome%type) as
begin
    -- Atualiza um registro na tabela alunos
    update alunos set nome = pNome where ra = pRa;
    commit;
end;

-- Chama o procedimento para atualizar um aluno
call prd_update_alunos(8, 'Emerson Faustino');

-- Seleciona todos os registros da tabela endereco_cliente
select * from endereco_cliente;

-- Seleciona o maior valor da sequência seq_endereco_cliente
select max(seq_endereco_cliente) from endereco_cliente;

-- Criação de sequência para endereco_cliente
create sequence seq_endereco_cliente start with 402;

-- Seleciona todos os registros da tabela cliente
select * from cliente;

-- Seleciona todos os registros da tabela cidade
select * from cidade;

-- Insere um registro na tabela endereco_cliente
INSERT INTO endereco_cliente (
    seq_endereco_cliente,
    cod_tipo_endereco,
    cod_cliente,
    des_endereco,
    num_endereco,
    des_complemento,
    num_cep,
    des_bairro,
    cod_cidade,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    seq_endereco_cliente.nextval,
    2,
    57,
    'Avenida Dom Pedro I',
    161,
    'Casa',
    09991000,
    'Conceição',
    231,
    'S',
    sysdate,
    null
);

-- Criação de procedimento para inserir endereco_cliente
CREATE PROCEDURE prd_insert_endereco (
    pcodend     endereco_cliente.cod_tipo_endereco%TYPE,
    pcodcliente endereco_cliente.cod_cliente%TYPE,
    pdesend     endereco_cliente.des_endereco%TYPE,
    pnumend     endereco_cliente.num_endereco%TYPE,
    pdescompl   endereco_cliente.des_complemento%TYPE,
    pcep        endereco_cliente.num_cep%TYPE,
    pbairro     endereco_cliente.des_bairro%TYPE,
    pcodcid     endereco_cliente.cod_cidade%TYPE,
    pstatus     endereco_cliente.sta_ativo%TYPE,
    psdatacad   endereco_cliente.dat_cadastro%TYPE,
    psdatacanc  endereco_cliente.dat_cancelamento%TYPE
) AS
BEGIN
    -- Insere um registro na tabela endereco_cliente
    INSERT INTO endereco_cliente VALUES (
        seq_endereco_cliente.nextval,
        pcodend,
        pcodcliente,
        pdesend,
        pnumend,
        pdescompl,
        pcep,
        pbairro,
        pcodcid,
        pstatus,
        psdatacad,
        psdatacanc
    );
    COMMIT;
END;

-- Criação de procedimento para atualizar endereco_cliente
CREATE PROCEDURE prd_update_endereco (
    pcodend     endereco_cliente.cod_tipo_endereco%TYPE,
    pcodcliente endereco_cliente.cod_cliente%TYPE,
    pdesend     endereco_cliente.des_endereco%TYPE,
    pnumend     endereco_cliente.num_endereco%TYPE,
    pdescompl   endereco_cliente.des_complemento%TYPE,
    pcep        endereco_cliente.num_cep%TYPE,
    pbairro     endereco_cliente.des_bairro%TYPE,
    pcodcid     endereco_cliente.cod_cidade%TYPE,
    pstatus     endereco_cliente.sta_ativo%TYPE,
    psdatacad   endereco_cliente.dat_cadastro%TYPE,
    psdatacanc  endereco_cliente.dat_cancelamento%TYPE
) AS
BEGIN
    -- Atualiza um registro na tabela endereco_cliente
    update endereco_cliente set
        cod_tipo_endereco = pcodend,
        cod_cliente = pcodcliente,
        des_endereco = pdesend,
        num_endereco = pnumend,
        des_complemento = pdescompl,
        num_cep = pcep,
        des_bairro = pbairro,
        cod_cidade = pcodcid,
        sta_ativo = pstatus,
        dat_cadastro = psdatacad,
        dat_cancelamento = psdatacanc
    where cod_cliente = pcodcliente;
    COMMIT;
END;