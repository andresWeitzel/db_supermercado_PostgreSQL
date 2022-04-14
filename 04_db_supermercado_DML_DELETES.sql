/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML DELETES =============
 */





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================

select * from proveedores;

delete from proveedores where id = 5;


insert into proveedores(empresa, tipo_producto, direccion, nro_tel_princ, nro_tel_sec, email)values
('Cunnington' , 'Bebidas' , '-' , '-', '-', '-');

update proveedores set 
direccion='Geneal San Vicente 397'
, nro_tel_princ ='6374-648'
,email='consultas.cunnington.2022@gmail.com'
where id = 9;

select * from proveedores;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ========
-- ==================================

select * from productos;

--Eliminamos el Producto cuya marca sea Apóstoles y cuyo grupo sea Leches
delete from productos where ((marca ='Apóstoles')and (grupo = 'Leches'));



--LACTEOS Y PRODUCTOS FRESCOS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(8,'LL8JI9D', 'https://jumboargentina.vtexassets.com/arquivos/ids/641230-1200-auto?v=637557810525130000&width=1200&height=auto&aspect=true' ,'Leche Entera Larga Vida Apóstoles 1L', 'Apóstoles' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 67.15 , 500 );


select * from productos;




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ========
-- ==================================

select * from empleados;


--Eliminamos el empleado cuyo nro_doc sea 39345679
delete from empleados where nro_doc = '39345679';



insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcelo', 'Perez', 28, '1988/03/17', 'DNI', '39345679', '12-39345679-9', 'Carabobo 06', '+5491138765433', '-'
, 'MarceloPerez@gmail.com', 'Repositor', '9 meses', '2019/04/14', 56000);


select * from empleados;



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA CLIENTES ========
-- ==================================

select * from clientes;


--Eliminamos un empleado por su nombre y nro de doc
delete from clientes where (nombre='Sofia' and nro_doc='3494758583');




insert into clientes (nombre, apellido, tipo_doc, nro_doc, nro_tel_princ
, nro_tel_sec, email) values
('Sofia','Aguilar','DNI','3494758583','+549116475834','-','sofi-aguilar-cordoba@hotmail.com');





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ===============================
-- ======= TABLA FACTURAS ========
-- ===============================

select * from facturas;



--Eliminamos una factura por su numero
delete from facturas where (numero='000056');


insert into facturas(numero, codigo, fecha, hora, importe_total) values
('000058','000068695',current_date,current_time, 8900);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ========================================
-- ======= TABLA FACTURAS_DETALLES ========
-- ========================================

select * from facturas_detalles;

--Eliminamos el detalle de factura por su id de factura
delete from facturas_detalles where (id_factura=2);

select * from facturas;

insert into facturas_detalles(id_factura , tipo , descr_factura , costo_asoc , iva , medio_de_pago ,descr_pago) values
(2, 'B' , 'Consumidor Final' , 86 , 8 , 'TARJETA CREDITO','Un solo Pago');


select * from facturas_detalles;

