-- Inserting flights into VOO_TABLE with associated ticket references

-- Insert Flight 1
INSERT INTO VOO_TABLE (
    pk_numero_voo,
    origem,
    destino,
    hora_embarque,
    hora_desembarque,
    refere_se
) VALUES (
    1001,                         -- Flight ID
    'JFK',                        -- Origin airport code (e.g., JFK)
    'LAX',                        -- Destination airport code (e.g., LAX)
    TO_TIMESTAMP('2024-05-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- Boarding time
    TO_TIMESTAMP('2024-05-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- Arrival time
    tp_nt_ref_relac(              -- List of ticket references
        tp_ref_relac(
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 1)  -- Reference to ticket with ID 1001
        ),
        tp_ref_relac(
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 2)  -- Reference to ticket with ID 1002
        )
    )
);

-- Insert Flight 2
INSERT INTO VOO_TABLE (
    pk_numero_voo,
    origem,
    destino,
    hora_embarque,
    hora_desembarque,
    refere_se
) VALUES (
    1002,                         -- Flight ID
    'LHR',                        -- Origin airport code (e.g., LHR)
    'CDG',                        -- Destination airport code (e.g., CDG)
    TO_TIMESTAMP('2024-05-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- Boarding time
    TO_TIMESTAMP('2024-05-02 12:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- Arrival time
    tp_nt_ref_relac(              -- List of ticket references
        tp_ref_relac(
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 3)  -- Reference to ticket with ID 1003
        ),
        tp_ref_relac(
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 4)  -- Reference to ticket with ID 1004
        ),
        tp_ref_relac(
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 5)  -- Reference to ticket with ID 1005
        )
    )
);

-- Example SELECT query to retrieve flight details and associated ticket information

-- Example SELECT query to retrieve flight details and associated ticket information

-- Corrected SELECT query to retrieve flight details and associated ticket information

SELECT
    v.pk_numero_voo AS flight_id,
    v.origem AS origin,
    v.destino AS destination,
    v.hora_embarque AS boarding_time,
    v.hora_desembarque AS arrival_time,
    DEREF(r.passagem).pk_localizador_passagem AS ticket_id,
    DEREF(r.passagem).valor_passagem AS ticket_price,
    DEREF(r.passagem).data_ida AS departure_date,
    DEREF(r.passagem).data_chegada AS arrival_date
FROM
    VOO_TABLE v,
    TABLE(v.refere_se) r WHERE V.PK_NUMERO_VOO=1001;

