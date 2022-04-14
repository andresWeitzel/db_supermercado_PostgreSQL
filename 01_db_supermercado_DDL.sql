
/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DDL =============
 */





-- TABLAS

drop table if exists proveedores cascade;
drop table if exists productos cascade;
drop table if exists empleados cascade;
drop table if exists ventas cascade;
drop table if exists clientes cascade;
drop table if exists compras_clientes cascade;
drop table if exists ventas_productos  cascade;
drop table if exists facturas cascade;
drop table if exists facturas_detalles cascade;


-- ENUMERADOS
-- Enumerados tabla facturas_detalles
drop type if exists tipo_factura_enum cascade;
drop type if exists tipo_pago_enum cascade;



-- Todos lo id PK auto_increment

drop sequence if exists id_sec_provee cascade;
drop sequence if exists id_sec_produc cascade;
drop sequence if exists id_sec_empl cascade;
drop sequence if exists id_sec_vent cascade;
drop sequence if exists id_sec_cli cascade;
drop sequence if exists id_sec_compr_cli cascade;
drop sequence if exists id_sec_vent_prod cascade;
drop sequence if exists id_sec_fact cascade;
drop sequence if exists id_sec_fact_det cascade;








-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- =====================================
-- ======= TABLA PROVEEDORES ===========
-- =====================================

create table proveedores(
	
id int primary key,
empresa varchar(60) not null,-- Food S.A. , Alimentos Refrigerados S.A. ,  Tapalque Alimentos S.A. , etc
tipo_producto varchar(100) not null,
direccion varchar(60) not null, 
nro_tel_princ varchar(40) not null,
nro_tel_sec varchar(40),
email varchar(60) not null


);



-- ======= Restricciones Tabla proveedores ===========

-- UNIQUE ID
alter table proveedores
add constraint UNIQUE_proveedores_id
unique(id);

-- CHECK EMPRESA | TIPO_PRODUCTOS | DIRECCION | NRO_TEL_PRINC | EMAIL
alter table proveedores 
add constraint CHECK_proveedores_empresa_tipo_productos_direccion_nro_tel_princ_email
check((empresa <> '') and (tipo_producto <> '') and (direccion <> '') and 
(nro_tel_princ <> '') and (nro_tel_sec <> '') and (email <> ''));


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ===================================
-- ======= TABLA EMPLEADOS ===========
-- ==================================

create table empleados(
	
id int primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
edad int not null,
fecha_nac date not null,
tipo_doc varchar(50) not null, -- Pasaporte, DNI, Etc
nro_doc varchar(20) not null,
cuil varchar(30) not null, -- Si no tiene DNI, cuil provisorio
direccion varchar(40) not null, 
nro_tel_princ varchar(40) not null,
nro_tel_sec varchar(40),
email varchar(40),
cargo varchar(40) not null,
antiguedad varchar(30) not null,
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

-- CHECK FECHA_NACIMIENTO
alter table empleados 
add constraint CHECK_empleados_fecha_nac
check (fecha_nac < current_date);

--UNIQUE TIPO_NRO_DOC 
alter table empleados
add constraint UNIQUE_tipo_nro_doc 
unique(tipo_doc, nro_doc);


--- UNIQUE NRO_DOC_CUIL
alter table empleados 
add constraint UNIQUE_empleados_nro_doc_cuil
unique(nro_doc, cuil);


-- UNIQUE NRO_TEL
alter table empleados
add constraint UNIQUE_empleados_nro_tel_princ
unique(nro_tel_princ);


-- CHECK FECHA_INGR
alter table empleados 
add constraint CHECK_empleados_fecha_ingreso
check (fecha_ingreso <= current_date);


-- CHECK SALARIO_ANUAL
alter table empleados 
add constraint CHECK_empleados_salario_anual
check (salario_anual > 0);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===================================
-- ======= TABLA CLIENTES ===========
-- ===================================

create table clientes(
	
id int primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
tipo_doc varchar(20) not null,
nro_doc varchar(20) not null,
nro_tel_princ varchar(40) not null,
nro_tel_sec varchar(40),
email varchar(40)


);

-- ======= Restricciones Tabla clientes ===========

-- UNIQUE ID
alter table clientes 
add constraint UNIQUE_clientes_id
unique(id);


-- UNIQUE NOMBRE_APELLIDO
alter table clientes 
add constraint UNIQUE_clientes_nombre_apellido
unique(nombre,apellido);


--- UNIQUE TIPO_NRO_DOCUMENTO
alter table clientes 
add constraint UNIQUE_clientes_tipo_nro_documento
unique(nro_doc, tipo_doc);



-- UNIQUE TELEFONO
alter table clientes
add constraint UNIQUE_clientes_nro_tel_princ
unique(nro_tel_princ);





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ===================================
-- ======= TABLA FACTURAS ===========
-- ===================================

create table facturas(
	
id int primary key,
numero varchar(200) not null,-- 00008
codigo varchar(200) not null, -- 00059374
fecha date not null,-- ej '2001-10-07'
hora time not null,  -- ej '09:00:07'
importe_total decimal(10,2) not null -- + impuestos + costos + etc

);

-- ======= Restricciones Tabla facturas ===========

-- UNIQUE ID
alter table facturas 
add constraint UNIQUE_facturas_id
unique(id);


-- CHECK NUMERO Y CODIGO
alter table facturas 
add constraint CHECK_facturas_numero_codigo
check ((codigo <> '') and (numero <> ''));


-- CHECK FECHA
alter table facturas
add constraint CHECK_facturas_fecha
check ( (fecha <= current_date) or (fecha >= current_date));


-- CHECK HORA
alter table facturas
add constraint CHECK_facturas_hora
check ( (hora <= current_time) or (hora >= current_time));

--CHECK IMPORTE_TOTAL
alter table facturas
add constraint CHECK_facturas_importe_total
check(importe_total > 0);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ===================================
-- == TABLA FACTURAS_DETALLES ========
-- ===================================
-- Los enumerados deben estar declarados fuera de la creacion de tabla 

create type tipo_factura_enum as enum('A','B','C','D');
create type tipo_pago_enum as enum('EFECTIVO','CHEQUE','TARJETA CREDITO', 'TARJETA DEBITO');



create table facturas_detalles(
	
id int primary key,
id_factura int not null,
tipo tipo_factura_enum not null, -- A,C ETC
descr_factura varchar(100) not null,-- 
costo_asoc decimal(8,2) not null, -- servicios, comisiones, etc
iva decimal(10,2) not null,
medio_de_pago tipo_pago_enum not null,
descr_pago varchar(100) not null

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
references facturas(id) on delete cascade;


-- CHECK COSTO_ASOCIADO
alter table facturas_detalles
add constraint CHECK_facturas_detalles_costo_asoc
check( costo_asoc > 0);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
-- ===================================
-- ======= TABLA PRODUCTOS ===========
-- ===================================

create table productos(
	
id int primary key,
id_proveedor int not null, 
codigo varchar(100) not null,
imagen varchar(600) ,
nombre varchar(100) not null,
marca varchar(60) not null,
tipo varchar(60) not null,-- bebidas, almacen, carnes y pescados, frutas y verduras, etc 
grupo varchar(60) not null, -- Vinos, Gaseosas, etc
peso decimal(8,3) not null,
precio_unidad decimal(8,3) not null,
stock smallint not null

);



-- ======= Restricciones Tabla productos ===========

-- UNIQUE ID
alter table productos 
add constraint UNIQUE_productos_id
unique(id);

--UNIQUE CODIGO_NOMBRE
alter table productos
add constraint UNIQUE_productos_codigo_nombre
unique(codigo, nombre);


-- FK ID_PROVEEDOR
alter table productos  
add constraint FK_productos_id_proveedor
foreign key(id_proveedor)
references proveedores(id) on delete cascade;

-- UNIQUE CÓDIGO
alter table productos 
add constraint UNIQUE_productos_codigo
unique(codigo);

-- CHECK PESO
alter table productos 
add constraint CHECK_productos_peso
check(peso > 0);

-- CHECK PRECIO_UNIDAD
alter table productos 
add constraint CHECK_productos_precio_unidad
check(precio_unidad > 0);

-- CHECK STOCK
alter table productos 
add constraint CHECK_productos_stock
check(stock > 0);


-- CHECK NOMBRE | MARCA | TIPO | GRUPO 
alter table productos 
add constraint CHECK_nombre_marca_tipo_grupo
check((nombre <> '') and (marca <> '') and (tipo <> '') and (grupo <> ''));





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ================================
-- ======= TABLA VENTAS ===========
-- ================================

create table ventas(
	
id int primary key,
id_empleado int not null,
id_factura int not null

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
references empleados(id) on delete cascade;

-- FK ID_FACTURA
alter table ventas 
add constraint FK_ventas_id_factura
foreign key(id_factura)
references facturas(id) on delete cascade;


-- UNIQUE ID_FACTURA
alter table ventas 
add constraint UNIQUE_ventas_id_factura
unique(id_factura);






-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ===================================
-- ======= TABLA VENTAS_PRODUCTOS ===========
-- ===================================

create table ventas_productos(
	
id int primary key,
id_venta int not null,
id_producto int not null,
cantidad int not null


);

-- ======= Restricciones Tabla ventas_productos ===========

-- UNIQUE ID
alter table ventas_productos
add constraint UNIQUE_ventas_productos_id
unique(id);

-- FK ID_VENTA
alter table ventas_productos
add constraint FK_ventas_productos_id_venta
foreign key(id_venta)
references ventas(id) on delete cascade;


-- FK ID_PRODUCTO
alter table ventas_productos 
add constraint FK_ventas_productos_id_producto
foreign key(id_producto)
references productos(id) on delete cascade;



--CHECK CANTIDAD	
alter table ventas_productos 
add constraint CHECK_ventas_productos_cantidad
check(cantidad > 0); 

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ===================================
-- ======= TABLA COMPRAS_CLIENTES ===========
-- ===================================

create table compras_clientes(
	
id int primary key,
id_venta int not null,
id_cliente int not null
);

-- ======= Restricciones Tabla compras_clientes ===========

-- UNIQUE ID
alter table compras_clientes
add constraint UNIQUE_compras_clientes_id
unique(id);

-- FK ID_VENTA
alter table compras_clientes
add constraint FK_compras_clientes_id_venta
foreign key(id_venta)
references ventas(id) on delete cascade;


-- FK ID_CLIENTE
alter table compras_clientes
add constraint FK_compras_clientes_id_cliente
foreign key(id_cliente)
references clientes(id) on delete cascade;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------






-- ======== TODOS LOS ID´S PK DE LAS TABLAS COMO AUTO_INCREMENT =======


create sequence id_sec_provee ;
create sequence id_sec_produc;
create sequence id_sec_empl;
create sequence id_sec_vent ;
create sequence id_sec_cli ;
create sequence id_sec_compr_cli ;
create sequence id_sec_vent_prod;
create sequence id_sec_fact ;
create sequence id_sec_fact_det ;



alter table proveedores alter id set default nextval('id_sec_provee');
alter table productos alter id set default nextval('id_sec_produc');
alter table empleados alter id set default nextval('id_sec_empl');
alter table ventas alter id set default nextval('id_sec_vent');
alter table clientes alter id set default nextval('id_sec_cli');
alter table compras_clientes alter id set default nextval('id_sec_compr_cli');
alter table ventas_productos alter id set default nextval('id_sec_vent_prod');
alter table facturas alter id set default nextval('id_sec_fact');
alter table facturas_detalles alter id set default nextval('id_sec_fact_det');


