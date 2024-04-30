
INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        1,
        TO_DATE('15/02/2024', 'DD/MM/YYYY'), -- data_compra
        TP_NT_REF_RELAC(TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 1)),
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 2)),
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 3)),
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 4)),
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 5))
    
    ) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        2,
        TO_DATE('20/01/2024', 'DD/MM/YYYY'), -- data_compra
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 6)))) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        3,
        TO_DATE('18/01/2024', 'DD/MM/YYYY'), 
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 7))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 8))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 9)))) -- PASSAGEM_TB REF
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        4,
        TO_DATE('01/04/2024', 'DD/MM/YYYY'),
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 10))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 11))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 12))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 13))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 14))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 15)))
    ) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        5,
        TO_DATE('30/04/2024', 'DD/MM/YYYY'),
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 16)))
    )
);

INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        6,
        TO_DATE('02/02/2024', 'DD/MM/YYYY'), 
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 7))),
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 18)))) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        7,
        TO_DATE('01/01/2024', 'DD/MM/YYYY'), 
        TP_NT_REF_RELAC(
    TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 17))))- PASSAGEM_TB REF
    )
);



INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        8,
        TO_DATE('01/01/2024', 'DD/MM/YYYY'), 
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 18)))) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        9,
        TO_DATE('23/02/2024', 'DD/MM/YYYY'),
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 19)))) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        10,
        TO_DATE('05/02/2024', 'DD/MM/YYYY'),
        TP_NT_REF_RELAC(TP_REF_RELAC(((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 20)))) -- PASSAGEM_TB REF
    )
);


INSERT INTO COMPRA_TB VALUES (
    tp_compra(
        11,
        TO_DATE('15/02/2024', 'DD/MM/YYYY'), -- data_compra
        TP_NT_REF_RELAC(
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 21)),
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 22)),
    TP_REF_RELAC((SELECT REF(pt) FROM PASSAGEM_TB pt WHERE pt.pk_localizador_passagem = 23))
    
    ) -- PASSAGEM_TB REF
    )
);

SELECT * FROM COMPRA_TB C;
