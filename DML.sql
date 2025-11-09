-- =============================================
-- Archivo: 02_data.sql
-- Propósito: Insertar datos de prueba en CLIENTES, CREDITOS y TRANSACCIONES
-- =============================================

INSERT INTO CLIENTES (tipo_documento, documento, nombre, primer_apellido, segundo_apellido)
VALUES
('CC', '10005487954', 'Santiago', 'Santana', 'Gómez'),
('NIT', '8901875943', 'Empresa', 'Global', 'SAS'),
('CC', '10019876543', 'Laura', 'Martínez', 'Pérez'),
('CC', '10012345678', 'Carlos', 'Rodríguez', 'López'),
('CC', '10022334455', 'Ana', 'García', 'Torres'),
('CC', '10033445566', 'Miguel', 'Hernández', 'Ramírez'),
('NIT', '900112233', 'Servicios', 'Soluciones', 'S.A.'),
('CC', '10044556677', 'Luis', 'Martínez', 'Gómez'),
('CC', '10055667788', 'Carolina', 'Rodríguez', 'Pérez'),
('CC', '10066778899', 'Andrés', 'López', 'Vega');

INSERT INTO CREDITOS (codigo_cliente, numero_credito, monto, saldo, calificacion, estado)
VALUES
(2, 'CR001', 10000, 5000, 'A', 'V'),
(3, 'CR002', 20000, 20000, 'B', 'C'),
(4, 'CR003', 15000, 15000, 'A', 'V'),
(5, 'CR004', 5000, 2500, 'B', 'V'),
(6, 'CR005', 12000, 6000, 'A', 'V'),
(7, 'CR006', 8000, 4000, 'B', 'V'),
(8, 'CR007', 50000, 50000, 'C', 'C'),
(9, 'CR008', 15000, 10000, 'A', 'V'),
(10, 'CR009', 20000, 20000, 'B', 'C'),
(11, 'CR010', 10000, 5000, 'A', 'V');

INSERT INTO TRANSACCIONES (numero_credito, tipo_transaccion, valor_transaccion, fecha_transaccion)
VALUES
('CR001', 'DEP', 1000, '2021-01-05'),
('CR002', 'DEP', 5000, '2020-12-10'),
('CR003', 'DEP', 1500, '2021-01-15'),
('CR004', 'DEP', 1000, '2021-01-10'),
('CR005', 'RET', 3000, '2021-01-20'),
('CR006', 'DEP', 2000, '2021-01-08'),
('CR007', 'RET', 10000, '2020-12-12'),
('CR008', 'DEP', 4000, '2021-01-18'),
('CR009', 'DEP', 5000, '2020-12-25'),
('CR010', 'DEP', 2500, '2021-01-15');
