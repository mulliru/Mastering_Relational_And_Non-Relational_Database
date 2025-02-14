-- ============================
-- 1? Criação da Tabela de Auditoria (TB_AUDITORIA)
-- ============================
CREATE TABLE TB_AUDITORIA (
    id       NUMBER GENERATED ALWAYS AS IDENTITY,
    tabela   VARCHAR2(30),
    operacao VARCHAR2(30),
    data     DATE,
    usuario  VARCHAR2(30)
);

-- ============================
-- 2 Criação da Tabela PEDIDOS_NOVOS
-- ============================
CREATE TABLE PEDIDOS_NOVOS AS 
    SELECT * 
    FROM PEDIDO;

-- Adicionando a coluna STATUS à tabela
ALTER TABLE PEDIDOS_NOVOS 
    ADD STATUS VARCHAR2(30);

-- Consultando todos os pedidos
SELECT * 
FROM PEDIDOS_NOVOS;

-- ============================
-- 3 Trigger: Define STATUS como 'NOVO PEDIDO' ao inserir
-- ============================
CREATE OR REPLACE TRIGGER trg_pedido 
    BEFORE INSERT ON PEDIDOS_NOVOS
    FOR EACH ROW
BEGIN
    -- Atualiza o status do pedido para "Novo" após a inserção
    IF :NEW.STATUS IS NULL THEN
        :NEW.STATUS := 'NOVO PEDIDO';
    END IF;
END;
/

-- Consulta de um pedido específico
SELECT * 
FROM PEDIDOS_NOVOS 
WHERE COD_PEDIDO = 5000;

-- Inserção de um novo pedido
INSERT INTO PEDIDOS_NOVOS (cod_pedido, cod_cliente) 
VALUES (5000, 5555);

-- ============================
-- 4 Trigger de Auditoria: Registra operações em TB_AUDITORIA
-- ============================
CREATE OR REPLACE TRIGGER trg_auditoria
    AFTER INSERT OR UPDATE OR DELETE ON PEDIDOS_NOVOS
    FOR EACH ROW
DECLARE
    operacao     VARCHAR2(30);
    nome_usuario VARCHAR2(100);
BEGIN
    -- Determina a operação realizada (INSERT, UPDATE ou DELETE)
    IF INSERTING THEN
        operacao := 'INSERT';
    ELSIF UPDATING THEN
        operacao := 'UPDATE';
    ELSIF DELETING THEN
        operacao := 'DELETE';
    END IF;

    -- Obtém o nome de usuário da sessão atual
    nome_usuario := SYS_CONTEXT('USERENV', 'SESSION_USER');

    -- Registra a auditoria na tabela TB_AUDITORIA
    INSERT INTO TB_AUDITORIA (
        tabela, 
        operacao, 
        data, 
        usuario
    ) VALUES (
        'PEDIDOS_NOVOS', 
        operacao, 
        SYSDATE, 
        nome_usuario
    );
END;
/

-- ============================
-- 5 Consultando registros da TB_AUDITORIA
-- ============================
SELECT * 
FROM TB_AUDITORIA;

-- ============================
-- 6 Inserção Manual na Tabela TB_AUDITORIA (Teste)
-- ============================
INSERT INTO TB_AUDITORIA (
    tabela, 
    operacao, 
    data, 
    usuario
) VALUES (
    'TESTE', 
    'TESTE', 
    TO_DATE('07/02/2025','DD/MM/YYYY'), 
    'TESTE'
);

-- ============================
-- 7 Atualização (UPDATE) na Tabela TB_AUDITORIA
-- ============================
UPDATE TB_AUDITORIA
SET operacao = 'UPDATE TESTE'
WHERE tabela = 'TESTE';

-- ============================
-- 8 Exclusão (DELETE) na Tabela TB_AUDITORIA
-- ============================
DELETE FROM TB_AUDITORIA 
WHERE tabela = 'TESTE';
