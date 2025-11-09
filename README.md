# prueba-tecnica-sql
Scripts SQL Server - Creación de tablas, consultas y procedimientos para la prueba técnica

Este repositorio contiene la solución de la prueba técnica enfocada en la base de datos, incluyendo:

Creación de tablas (CLIENTES, CREDITOS, TRANSACCIONES, EMPLEADOS).

Inserción de datos de prueba.

Consultas, actualizaciones, eliminaciones, funciones y procedimientos almacenados.

Se organiza para demostrar buenas prácticas en T-SQL y manejo de datos.

Estructura del repositorio
/prueba-tecnica-db
│
├── 01_ddl.sql                 # Creación de tablas y relaciones
├── 02_data.sql                # Inserción de datos de prueba
├── 03_consultas.sql           # Consultas de la prueba, updates, deletes, funciones y stored procedures
└── README.md                  # Este archivo

Cómo ejecutar los scripts SQL

Abrir SQL Server Management Studio (SSMS).

Crear una nueva base de datos (por ejemplo, ClientesDB).

Ejecutar los scripts en el siguiente orden:

01_ddl.sql → Crea las tablas y relaciones.

02_data.sql → Inserta los datos de prueba.

03_consultas.sql → Contiene las consultas, actualizaciones, eliminaciones, funciones y procedimientos.

Verificar los datos con:

SELECT * FROM CLIENTES;
SELECT * FROM CREDITOS;
SELECT * FROM TRANSACCIONES;
SELECT * FROM EMPLEADOS;

Contenido de los scripts

01_ddl.sql → Contiene los CREATE TABLE y CREATE INDEX.

02_data.sql → Contiene los INSERT INTO para poblar las tablas.

03_consultas.sql → Contiene:

Consultas de clientes con créditos vigentes.

Actualización de saldos.

Eliminación de transacciones.

Funciones y stored procedures.

Uso de CASE, REPLACE y otras funciones SQL.

Buenas prácticas demostradas

Separación de DDL y datos.

Uso de relaciones y claves foráneas.

Organización profesional de scripts SQL.

Implementación de procedimientos y funciones para consultas reutilizables.
