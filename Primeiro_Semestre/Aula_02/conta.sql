set SERVEROUTPUT on;
 
DECLARE

    v_salario number := 1412;

    v_porc number := 0.25;

BEGIN

    dbms_output.put_line((v_salario * v_porc)+ v_salario);

END;