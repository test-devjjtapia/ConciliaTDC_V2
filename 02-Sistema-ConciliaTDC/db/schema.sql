-- ConciliaTDC - Esquema de base de datos (extraído con DBeaver)
-- Motor: DB2 (compatible con sintaxis SQL estándar)

-- Tabla principal: transacciones reportadas por el procesador
CREATE TABLE TRANSACCIONES (
    ID            VARCHAR(16)  NOT NULL PRIMARY KEY,
    CUENTA        VARCHAR(20)  NOT NULL,
    MONTO         DECIMAL(11,2) NOT NULL,
    FECHA         DATE         NOT NULL,
    COMERCIO      VARCHAR(30),
    FECHA_CARGA   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- Resultado de la conciliación por transacción
-- ESTATUS es escrito por el COBOL CONCILI1:
--   CONCILIADA = sin diferencia
--   AJUSTADA   = diferencia <= 0.99 absorbida automáticamente
--   EXCEPCION  = diferencia mayor, requiere revisión del analista
CREATE TABLE CONCILIACIONES (
    ID             INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TRANSACCION_ID VARCHAR(16) NOT NULL REFERENCES TRANSACCIONES(ID),
    ESTATUS        VARCHAR(10) NOT NULL,
    DIFERENCIA     DECIMAL(11,2) DEFAULT 0,
    FECHA_PROCESO  DATE NOT NULL,
    JOB_EJECUCION  VARCHAR(20)          -- identifica qué corrida del batch la generó
);

-- Excepciones que el analista revisa desde la app
CREATE TABLE EXCEPCIONES (
    ID             INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TRANSACCION_ID VARCHAR(16) NOT NULL REFERENCES TRANSACCIONES(ID),
    DIFERENCIA     DECIMAL(11,2) NOT NULL,
    ESTATUS        VARCHAR(12) DEFAULT 'PENDIENTE',  -- PENDIENTE/EN_REVISION/RESUELTA
    ACCION         VARCHAR(20),                       -- ACEPTAR_DIFERENCIA/REPROCESAR
    USUARIO_REVISA VARCHAR(30),
    FECHA_REVISION TIMESTAMP
);

-- Índices
CREATE INDEX IDX_CONC_FECHA    ON CONCILIACIONES(FECHA_PROCESO);
CREATE INDEX IDX_EXC_ESTATUS   ON EXCEPCIONES(ESTATUS);
CREATE INDEX IDX_TRANS_CUENTA  ON TRANSACCIONES(CUENTA);
