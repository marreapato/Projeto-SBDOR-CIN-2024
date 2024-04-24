-- Inserting lodging records into ESTADIA table with associated reservations

-- Insert Accommodation 1 with Reservations
INSERT INTO ESTADIA (
    pk_cod_estadia,
    valor_estadia,
    data_check_in,
    data_check_out,
    reservas
) VALUES (
    1,                                -- Accommodation ID
    150.00,                           -- Accommodation cost
    TO_DATE('2024-06-01', 'YYYY-MM-DD'),  -- Check-in date
    TO_DATE('2024-06-05', 'YYYY-MM-DD'),  -- Check-out date
    tp_nt_compra(                     -- List of reservations
        tp_compra(
            TO_DATE('2024-04-24', 'YYYY-MM-DD'),  -- Purchase date
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901'),  -- Reference to passenger with CPF '12345678901'
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 1)  -- Reference to flight ticket with ID 1001
        ),
        tp_compra(
            TO_DATE('2024-04-25', 'YYYY-MM-DD'),  -- Purchase date
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '23456789012'),  -- Reference to passenger with CPF '23456789012'
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 2)  -- Reference to flight ticket with ID 1002
        )
    )
);

-- Insert Accommodation 2 with Reservations
INSERT INTO ESTADIA (
    pk_cod_estadia,
    valor_estadia,
    data_check_in,
    data_check_out,
    reservas
) VALUES (
    2,                                -- Accommodation ID
    200.00,                           -- Accommodation cost
    TO_DATE('2024-07-10', 'YYYY-MM-DD'),  -- Check-in date
    TO_DATE('2024-07-15', 'YYYY-MM-DD'),  -- Check-out date
    tp_nt_compra(                     -- List of reservations
        tp_compra(
            TO_DATE('2024-04-26', 'YYYY-MM-DD'),  -- Purchase date
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '34567890123'),  -- Reference to passenger with CPF '34567890123'
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 3)  -- Reference to flight ticket with ID 1003
        ),
        tp_compra(
            TO_DATE('2024-04-27', 'YYYY-MM-DD'),  -- Purchase date
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '45678901234'),  -- Reference to passenger with CPF '45678901234'
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 4)  -- Reference to flight ticket with ID 1004
        ),
        tp_compra(
            TO_DATE('2024-04-28', 'YYYY-MM-DD'),  -- Purchase date
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '56789012345'),  -- Reference to passenger with CPF '56789012345'
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 5)  -- Reference to flight ticket with ID 1005
        )
    )
);

SELECT E.PK_COD_ESTADIA,R.DATA_COMPRA, DEREF(R.PASSAGEM).PK_LOCALIZADOR_PASSAGEM,DEREF(R.PASSAGEIROS).PK_CPF,DEREF(R.PASSAGEIROS).NOME FROM ESTADIA E, TABLE(RESERVAS) R;
