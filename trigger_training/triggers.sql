CREATE OR REPLACE TRIGGER SABER_VOO
BEFORE UPDATE ON PASSAGEM
FOR EACH ROW
DECLARE
BEGIN

	DBMS_OUTPUT.PUT_LINE('PASSAGEM = '||:OLD.PK_LOCALIZADOR_PASSAGEM||' ALTERADA');

END CONTAR_PASSAGEIROS_VOO;

UPDATE PASSAGEM SET VALOR_PASSAGEM = 412.89 WHERE PK_LOCALIZADOR_PASSAGEM = 1;

CREATE OR REPLACE TRIGGER DADO_INSERIDO_PASSAGEIRO
AFTER INSERT ON PASSAGEIRO_TB
FOR EACH ROW
BEGIN
    IF :NEW.SEXO = 'M' THEN 
    	DBMS_OUTPUT.PUT_LINE('SR. '||:NEW.NOME||' INSERIDO '||' CPF: '||:NEW.PK_CPF);
    ELSIF :NEW.SEXO = 'F' THEN
        DBMS_OUTPUT.PUT_LINE('SR. '||:NEW.NOME||' INSERIDO '||' CPF: '||:NEW.PK_CPF);
    END IF;
END DADO_INSERIDO_PASSAGEIRO;
/

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER WHATS_UPDATED_PASSAGEIRO
BEFORE DELETE ON PASSAGEIRO_TB
FOR EACH ROW
BEGIN
	DBMS_OUTPUT.PUT_LINE('PASSAGEIRO DE CPF ' || :OLD.PK_CPF || ' DELETADO');
END WHATS_UPDATED_PASSAGEIRO;
/

DELETE FROM PASSAGEIRO_TB WHERE PK_CPF = '98765432198';

CREATE OR REPLACE TRIGGER UPDATED_PASSAGEIRO
BEFORE UPDATE ON PASSAGEIRO_TB
FOR EACH ROW
DECLARE
    V_IDADE NUMBER;
    ACOMPANHAMENTO_V VARCHAR2(3);
BEGIN
    V_IDADE := CALCULAR_IDADE_TRIGGER(:OLD.DATA_NASCIMENTO);
	IF V_IDADE <18 THEN
        ACOMPANHAMENTO_V := 'SIM';
	    DBMS_OUTPUT.PUT_LINE('ATUALIZACAO EM MENOR IDADE QUE ACOMPANHAMENTO ESPECIAL = '||ACOMPANHAMENTO_V);
	ELSE
        DBMS_OUTPUT.PUT_LINE('ATUALIZACAO EM MAIOR DE IDADE');
	END IF;
	DBMS_OUTPUT.PUT_LINE('VALOR ANTIGO:');
	DBMS_OUTPUT.PUT_LINE(:OLD.NOME||' '||:OLD.PK_CPF||' '||:OLD.DATA_NASCIMENTO||' '||:OLD.PK_CPF);
	DBMS_OUTPUT.PUT_LINE(:NEW.NOME||' '||:NEW.PK_CPF||' '||:NEW.DATA_NASCIMENTO||' '||:NEW.PK_CPF);
END UPDATED_PASSAGEIRO;

UPDATE PASSAGEIRO_TB P SET P.NOME = 'Savio Marcos' WHERE P.PK_CPF = '99988877766';