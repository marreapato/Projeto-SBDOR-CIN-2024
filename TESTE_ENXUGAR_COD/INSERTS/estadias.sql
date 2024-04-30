


INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        1, -- pk_cod_estadia
        1000.00, -- valor_estadia
        TO_DATE('14/01/2025', 'DD/MM/YYYY'),
  		TO_DATE('17/01/2025', 'DD/MM/YYYY'), -- data_check_out
   		(SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 20)
    )
);

INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        2, -- pk_cod_estadia
        990.00, -- valor_estadia
        TO_DATE('20/06/2024', 'DD/MM/YYYY'),
    	TO_DATE('25/06/2024', 'DD/MM/YYYY'),
        (SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 2))
    
);


INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        4, -- pk_cod_estadia
        2990.00, -- valor_estadia
         TO_DATE('25/09/2024', 'DD/MM/YYYY'),
    		TO_DATE('30/09/2024', 'DD/MM/YYYY'),
        (SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 5)
    )
);


INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        3, -- pk_cod_estadia
        2929.30, -- valor_estadia
         TO_DATE('22/11/2024', 'DD/MM/YYYY'),
    		TO_DATE('30/11/2024', 'DD/MM/YYYY'),
        (SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 7))
);


SELECT E.VALOR_ESTADIA,E.PK_COD_ESTADIA,E.DATA_CHECK_IN,E.DATA_CHECK_OUT,
    DEREF(E.RESERVAS) FROM ESTADIA E;
