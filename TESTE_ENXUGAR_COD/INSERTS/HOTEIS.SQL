INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    1,                                 -- pkid_hotel
    'Hotel Copacabana',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'RJ',                          -- estado
        'Rio de Janeiro',                   -- cidade
        'Rua Machado de Assis'                      -- complemento
    ),
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 1)))             -- registros
);


INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    2,                                 -- pkid_hotel
    'Hotel BH',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'MG',                          -- estado
        'Belo Horizonte',                   -- cidade
        'Rua Marechal 1'                      -- complemento
    ),
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 2)))             -- registros
);


INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    3,                                 -- pkid_hotel
    'Hotel Guarulhos',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'SP',                          -- estado
        'Guarulhos',                   -- cidade
        'Rua Dom Pedro'                      -- complemento
    ),
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 3)))             -- registros
);

INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    4,                                 -- pkid_hotel
    'Hotel Praia',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'PE',                          -- estado
        'Recife',                   -- cidade
        'Rua Lampiao'                      -- complemento
    ),
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 4)))             -- registros
);


SELECT H.PKID_HOTEL, H.ENDERECO_HOTEL.CIDADE, DEREF(PG.PASSAGEM).PK_LOCALIZADOR_PASSAGEM FROM HOTEL H,
    TABLE(H.REGISTROS) R, TABLE(DEREF((DEREF(R.ESTADIAS).RESERVAS)).PASSAGENS_COMPRADAS) PG;
    
COMMIT;
