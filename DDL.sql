-- =============================================
-- Archivo: 01_ddl.sql
-- Propósito: Crear las tablas CLIENTES, CREDITOS, TRANSACCIONES y EMPLEADOS
-- =============================================

CREATE TABLE CLIENTES (
    codigo_cliente INT IDENTITY(1,1) PRIMARY KEY,
    tipo_documento VARCHAR(10),
    documento VARCHAR(24),
    nombre VARCHAR(100),
    primer_apellido VARCHAR(60),
    segundo_apellido VARCHAR(60)
);

CREATE TABLE CREDITOS (
    codigo_cliente INT,
    numero_credito VARCHAR(20) PRIMARY KEY,
    monto MONEY,
    saldo MONEY,
    calificacion VARCHAR(1),
    estado VARCHAR(1),
    FOREIGN KEY (codigo_cliente) REFERENCES CLIENTES(codigo_cliente)
);

CREATE TABLE TRANSACCIONES (
    numero_credito VARCHAR(20),
    tipo_transaccion VARCHAR(3),
    valor_transaccion MONEY,
    fecha_transaccion DATETIME,
    FOREIGN KEY (numero_credito) REFERENCES CREDITOS(numero_credito)
);

CREATE TABLE EMPLEADOS (
    codigo_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    salario MONEY,
    cargo VARCHAR(50),
    fecha_ingreso DATE
);

CREATE INDEX idx_codigo_empleado ON EMPLEADOS(codigo_empleado);
