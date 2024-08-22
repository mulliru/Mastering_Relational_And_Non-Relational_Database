SET SERVEROUTPUT ON;

DECLARE
    -- O valor do carro fornecido pelo usu�rio
    carro_valor NUMBER := &ValordoCarro;

    -- Calcula o valor da entrada como 20% do valor do carro
    entrada NUMBER := carro_valor * 0.20;

    -- O n�mero de parcelas fornecido pelo usu�rio
    parcelas NUMBER := &parcelas;

    -- Calcula o valor de cada parcela com base no valor financiado
    parcela_valor NUMBER;
    
BEGIN
    -- Calcula o valor de cada parcela (assumindo uma taxa de 10% de juros)
    parcela_valor := ((carro_valor - entrada) * 1.10) / parcelas;

    -- Exibe o valor de cada parcela
    dbms_output.put_line('O valor de cada parcela ser�: R$ ' || TO_CHAR(parcela_valor, '999.99'));

    -- Exibe o valor da entrada
    dbms_output.put_line('Valor da entrada: R$ ' || TO_CHAR(entrada, '999.99'));

    -- Exibe o valor de cada parcela e o n�mero de parcelas
    dbms_output.put_line('Valor de cada parcela em '
                         || parcelas
                         || ' vezes � R$ '
                         || TO_CHAR(parcela_valor, '999.99'));

    -- Exibe o valor total do carro financiado, incluindo os juros
    dbms_output.put_line('Valor total do carro financiado � R$ '
                         || TO_CHAR(((carro_valor - entrada) * 1.10) + entrada, '999.99'));

END;
