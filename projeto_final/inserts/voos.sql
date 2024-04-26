
SELECT S.ORIGEM,S.DESTINO, DEREF(R.PASSAGEM).PK_LOCALIZADOR_PASSAGEM FROM VOO_TABLE S, TABLE(REFERE_SE) R;

INSERT INTO VOO_TABLE VALUES (
    1,
    'GRU',
    'GIG',
    '22:30',
    '02:25',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 1)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 2)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 3)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 4)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 5)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 18))) -- Nested table containing reference to PASSAGEM_TP
);

INSERT INTO VOO_TABLE VALUES (
    2,
    'GIG',
    'GRU',
    '12:00',
    '14:30',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 7)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 8)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 9))) -- Nested table containing reference to PASSAGEM_TP
);

INSERT INTO VOO_TABLE VALUES (
    3,
    'SSA',
    'REC',
    '17:30',
    '19:00',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 14)))
);

INSERT INTO VOO_TABLE VALUES (
    4,
    'BSB',
    'GRU',
    '17:30',
    '19:00',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 11)))
);

INSERT INTO VOO_TABLE VALUES (
    5,
    'POA',
    'CNF',
    '17:30',
    '19:00',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 12)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 13)))
);

INSERT INTO VOO_TABLE VALUES (
    6,
    'REC',
    'FOR',
    '07:30',
    '09:00',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 10)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 15)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 16)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 17)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 19)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 20)))
);

INSERT INTO VOO_TABLE VALUES (
    8,
    'FOR',
    'REC',
    '14:30',
    '16:00',
    tp_nt_ref_relac(tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 21)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 22)),
    tp_ref_relac((SELECT REF(p) FROM PASSAGEM p WHERE p.pk_localizador_passagem = 23)))
);

INSERT INTO VOO_TABLE VALUES (
    7,
    'RBR',
    'PVH',
    '12:30',
    '13:45',
    tp_nt_ref_relac()
);

