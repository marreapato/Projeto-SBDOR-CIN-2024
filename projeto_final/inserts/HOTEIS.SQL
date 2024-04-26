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

SELECT H.PKID_HOTEL, H.ENDERECO_HOTEL.CIDADE, DEREF(R.ESTADIAS).VALOR_ESTADIA, DEREF(DEREF(RES.COMPRAS).PASSAGEIROS).NOME FROM HOTEL H,
    TABLE(H.REGISTROS) R, TABLE(DEREF(R.ESTADIAS).RESERVAS) RES;
