


INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        1, -- pk_cod_estadia
        1000.00, -- valor_estadia
        TO_DATE('11/05/2024', 'DD/MM/YYYY'),
  		TO_DATE('16/05/2024', 'DD/MM/YYYY'), -- data_check_out
   		(SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 1)
    )
);

INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        2, -- pk_cod_estadia
        990.00, -- valor_estadia
        TO_DATE('25/09/2024', 'DD/MM/YYYY'),
    	TO_DATE('28/09/2024', 'DD/MM/YYYY'),
        (SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 2))
    
);


INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        4, -- pk_cod_estadia
        9975.32, -- valor_estadia
         TO_DATE('14/01/2025', 'DD/MM/YYYY'),
    		TO_DATE('23/01/2025', 'DD/MM/YYYY'),
        (SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 4)
    )
);


INSERT INTO ESTADIA VALUES (
    ESTADIA_TP(
        3, -- pk_cod_estadia
        2920.30, -- valor_estadia
         TO_DATE('22/11/2024', 'DD/MM/YYYY'),
    		TO_DATE('22/11/2024', 'DD/MM/YYYY'),
        (SELECT REF(pt) FROM compra_tb pt WHERE pt.id_compra = 3))
);


SELECT E.VALOR_ESTADIA,E.PK_COD_ESTADIA,E.DATA_CHECK_IN,E.DATA_CHECK_OUT,
    DEREF(E.RESERVAS) FROM ESTADIA E;
