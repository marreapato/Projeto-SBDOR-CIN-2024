INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        1, -- pk_cod_estadia
        1000.00, -- valor_estadia
        TO_DATE('2024-05-10', 'YYYY-MM-DD'), -- data_check_in
        TO_DATE('2024-05-20', 'YYYY-MM-DD'), -- data_check_out
        TP_NT_RESERVA(TP_RESERVA((SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 1)))
    )
);
