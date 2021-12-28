
/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DDL =============
 */





-- TABLAS
drop table if exists productos cascade;
drop table if exists proveedores cascade;
drop table if exists empleados cascade;
drop table if exists ventas cascade;
drop table if exists clientes cascade;
drop table if exists facturas cascade;
drop table if exists facturas_detalles cascade;


-- ENUMERADOS
-- Enumerados tabla facturas_detalles
drop type if exists tipo_factura_enum cascade;
drop type if exists tipo_pago_enum cascade;





-- Todos lo id PK auto_increment
drop sequence if exists id_secuencia cascade;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA PRODUCTOS ===========

create table productos(
	
id int primary key,
codigo varchar(60) not null,
nombre varchar(60) not null,
marca varchar(60) not null,
tipo varchar(60) not null,-- bebidas, almacen, carnes y pescados, frutas y verduras, etc 
grupo varchar(60) not null, -- Vinos, Gaseosas, etc
peso decimal(8,2) not null,
precio_unidad decimal(8,2) not null,
stock smallint not null

);



-- ======= Restricciones Tabla productos ===========

-- UNIQUE ID
alter table productos 
add constraint UNIQUE_productos_id
unique(id);

-- UNIQUE CÓDIGO_NOMBRE
alter table productos 
add constraint UNIQUE_productos_codigo
unique(codigo);

-- CHECK PESO
alter table productos 
add constraint CHECK_productos_peso
check(peso > 0.00);

-- CHECK PRECIO_UNIDAD
alter table productos 
add constraint CHECK_productos_precio_unidad
check(precio_unidad > 0.00);

-- CHECK STOCK
alter table productos 
add constraint CHECK_productos_stock
check(stock > 0);




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA PROVEEDORES ===========

create table proveedores(
	
id int primary key,
empresa varchar(60) not null,-- Food S.A. , Alimentos Refrigerados S.A. ,  Tapalque Alimentos S.A. , etc
tipo_producto varchar(60) not null,-- Bebidas, Frutas y Verduras, etc
direccion varchar(60) not null, 
nro_telefono_principal varchar(40) not null,
nro_telefono_secundario varchar(40),
email varchar(60) not null


);



-- ======= Restricciones Tabla proveedores ===========

-- UNIQUE ID
alter table proveedores
add constraint UNIQUE_proveedores_id
unique(id);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA EMPLEADOS ===========

create table empleados(
	
id int primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
edad int not null,
fecha_nacimiento date not null,
tipo_documento varchar(50) not null, -- Pasaporte, DNI, Etc
nro_documento varchar(20) not null,
cuil varchar(30) not null, -- Si no tiene DNI, cuil provisorio
direccion varchar(40) not null, 
nro_telefono_principal varchar(40) not null,
nro_telefono_secundario varchar(40),
email varchar(40),
cargo varchar(40) not null,
antiguedad int not null,
fecha_ingreso date not null,
salario_anual decimal(10,2) not null
);



-- ======= Restricciones Tabla Empleados ===========

-- UNIQUE ID
alter table empleados 
add constraint UNIQUE_empleados_id
unique(id);

-- UNIQUE NOMBRE/APELLIDO
alter table empleados 
add constraint UNIQUE_empleados_nombre_apellido
unique(nombre,apellido);


-- CHECK EDAD
alter table empleados 
add constraint CHECK_empleados_edad
check (edad >= 18);

-- CHECK ANTIGUEDAD
alter table empleados 
add constraint CHECK_empleados_antiguedad
check (antiguedad >= 0 );

--- UNIQUE NRO_DOCUMENTO_CUIL
alter table empleados 
add constraint UNIQUE_empleados_nro_documento_cuil
unique(nro_documento,cuil);


-- UNIQUE TELEFONO
alter table empleados
add constraint UNIQUE_empleados_nro_telefono_principal
unique(nro_telefono_principal);


-- CHECK FECHA_NACIMIENTO Y FECHA_INGRESO
alter table empleados 
add constraint CHECK_empleados_fecha_nacimiento_ingreso
check (current_date > fecha_nacimiento and current_date >= fecha_ingreso );

-- CHECK SALARIO_ANUAL
alter table empleados 
add constraint CHECK_empleados_salario_anual
check (salario_anual > 300);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ======= TABLA CLIENTES ===========

create table clientes(
	
id int primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
tipo_documento varchar(20) not null,
nro_documento varchar(20) not null,
nro_telefono_principal varchar(40) not null,
nro_telefono_secundario varchar(40),
email varchar(40)


);

-- ======= Restricciones Tabla clientes ===========

-- UNIQUE ID
alter table clientes 
add constraint UNIQUE_clientes_id
unique(id);


-- UNIQUE NOMBRE/APELLIDO
alter table clientes 
add constraint UNIQUE_clientes_nombre_apellido
unique(nombre,apellido);



-- UNIQUE TELEFONO
alter table clientes
add constraint UNIQUE_clientes_nro_telefono_principal
unique(nro_telefono_principal);



--- UNIQUE NRO_DOCUMENTO
alter table clientes 
add constraint UNIQUE_clientes_nro_documento
unique(nro_documento);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ======= TABLA VENTAS ===========

create table ventas(
	
id int primary key,
id_empleado int not null,
fecha_venta date not null,-- ej '2001-10-07'
hora_venta time not null
);

-- ======= Restricciones Tabla ventas ===========

-- UNIQUE ID
alter table ventas
add constraint UNIQUE_ventas_id
unique(id);

-- FK ID_EMPLEADO
alter table ventas 
add constraint FK_ventas_id_empleado
foreign key(id_empleado)
references empleados(id);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ======= TABLA VENTAS_CLIENTES ===========

create table ventas_clientes(
	
id int primary key,
id_venta int not null,
id_cliente int not null
);

-- ======= Restricciones Tabla ventas_clientes ===========

-- UNIQUE ID
alter table ventas_clientes
add constraint UNIQUE_ventas_clientes_id
unique(id);

-- FK ID_VENTA
alter table ventas_clientes
add constraint FK_ventas_clientes_id_venta
foreign key(id_venta)
references ventas(id);


-- FK ID_CLIENTE
alter table ventas_clientes
add constraint FK_ventas_clientes_id_cliente
foreign key(id_cliente)
references clientes(id);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ======= TABLA FACTURAS ===========

create table facturas(
	
id int primary key,
id_venta int not null,
nro_factura varchar(30) not null,
fecha_emision date not null,-- ej '2001-10-07'
hora_emision time not null,  -- ej '09:00:07'
precio_total_venta decimal(10,2) not null -- + impuestos + costos + etc

);

-- ======= Restricciones Tabla facturas ===========

-- UNIQUE ID
alter table facturas 
add constraint UNIQUE_facturas_id
unique(id);

-- FK ID_VENTA
alter table facturas 
add constraint FK_facturas_id_venta
foreign key(id_venta)
references ventas(id);

-- UNIQUE ID_VENTA
alter table facturas 
add constraint UNIQUE_facturas_id_venta
unique(id_venta);

-- CHECK PRECIO_TOTAL_VENTA
alter table facturas
add constraint CHECK_facturas_precio_total_venta
check ( precio_total_venta > 0);


-- ---------------------------------------------------------------------------



-- ---------------------------------------------------------------------------

-- ======= TABLA FACTURAS_DETALLES ===========

-- Los enumerados deben estar declarados fuera de la creacion de tabla 

create type tipo_factura_enum as enum('A','B','C','D');
create type tipo_pago_enum as enum('EFECTIVO','CHEQUE','TARJETA');



create table facturas_detalles(
	
id int primary key,
id_factura int not null,
tipo tipo_factura_enum not null, -- A,C ETC
descripcion_factura varchar(100) not null,-- 
costo_asociado decimal(8,2) not null, -- servicios, comisiones, etc
medio_de_pago tipo_pago_enum not null,
descripcion_pago varchar(100) not null

);

-- ======= Restricciones Tabla facturas_detalles ===========

-- UNIQUE ID
alter table facturas_detalles
add constraint UNIQUE_facturas_detalles_id
unique(id);

-- UNIQUE ID_FACTURA
alter table facturas_detalles
add constraint UNIQUE_facturas_detalles_id_factura
unique(id_factura);

-- FK ID_FACTURA
alter table facturas_detalles 
add constraint FK_facturas_detalles_id_factura
foreign key(id_factura)
references facturas(id);


-- CHECK COSTO_ASOCIADO
alter table facturas_detalles
add constraint CHECK_facturas_detalles_costo_asociado
check( costo_asociado > 0);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------






-- ======== TODOS LOS ID´S PK DE LAS TABLAS COMO AUTO_INCREMENT =======

CREATE SEQUENCE id_secuencia;

alter table productos alter id set default nextval('id_secuencia');
alter table proveedores alter id set default nextval('id_secuencia');
alter table empleados alter id set default nextval('id_secuencia');
alter table ventas alter id set default nextval('id_secuencia');
alter table clientes alter id set default nextval('id_secuencia');
alter table facturas alter id set default nextval('id_secuencia');
alter table facturas_detalles alter id set default nextval('id_secuencia');



