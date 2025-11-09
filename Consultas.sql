-- =============================================
-- Archivo: 03_consultas.sql
-- Propósito: Consultas, updates, deletes, funciones y procedimientos
-- =============================================

-- 1. Clientes con crédito vigente y transacciones enero 2021
SELECT 
    c.nombre,
    c.primer_apellido,
    c.segundo_apellido,
    c.tipo_documento,
    c.documento,
    cr.saldo,
    t.tipo_transaccion,
    t.valor_transaccion,
    t.fecha_transaccion
FROM CLIENTES c
INNER JOIN CREDITOS cr ON c.codigo_cliente = cr.codigo_cliente
LEFT JOIN TRANSACCIONES t ON cr.numero_credito = t.numero_credito
WHERE cr.estado = 'V'
  AND t.fecha_transaccion >= '2021-01-01'
  AND t.fecha_transaccion < '2021-02-01';

-- 2. Actualizar saldo de cliente específico
UPDATE cr
SET cr.saldo = 0
FROM CREDITOS cr
INNER JOIN CLIENTES c ON cr.codigo_cliente = c.codigo_cliente
WHERE c.tipo_documento = 'CC'
  AND c.documento = '10005487954';

-- 3. Eliminar transacciones diciembre 2020 de cliente NIT
DELETE t
FROM TRANSACCIONES t
INNER JOIN CREDITOS cr ON t.numero_credito = cr.numero_credito
INNER JOIN CLIENTES c ON cr.codigo_cliente = c.codigo_cliente
WHERE c.tipo_documento = 'NIT'
  AND c.documento = '8901875943'
  AND t.fecha_transaccion >= '2020-12-01'
  AND t.fecha_transaccion < '2021-01-01';

-- 5. Stored procedure para insertar cliente
CREATE PROCEDURE sp_InsertarCliente
    @i_tipo_documento VARCHAR(10),
    @i_documento VARCHAR(24),
    @i_nombre VARCHAR(100),
    @i_primer_apellido VARCHAR(60),
    @i_segundo_apellido VARCHAR(60),
    @o_mensaje VARCHAR(200) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO CLIENTES (tipo_documento, documento, nombre, primer_apellido, segundo_apellido)
        VALUES (@i_tipo_documento, @i_documento, @i_nombre, @i_primer_apellido, @i_segundo_apellido);

        SET @o_mensaje = 'Cliente insertado correctamente.';
    END TRY
    BEGIN CATCH
        SET @o_mensaje = ERROR_MESSAGE();
    END CATCH
END;

-- 6. Función para obtener créditos por documento
CREATE FUNCTION fn_GetCreditosPorDocumento(@i_documento VARCHAR(24))
RETURNS TABLE
AS
RETURN
(
    SELECT cr.*
    FROM CREDITOS cr
    INNER JOIN CLIENTES c ON cr.codigo_cliente = c.codigo_cliente
    WHERE c.documento = @i_documento
);

-- 7. Cantidad de registros por estado
SELECT estado, COUNT(*) AS cantidad
FROM CREDITOS
GROUP BY estado;

-- 8. Ejemplo REPLACE
SELECT REPLACE('HOLA MUNDO.', 'MUNDO', 'SQL') AS resultado;

-- 9. Posición del punto
SELECT CHARINDEX('.', 'HOLA MUNDO.') AS posicion;

-- 10. Ejemplo CASE
SELECT 
    numero_credito,
    saldo,
    CASE 
        WHEN saldo > 10000 THEN 'Alto'
        WHEN saldo BETWEEN 5000 AND 10000 THEN 'Medio'
        ELSE 'Bajo'
    END AS nivel_saldo
FROM CREDITOS;
