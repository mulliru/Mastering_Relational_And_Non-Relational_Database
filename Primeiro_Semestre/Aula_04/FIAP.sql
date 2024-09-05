-- Habilita a saída do servidor para que o DBMS_OUTPUT.PUT_LINE funcione
SET SERVEROUTPUT ON;

-- Seleciona todos os registros da tabela t_vendas
SELECT * FROM t_vendas;

-- Seleciona e traduz o campo dealsize para uma descrição legível
SELECT
    CASE
        WHEN dealsize = 'Small'  THEN
            'Pequeno Porte'
        WHEN dealsize = 'Medium' THEN
            'Médio Porte'
        WHEN dealsize = 'Large'  THEN
            'Grande Porte'
    END tamanhoempresa
FROM
    t_vendas;

-- Conta o número de registros agrupados por tamanho de empresa traduzido
SELECT
    COUNT(1) AS tamanhoempresa,
    CASE
        WHEN dealsize = 'Small'  THEN
            'Pequeno Porte'
        WHEN dealsize = 'Medium' THEN
            'Médio Porte'
        WHEN dealsize = 'Large'  THEN
            'Grande Porte'
    END AS tamanhoempresa
FROM
    t_vendas
GROUP BY
    CASE
        WHEN dealsize = 'Small'  THEN
            'Pequeno Porte'
        WHEN dealsize = 'Medium' THEN
            'Médio Porte'
        WHEN dealsize = 'Large'  THEN
            'Grande Porte'
    END;

-- Bloco PL/SQL para contar e exibir o número de empresas de 'Small'
DECLARE
    tamanho NUMBER; -- Variável para armazenar a contagem
    empresa VARCHAR2(30); -- Variável para armazenar a descrição
BEGIN
    -- Seleciona a contagem e a descrição das empresas de 'Small'
    SELECT
        COUNT(1) AS tamanhoempresa,
        CASE
            WHEN dealsize = 'Small'  THEN
                'Pequeno Porte'
            WHEN dealsize = 'Medium' THEN
                'Médio Porte'
            WHEN dealsize = 'Large'  THEN
                'Grande Porte'
        END AS tamanhoempresa
    INTO
        tamanho,
        empresa
    FROM
        t_vendas
    WHERE
        dealsize = 'Small'
    GROUP BY
        CASE
            WHEN dealsize = 'Small'  THEN
                'Pequeno Porte'
            WHEN dealsize = 'Medium' THEN
                'Médio Porte'
            WHEN dealsize = 'Large'  THEN
                'Grande Porte'
        END;

    -- Exibe a contagem no console
    DBMS_OUTPUT.PUT_LINE('Atualmente o banco de dados possui ' || tamanho || ' empresas de ' || LOWER(empresa));
END;

-- Criação da tabela alunos com os campos ra e nome
CREATE TABLE alunos (
    ra   NUMBER,
    nome VARCHAR2(50)
);

-- Inserção de registros na tabela alunos
INSERT INTO alunos VALUES (
    1,
    'Maria Souza'
);

INSERT INTO alunos VALUES (
    2,
    'João dos Santos'
);

INSERT INTO alunos VALUES (
    3,
    'José da Silva'
);

-- Confirma a inserção dos registros
COMMIT;

-- Seleciona todos os registros da tabela alunos
SELECT
    *
FROM
    alunos;

-- Bloco PL/SQL para inserir um novo aluno, com matrícula e nome fornecidos pelo usuário
DECLARE
    rm    NUMBER := &matricula; -- Matrícula do aluno
    aluno VARCHAR2(50) := '&Nome'; -- Nome do aluno
BEGIN
    -- Insere o novo aluno na tabela
    INSERT INTO alunos VALUES (
        rm,
        aluno
    );

    -- Confirma a inserção e exibe todos os registros da tabela alunos
    COMMIT;
    SELECT
        *
    FROM
        alunos;
END;

-- Bloco PL/SQL para atualizar o nome de um aluno com base na matrícula fornecida
DECLARE
    rm    NUMBER := &matricula; -- Matrícula do aluno
    aluno VARCHAR2(50) := '&Nome'; -- Novo nome do aluno
BEGIN
    -- Atualiza o nome do aluno na tabela
    UPDATE alunos
    SET
        nome = aluno
    WHERE
        ra = rm;

    -- Confirma a atualização e exibe todos os registros da tabela alunos
    COMMIT;
    SELECT
        *
    FROM
        alunos;
END;

-- Seleciona todos os registros da tabela alunos após a atualização
SELECT * FROM alunos;

-- Bloco PL/SQL para excluir um aluno com base na matrícula fornecida
DECLARE
    rm NUMBER := &Matricula; -- Matrícula do aluno a ser excluído
BEGIN
    -- Exclui o aluno da tabela
    DELETE FROM alunos WHERE ra = rm;
END;
/

-- Seleciona todos os registros da tabela alunos após a exclusão
SELECT * FROM alunos;

-- Bloco PL/SQL para exibir números de 1 a 20 usando um loop LOOP
DECLARE
    v_contador NUMBER(2) := 1; -- Variável contador
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_contador); -- Exibe o contador
        v_contador := v_contador + 1; -- Incrementa o contador
        EXIT WHEN v_contador > 20; -- Sai do loop quando o contador for maior que 20
    END LOOP;
END;

-- Bloco PL/SQL para exibir números de 1 a 20 usando um loop WHILE
DECLARE
    v_contador NUMBER(2) := 1; -- Variável contador
BEGIN
    WHILE v_contador < 20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_contador); -- Exibe o contador
        v_contador := v_contador + 1; -- Incrementa o contador
    END LOOP;
END;

-- Bloco PL/SQL para exibir números de 1 a 20 usando um loop FOR
DECLARE
BEGIN
    FOR v_contador IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_contador); -- Exibe o contador
    END LOOP;
END;

-- Bloco PL/SQL para exibir a tabuada de um número fornecido
DECLARE
    numero NUMBER := &Tabuada; -- Número para a tabuada
BEGIN
    FOR multiplicador IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(numero * multiplicador); -- Exibe o resultado da multiplicação
    END LOOP;
END;

-- Bloco PL/SQL para verificar se números de 1 a 10 são pares ou ímpares
DECLARE
BEGIN
    FOR numero IN 1..10 LOOP
        IF MOD(numero, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(numero || ' é par'); -- Exibe se o número é par
        ELSE
            DBMS_OUTPUT.PUT_LINE(numero || ' é ímpar'); -- Exibe se o número é ímpar
        END IF;
    END LOOP;
END;
