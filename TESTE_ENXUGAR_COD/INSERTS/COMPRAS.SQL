
INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        1,
        TO_DATE('15/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 1) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        2,
        TO_DATE('20/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 2) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        3,
        TO_DATE('18/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '11122233344'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 3) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        4,
        TO_DATE('01/04/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '55566677788'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 4) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        5,
        TO_DATE('30/04/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '99988877766'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 5) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        6,
        TO_DATE('02/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '77788899911'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 6) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        7,
        TO_DATE('01/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '44455566677'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 7) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        8,
        TO_DATE('07/04/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '33322211100'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 8) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        9,
        TO_DATE('01/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '88877766655'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 9) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        10,
        TO_DATE('23/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '22233344455'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 10) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        11,
        TO_DATE('05/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '99911122233'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 11) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        12,
        TO_DATE('05/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '77788899900'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 12) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        13,
        TO_DATE('09/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '55544433322'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 13) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        14,
        TO_DATE('29/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '66677788899'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 14) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        15,
        TO_DATE('23/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '33322211144'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 15) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        16,
        TO_DATE('12/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '99913122233'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 16) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        17,
        TO_DATE('06/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '77783899900'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 17) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        18,
        TO_DATE('20/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '55543433322'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 18) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        19,
        TO_DATE('05/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '66677388899'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 19) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        20,
        TO_DATE('23/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '33322311144'), -- passageiros REF
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 20) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        21,
        TO_DATE('23/02/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 21),
    (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 22),
    (SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 23),-- PASSAGEM_TB REF
    )
);


SELECT C.DATA_COMPRA, DEREF(C.PASSAGEIROS).NOME,DEREF(C.PASSAGEIROS).PK_CPF FROM COMPRA_TB C;
