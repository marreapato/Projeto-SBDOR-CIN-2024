
-- Inserting Purchase 1
INSERT INTO COMPRA_TB (data_compra, passageiros, passagem)
VALUES (
    TO_DATE('2024-04-24', 'YYYY-MM-DD'),  -- Date of purchase
    (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901'),  -- Reference to passenger with CPF '12345678901'
    (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 1)  -- Reference to flight ticket with ID 1001
);

-- Inserting Purchase 2
INSERT INTO COMPRA_TB (data_compra, passageiros, passagem)
VALUES (
    TO_DATE('2024-04-25', 'YYYY-MM-DD'),  -- Date of purchase
    (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '23456789012'),  -- Reference to passenger with CPF '23456789012'
    (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 2)  -- Reference to flight ticket with ID 1002
);

-- Inserting Purchase 3
INSERT INTO COMPRA_TB (data_compra, passageiros, passagem)
VALUES (
    TO_DATE('2024-04-26', 'YYYY-MM-DD'),  -- Date of purchase
    (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '34567890123'),  -- Reference to passenger with CPF '34567890123'
    (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 3)  -- Reference to flight ticket with ID 1003
);

-- Inserting Purchase 4
INSERT INTO COMPRA_TB (data_compra, passageiros, passagem)
VALUES (
    TO_DATE('2024-04-27', 'YYYY-MM-DD'),  -- Date of purchase
    (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '45678901234'),  -- Reference to passenger with CPF '45678901234'
    (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 4)  -- Reference to flight ticket with ID 1004
);

-- Inserting Purchase 5
INSERT INTO COMPRA_TB (data_compra, passageiros, passagem)
VALUES (
    TO_DATE('2024-04-28', 'YYYY-MM-DD'),  -- Date of purchase
    (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '56789012345'),  -- Reference to passenger with CPF '56789012345'
    (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 5)  -- Reference to flight ticket with ID 1005
);

-- Example SELECT query using DEREF to retrieve purchase information

SELECT
    c.data_compra AS data_compra,
    DEREF(c.passageiros).NOME AS nome_passageiro,
    DEREF(c.passageiros).PK_CPF AS cpf_passageiro,
    DEREF(c.passagem).pk_localizador_passagem AS localizador_passagem,
    DEREF(c.passagem).valor_passagem AS valor_passagem,
    DEREF(c.passagem).data_ida AS data_ida,
    DEREF(c.passagem).data_chegada AS data_chegada
FROM
    COMPRA_TB c;
