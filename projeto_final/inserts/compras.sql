-- Inserting purchase data into COMPRA_TB

-- Inserting a purchase record for a passenger and ticket combination
INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        1,
        TO_DATE('15/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM pt WHERE pt.pk_localizador_passagem = 1) -- passagem REF
    )
);

-- Inserting another purchase record for a different passenger and ticket
INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        2,
        TO_DATE('20/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '98765432198'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM pt WHERE pt.pk_localizador_passagem = 2) -- passagem REF
    )
);

-- Inserting another purchase record for a different passenger and ticket
INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        3,
        TO_DATE('05/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '11122233344'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM pt WHERE pt.pk_localizador_passagem = 3) -- passagem REF
    )
);

SELECT C.DATA_COMPRA, DEREF(C.PASSAGEIROS).NOME,DEREF(C.PASSAGEIROS).PK_CPF FROM COMPRA_TB C;
