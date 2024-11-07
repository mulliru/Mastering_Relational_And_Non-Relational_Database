/*
Quest�o 3: Procedure para Atualizar Pre�o de Produtos para um Estado com Controle de Erros
Descri��o: Crie uma procedure chamada atualizar_preco_estado que aumenta o pre�o dos produtos comprados por clientes de um estado espec�fico. Se o estado n�o tiver clientes, lance uma exce��o. Utilize um WHILE para iterar sobre os produtos e um IF para verificar se o produto est� ativo.
Requisitos:
�	Exce��o: Lance uma exce��o caso o estado n�o tenha clientes.
�	JOIN: Use INNER JOIN entre cliente e produto.
�	WHILE: Utilize WHILE para iterar sobre os produtos.
�	IF: Verifique se o produto est� ativo antes de aplicar o ajuste.

- Lari
*/
CREATE OR REPLACE PROCEDURE atualizar_preco_produto_estado (
    p_cod_estado IN VARCHAR2,
    aumento_percentual IN NUMBER
) IS
    -- Vari�veis para armazenar dados dos produtos
    v_produto_id NUMBER;
    v_preco_atual NUMBER;
    v_ativo CHAR(1);
    
    -- Vari�vel para controlar a itera��o dos produtos
    v_produto_encontrado BOOLEAN := TRUE;
    
    -- Vari�vel para contar se houve consumidores ou n�o
    v_consumidores INTEGER := 0;

BEGIN
    -- Inicializa o v_produto_id com o primeiro produto v�lido (menor id)
    SELECT MIN(p.id)
    INTO v_produto_id
    FROM produto p
    INNER JOIN compra cp ON p.id = cp.produto_id
    INNER JOIN cliente cl ON cl.id = cp.cliente_id
    INNER JOIN Endereco_Cliente ec ON ec.cod_cliente = cl.id
    INNER JOIN Cidade c ON c.cod_cidade = ec.cod_cidade
    INNER JOIN Estado e ON e.cod_estado = c.cod_estado
    WHERE e.nome_estado = p_cod_estado
    AND p.ativo = 'S';

    -- Verificar se existem produtos para atualizar
    IF v_produto_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'N�o h� produtos ativos comprados neste estado.');
    END IF;

    -- Loop para iterar sobre os produtos
    WHILE v_produto_encontrado LOOP
        BEGIN
            -- Buscar o pr�ximo produto ap�s v_produto_id
            SELECT p.id, p.preco, p.ativo
            INTO v_produto_id, v_preco_atual, v_ativo
            FROM produto p
            INNER JOIN compra cp ON p.id = cp.produto_id
            INNER JOIN cliente cl ON cl.id = cp.cliente_id
            INNER JOIN Endereco_Cliente ec ON ec.cod_cliente = cl.id
            INNER JOIN Cidade c ON c.cod_cidade = ec.cod_cidade
            INNER JOIN Estado e ON e.cod_estado = c.cod_estado
            WHERE e.nome_estado = p_cod_estado
            AND p.ativo = 'S'
            AND p.id > v_produto_id -- Buscar o pr�ximo produto com id maior
            ORDER BY p.id
            -- Aqui estamos apenas fazendo a consulta para o pr�ximo produto ativo.

            -- Verificar se o produto est� ativo
            IF v_ativo = 'S' THEN
                -- Atualizar o pre�o do produto
                UPDATE produto
                SET preco = v_preco_atual + (v_preco_atual * aumento_percentual / 100)
                WHERE id = v_produto_id;
                
                -- Incrementar o contador de consumidores
                v_consumidores := v_consumidores + 1;
            END IF;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Caso n�o encontre mais produtos, sai do loop
                v_produto_encontrado := FALSE;
        END;
    END LOOP;

    -- Se n�o houver consumidores no estado, lan�ar exce��o
    IF v_consumidores = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'N�o h� consumidores para os produtos no estado especificado.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Pre�os dos produtos no estado ' || p_cod_estado || ' foram atualizados com sucesso.');

EXCEPTION
    WHEN OTHERS THEN
        -- Caso ocorra qualquer erro, fazer rollback e lan�ar exce��o
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Erro ao atualizar os pre�os dos produtos: ' || SQLERRM);
END atualizar_preco_produto_estado;


