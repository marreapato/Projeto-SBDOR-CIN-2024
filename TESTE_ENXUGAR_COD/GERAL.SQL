----- tipos de objetos

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    pais varchar2(15),
    cep varchar2(9),
    estado varchar2(15),
    cidade VARCHAR2(20),
    complemento varchar2(30)
);

--DROP TYPE tp_endereco;

CREATE OR REPLACE TYPE TP_FONE AS OBJECT (
    COD_PAIS VARCHAR(3),
    COD_DDD VARCHAR(5),
    PHONE VARCHAR(10)
);

CREATE OR REPLACE TYPE TP_FONES AS VARRAY(3) OF TP_FONE;

--TIPO PESSOA
CREATE OR REPLACE TYPE TP_PASSAGEIRO AS OBJECT(
    PK_CPF VARCHAR2(11),
    NOME VARCHAR2(20),
    SEXO VARCHAR2(1),
    DATA_NASCIMENTO DATE,
    ENDERECO_PAX tp_endereco,
    TELEFONES tp_fones,
    EMAIL VARCHAR2(30),
    MEMBER FUNCTION calcular_idade RETURN NUMBER
    
)NOT FINAL;

-- Corpo da member function calcular_idade para o tipo TP_PASSAGEIRO --
CREATE OR REPLACE TYPE BODY TP_PASSAGEIRO AS
    MEMBER FUNCTION calcular_idade RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, self.DATA_NASCIMENTO) / 12);
    END calcular_idade;
END;


CREATE TYPE MAIOR_IDADE_TP UNDER TP_PASSAGEIRO(
);

--DROP TYPE MENOR_IDADE_TP;
CREATE TYPE MENOR_IDADE_TP UNDER TP_PASSAGEIRO(
    acompanhamento_especial varchar2(3)  
);

CREATE OR REPLACE TYPE tp_ref_compra_passageiro AS OBJECT(
DATA_COMPRA DATE,
PASSAGEIROS REF TP_PASSAGEIRO) NOT FINAL;
/


--DROP TYPE PASSAGEM_TP;
CREATE TYPE PASSAGEM_TP AS OBJECT(    
    pk_localizador_passagem INTEGER,
    valor_passagem NUMBER(38,2),
    data_ida DATE,
    data_chegada DATE,
    COMPRAS tp_ref_compra_passageiro
);


CREATE OR REPLACE TYPE tp_ref_relac AS OBJECT(
passagem REF PASSAGEM_TP) NOT FINAL;
/
    
CREATE TYPE tp_nt_ref_relac AS TABLE OF tp_ref_relac;
/
    
-- ENTIDADE VOO
CREATE OR REPLACE TYPE VOO_TP AS OBJECT(
    pk_numero_voo NUMBER(38,0), -- trecho ID
    origem VARCHAR2(3),       -- origem IATA 3
    destino VARCHAR2(3),      -- destino IATA 3
    hora_embarque VARCHAR2(5),
    hora_desembarque VARCHAR2(5),
    refere_se tp_nt_ref_relac
);

----------------
CREATE TYPE ESTADIA_TP AS OBJECT(

 pk_cod_estadia INTEGER,
 valor_estadia NUMBER(38,2),
 data_check_in DATE,
 data_check_out DATE,
 reservas tp_nt_ref_relac
 
);

    
CREATE OR REPLACE TYPE tp_ref_registrada AS OBJECT(
estadias REF ESTADIA_TP) NOT FINAL;
/
    
CREATE TYPE tp_nt_ref_registrada AS TABLE OF tp_ref_registrada;
/

-- ENTIDADE HOTEL
CREATE TYPE HOTEL_TP AS OBJECT(

    pkid_hotel INTEGER,
    nome VARCHAR2(30),
    endereco_hotel tp_endereco,
    registros tp_nt_ref_registrada
);

--------


CREATE TABLE PASSAGEIRO_TB OF TP_PASSAGEIRO(
CONSTRAINT CPF_UNICO_PASSAGEIRO PRIMARY KEY (PK_CPF)
);


CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP;

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP;

CREATE TABLE COMPRAS OF tp_ref_compra_passageiro(
    PASSAGEIROS WITH ROWID REFERENCES PASSAGEIRO_TB
);
    
CREATE TABLE PASSAGEM OF PASSAGEM_TP(    
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_localizador_passagem),
    CONSTRAINT check_valor CHECK(VALOR_PASSAGEM>0)
);


CREATE TABLE VOO_TABLE OF voo_tp (
    CONSTRAINT pkey_localizador_voo PRIMARY KEY (pk_numero_voo)

) NESTED TABLE refere_se STORE AS LISTA_PASSAGENS;



CREATE TABLE ESTADIA OF ESTADIA_TP(
 CONSTRAINT cod_estadia_pkey PRIMARY KEY(pk_cod_estadia),
 CONSTRAINT CHECAR_VALOR_ESTADIA CHECK(VALOR_ESTADIA>0)
    
)NESTED TABLE RESERVAS STORE AS LISTA_RESERVAS;


CREATE TABLE HOTEL OF HOTEL_TP(
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
)NESTED TABLE REGISTROS STORE AS LISTA_REGISTROS;

------

INSERT INTO PASSAGEIRO_TB VALUES (
    '12345678901',
    'Carlos Silva',
    'M',
    TO_DATE('15/07/1980', 'DD/MM/YYYY'),
    tp_endereco('Brasil', '12345678', 'SP', 'São Paulo', 'Rua A, 123'),
    tp_fones(TP_FONE('55', '11', '987654321')),
    'carlos.silva@email.com'
);


INSERT INTO PASSAGEIRO_TB VALUES (
    '98765432198',
    'Ana Souza',
    'F',
    TO_DATE('25/05/1995', 'DD/MM/YYYY'),
    tp_endereco('Brasil', '87654321', 'RJ', 'Rio de Janeiro', 'Av. B, 456'),
    tp_fones(TP_FONE('55', '21', '999876543')),
    'ana.souza@email.com'
);

INSERT INTO PASSAGEIRO_TB VALUES (
    '11122233344',
    'Lucas Santos',
    'M',
    TO_DATE('10/10/1988', 'DD/MM/YYYY'),
    tp_endereco('Brasil', '54321098', 'MG', 'Belo Horizonte', 'Rua C, 789'),
    tp_fones(TP_FONE('55', '31', '987654321')),
    'lucas.santos@email.com'
);

INSERT INTO PASSAGEIRO_TB VALUES (
    '55566677788',
    'Juliana Oliveira',
    'F',
    TO_DATE('03/12/1992', 'DD/MM/YYYY'),
    tp_endereco('Brasil', '65432109', 'RS', 'Porto Alegre', 'Rua D, 321'),
    tp_fones(TP_FONE('55', '51', '999887766')),
    'juliana.oliveira@email.com'
);

INSERT INTO PASSAGEIRO_TB VALUES (
    '99988877766',
    'Rafael Costa',
    'M',
    TO_DATE('20/02/1987', 'DD/MM/YYYY'),
    tp_endereco('Brasil', '13579024', 'PR', 'Curitiba', 'Av. E, 567'),
    tp_fones(TP_FONE('55', '41', '998877665')),
    'rafael.costa@email.com'
);

-------

INSERT INTO COMPRAS VALUES (
        TO_DATE('15/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901')
);


INSERT INTO COMPRAS VALUES (
        TO_DATE('20/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '99988877766')
);

-- Inserting another purchase record for a different passenger and ticket
INSERT INTO COMPRAS VALUES (
        TO_DATE('05/01/2024', 'DD/MM/YYYY'), -- data_compra
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '55566677788')
    
);

----


INSERT INTO PASSAGEM
VALUES (
    1,             -- pk_localizador_passagem
    500.00,        -- valor_passagem
    TO_DATE('2024-05-01', 'YYYY-MM-DD'), -- data_ida
    TO_DATE('2024-05-07', 'YYYY-MM-DD'), -- data_chegada
    tp_ref_compra_passageiro(
        TO_DATE('05/01/2024','DD/MM/YYYY'),   -- DATA_COMPRA
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE PK_CPF = '12345678901')  -- PASSAGEIROS
    )
);

INSERT INTO PASSAGEM
VALUES (
    2,             -- pk_localizador_passagem
    500.00,        -- valor_passagem
    TO_DATE('2024-05-01', 'YYYY-MM-DD'), -- data_ida
    TO_DATE('2024-05-07', 'YYYY-MM-DD'), -- data_chegada
    tp_ref_compra_passageiro(
        TO_DATE('20/01/2024','DD/MM/YYYY'),   -- DATA_COMPRA
        (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE PK_CPF = '99988877766')  -- PASSAGEIROS
    )
);

------

SELECT  P.*, P.COMPRAS.PASSAGEIROS.PK_CPF, P.COMPRAS.PASSAGEIROS.NOME FROM PASSAGEM P;
