INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    1,                                 -- pkid_hotel
    'Hotel Fortaleza',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'CE',                          -- estado
        'Fortaleza',                   -- cidade
        'Rua Marechal 3'                      -- complemento
    ),
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 1)))             -- registros (empty collection)
);


INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    2,                                 -- pkid_hotel
    'Praia Hotel',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'RJ',                          -- estado
        'Rio de Janeiro',                   -- cidade
        'Rua Marechal 1'                      -- complemento
    ),
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 2)),
tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 4)))             -- registros (empty collection)
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
    tp_nt_ref_registrada(tp_ref_registrada((SELECT REF(pt) FROM estadia pt WHERE pt.pk_cod_estadia = 3)))             -- registros (empty collection)
);

INSERT INTO HOTEL(
    pkid_hotel,
    nome,
    endereco_hotel,
    registros
) VALUES (
    4,                                 -- pkid_hotel
    'Hotel Palace',                       -- nome
    tp_endereco(                       -- endereco_hotel
        'Brasil',                      -- pais
        '12345-678',                   -- cep
        'PR',                          -- estado
        'Curitiba',                   -- cidade
        'Rua Maringa'                      -- complemento
    ),
    tp_nt_ref_registrada()             -- registros (empty collection)
);



SELECT H.PKID_HOTEL, H.ENDERECO_HOTEL.CIDADE, DEREF(PG.PASSAGEM).PK_LOCALIZADOR_PASSAGEM FROM HOTEL H,
    TABLE(H.REGISTROS) R, TABLE(DEREF((DEREF(R.ESTADIAS).RESERVAS)).PASSAGEM) PG;
