set SERVEROUTPUT on;

declare
    v_nome varchar2 (30);
    v_idade number := 19;
begin
    v_nome := 'Murillo';
    dbms_output.put_line(' Nome: ' || v_nome || ' idade: ' ||v_idade);
end;