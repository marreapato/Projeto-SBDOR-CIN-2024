CREATE OR REPLACE FUNCTION calcular_idade_trigger(data_nascimento PASSAGEIRO_TB.DATA_NASCIMENTO%TYPE) RETURN NUMBER IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12);
END calcular_idade_trigger;
