SELECT E.PK_COD_ESTADIA,E.DATA_CHECK_IN,E.DATA_CHECK_OUT,E.VALOR_ESTADIA, R.COMPRAS.PASSAGEIROS.NOME from estadia E, TABLE(E.RESERVAS) R;

INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        1, -- pk_cod_estadia
        1000.00, -- valor_estadia
        TO_DATE('14/01/2025', 'DD/MM/YYYY'),
  		TO_DATE('17/01/2025', 'DD/MM/YYYY'), -- data_check_out
        TP_NT_RESERVA(TP_RESERVA((SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 15)),
    TP_RESERVA((SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 20)),
    TP_RESERVA((SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 10)))
    )
);

INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        2, -- pk_cod_estadia
        990.00, -- valor_estadia
        TO_DATE('20/06/2024', 'DD/MM/YYYY'),
    	TO_DATE('25/06/2024', 'DD/MM/YYYY'),
        TP_NT_RESERVA(TP_RESERVA((SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 2)),
		    			TP_RESERVA((SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 18)))
    )
);

SELECT E.VALOR_ESTADIA,E.PK_COD_ESTADIA,E.DATA_CHECK_IN,E.DATA_CHECK_OUT, DEREF(DEREF(R.COMPRAS).PASSAGEIROS).NOME,
    DEREF(DEREF(R.COMPRAS).PASSAGEIROS).PK_CPF FROM ESTADIA E, TABLE(RESERVAS) R;
