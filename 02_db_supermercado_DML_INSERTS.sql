
/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML INSERTS =============
 */

-- TABLAS
delete  from compras_clientes cascade;
delete  from ventas_productos cascade;
delete  from ventas cascade;
delete  from productos cascade;
delete  from proveedores cascade;
delete  from facturas_detalles cascade;
delete  from facturas cascade;
delete  from empleados cascade;
delete  from clientes cascade;


-- Alteramos la secuencia auto incrementable id 
alter sequence id_sec_provee restart with 1;
alter sequence id_sec_produc restart with 1;
alter sequence id_sec_empl restart with 1;
alter sequence id_sec_vent restart with 1;
alter sequence id_sec_cli restart with 1;
alter sequence id_sec_compr_cli restart with 1;
alter sequence id_sec_vent_prod restart with 1;
alter sequence id_sec_fact restart with 1;
alter sequence id_sec_fact_det restart with 1;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'proveedores';



insert into proveedores(empresa, tipo_producto, direccion, nro_tel_princ, nro_tel_sec, email)values
('Nestlé', 'Bebidas, Lácteos y Productos Frescos', 'Vicente López 223', '0800-999-8100', '0800-999-8102', 'nestle.consultas@gmail.com' ),
('Huella Natural' , 'Frutas y Verduras' , 'Av. San Viroler 222' , '237635333', '-', 'huellas.consultas@gmail.com'),
('Sancor' , 'Lacteos y Productos Frecos' , 'Av. Alvarez Jonte 3544' , '011 4072-5887', '011 4072-5885', 'sancor.consultas@gmail.com'),
('Cuesta del Madero' , 'Bebidas' , 'Las Caremorias 222' , '011 4567-3744', '-', 'cuestaDelMadero.consultas@gmail.com'),
('Cunnington' , 'Bebidas' , '-' , '-', '-', '-'),
('Coca-Cola' , 'Bebidas' , 'Av. Entre Ríos 221' , '4567-0989', '4635-2843', 'coca.cola.company@gmail.com'),
('Larclas' , 'Lacteos y Productos Frecos' , 'San Rafael 345' , '011 4577-5567', '011 4577-5567', 'larclas.consultas@gmail.com'),
('Sin Especificar' , 'Sin Especificar' , 'Sin Especificar' , 'Sin Especificar', 'Sin Especificar', 'Sin Especificar');

select * from proveedores;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'productos';

-- BEBIDAS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(1,'AET78U9', 'https://http2.mlstatic.com/D_NQ_NP_792586-MLA47682120282_092021-O.webp' ,  'Agua de Mesa sin Gas Nestlé Bidón 6.3L', 'Nestlé' ,'Bebidas', 'Agua' , 6.3 , 195.60 , 500 ),
(4,'UI7R8O9', 'https://http2.mlstatic.com/D_NQ_NP_916232-MLA43940685535_102020-V.webp', 'Vino blanco Cuesta Del Madero 750 cc.', 'Cuesta del Madero' ,'Bebidas', 'Vinos' , 0.750 , 187.75 , 200 ),
(5,'YUT2563','https://ardiaprod.vteximg.com.br/arquivos/ids/189380-1000-1000/Gaseosa-Cola-Cunnington-225-Lts-_1.jpg?v=637443308163370000' , 'Gaseosa cola Cunnington 2.25L', 'Cunnington' ,'Bebidas', 'Gaseosas' , 2.25 , 90.00 , 300 ),
(6,'YUT2564', 'https://http2.mlstatic.com/D_NQ_NP_864108-MLA45225461317_032021-O.webp' , 'Gaseosa Coca Cola sabor original 1.25L', 'Coca cola' ,'Bebidas', 'Gaseosas' , 1.25 , 108.70 , 300 );


-- CARNES Y PESCADOS
insert into productos(id_proveedor,codigo, imagen , nombre, marca, tipo, grupo, peso, precio_unidad, stock) values 
(8,'COPR8O6', 'https://d3ugyf2ht6aenh.cloudfront.net/stores/861/458/products/tapa-de-asado1-5eb3e89c1d76286a6815702030218736-480-0.jpg' ,'Tapa de Asado de Novillo x kg', 'Genérico' ,'Carnes y Pescados', 'Carne Vacuna' , 1.00 , 649.00 , 100 ),
(8,'HJ8R2O6', 'https://t2.rg.ltmcdn.com/es/images/8/7/0/img_medallones_de_pollo_33078_orig.jpg' , 'Medallón de pollo rebozado crocante 400 g. x 4 uni', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 0.400 , 369.00 , 100 ),
(8,'KJ8R2O3', 'https://calisa.com.ar/wp-content/uploads/2020/03/pollo_con_menudos.png' ,'Pollo entero congelado x kg.', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 1.00 , 174.00 , 300 ),
(8,'JJ5R333', 'https://www.terravilena.es/wp-content/uploads/2019/11/cordero.jpg' ,'Cordero entero x kg.', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 1.00 , 829.90 , 100 );


-- CONGELADOS
insert into productos(id_proveedor,codigo, imagen,  nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(8,'KLIO837', 'https://ardiaprod.vteximg.com.br/arquivos/ids/186555-1000-1000/Bocaditos-de-Pollo--Swift-380-Gr-_1.jpg?v=637427588306630000' ,'Bocaditos de Pollo Swift 380g', 'Swift' ,'Congelados', 'Nuggets y Rebozados' , 0.380 , 224.71 , 250 ),
(8,'KLK1832', 'https://jumboargentina.vtexassets.com/arquivos/ids/339785-1200-auto?v=636439393168030000&width=1200&height=auto&aspect=true' ,'Medallón de carne Swift receta especial reducido en grasas 4 u.', 'Swift' ,'Congelados', 'Hamburguesas' , 0.320 , 419.10 , 200 ),
(8,'DJK7365', 'https://walmartar.vteximg.com.br/arquivos/ids/909547-292-292/Helado-Frigor-Dulce-De-Leche-Frutilla-Chocolate-1-Kg-1-484640.jpg?v=637715616644530000' ,'Helado Frigor dulce de leche vainilla chocolate balde 1 kg.', 'Frigor' ,'Congelados', 'Helados' , 1.00 , 850.00 , 100 ),
(8,'DJK7366', 'https://alohamaxikiosco.com.ar/wp-content/uploads/2020/08/postre-bon-o-bon-2.jpg','Postre helado Bon O Bon dulce de leche, americana y chocolate 637 g.', 'Bon o Bon' ,'Congelados', 'Helados' , 0.637 , 529.50 , 100 );



--LACTEOS Y PRODUCTOS FRESCOS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(8,'LL8JI9D', 'https://jumboargentina.vtexassets.com/arquivos/ids/641230-1200-auto?v=637557810525130000&width=1200&height=auto&aspect=true' ,'Leche Entera Larga Vida Apóstoles 1L', 'Apóstoles' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 67.15 , 500 ),
(7,'LL8JI10', 'https://carrefourar.vtexassets.com/arquivos/ids/204565/7794710010406_02.jpg?v=637592985140930000' ,'Leche Entera uat Larclas tetra 1L', 'Larclas' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 70.85 , 500 ),
(3,'HJA2234', 'https://arikiosco.tiendalite.com/images/products/500/86749394-1266.png' ,'Yogur bebible entero Sancor yogs mult. vainilla 1 l.', 'Sancor' ,'Lácteos y Productos Frescos', 'Yogures' , 1.00 , 226.80 , 300 ),
(3,'HJA2235', 'https://tunovo.com.ar/wp-content/uploads/7790080064223_01.jpg' ,'Yogur bebible entero Sancor yogs mult. frutilla 1 l.', 'Sancor' ,'Lácteos y Productos Frescos', 'Yogures' , 1.00 , 230.80 , 300 );



--FRUTAS Y VERDURAS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(2,'GHT7729', 'https://http2.mlstatic.com/D_NQ_NP_999322-MLA46496226700_062021-O.webp' ,'Mandarina Nova Huella Natural', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 70.85 , 300 ),
(8,'GHJ7711', 'https://http2.mlstatic.com/D_NQ_NP_914650-MLA31037009580_062019-O.webp' ,'Cebolla x kg', 'Genérico' ,'Frutas y Verduras', 'Verduras' , 1.00 , 48.00 , 300 ),
(2,'LLL7465', 'https://http2.mlstatic.com/D_NQ_NP_678730-MLA47346843510_092021-O.webp' ,'Melon amarillo Huella Natural x kg.', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 140.00 , 200 ),
(8,'EEE8277', 'https://elegifruta.com.ar/onepage/wp-content/uploads/2017/07/manzana_roja.jpg' ,'Manzana roja x kg.', 'Genérico' ,'Frutas y Verduras', 'Frutas' , 1.00 , 159.00 , 100 );



select * from productos;



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'empleados';

select * from empleados;

-- Cajeros/as 
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Macarena', 'Gutierrez', 32, '1989/04/06', 'DNI', '334565243', '12-334565243-7', 'Av. Gaona 352', '1164575222', '1164575222'
, 'maca.gutieerez756@hotmail.com', 'Cajera', '2 años' , '2019/03/01', 45000),
('Damian', 'gutierrez', 39, '1978/09/14', 'DNI', '33869556', '20-33869556-3', 'Av Alberdi 05', '+5491176844456', '+5491157684445'
, 'damian_gut.756@gmail.com', 'Cajero', '3 años y 6 meses', '2018/3/4', 65000);


-- Repositores/as
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcos', 'Castro', 45, '1971/05/01', 'DNI', '48967156','33489671564', 'Figueroa Alcorta 22', '1178654356', '+5491178654356'
, 'marcosCastro2002_lop@hotmail.com', 'Repositor', '4 añs', '2017/09/6', 70000),
('Marcelo', 'Perez', 28, '1988/03/17', 'DNI', '39345679', '12-39345679-9', 'Carabobo 06', '+5491138765433', '-'
, 'MarceloPerez@gmail.com', 'Repositor', '9 meses', '2019/04/14', 56000);


-- Gerentes/as
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcelo', 'Castro', 28, '1989/04/06', 'DNI', '39886386', '14-39886386-5', 'Los Patos 123', '+549118567453', '+549118567453'
, 'marcelocastro.746_jj@gmail.com', 'Gerente', '2 años y 5 meses', '2019/02/11', 120000);

-- Stack Tecnico
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('José', 'bastituta', 34, '1988/09/07', 'DNI', '409876546', '12409876546-0', 'San Acrosio 15781', '1157670000', '+5491157670000'
, 'joseBastituta_88@gmail.com', 'Vendedor(Marketing)', '10 meses', '2020/07/12', 65000),
('Juan', 'Contreras', 28, '1992/9/9', 'DNI', '37998637', '30-37998637-9', 'Av. Las Heras 7567', '1145367655', '-' 
, 'juanContreras.iptre@gmail.com', 'Programador Web', '4 meses' , '2018/4/2', 87000),
('Carlos', 'Gustamante', 31, '1982/04/03', 'DNI', '290076726', '11-290076726-2', 'Av. Figueroa Alcorta 22', '1145639987', '-'
, 'c.gustamante@gmail.com', 'Admin Bases de Datos', '1 año y medio', '2019/12/02', 100000);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA CLIENTES ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'clientes';

select * from clientes;

insert into clientes (nombre, apellido, tipo_doc, nro_doc, nro_tel_princ
, nro_tel_sec, email) values
('Martin','Gutierrez','DNI','4598676890','+549116574839','-','martin.gutierrez@gmail.com'),
('Sofia','Aguilar','DNI','3494758583','+549116475834','-','sofi-aguilar-cordoba@hotmail.com'),
('Ramiro','Martinez','DNI','37849567333','-','-','ramiroMartinez3564@gmail.com');



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA FACTURAS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'facturas';

select * from facturas;

insert into facturas(numero, codigo, fecha, hora, importe_total) values
( '000056','000067352',current_date,current_time, 3000),
( '000057','000067673',current_date,current_time, 1200),
( '000058','000067645',current_date,current_time, 3400);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ===========================================
-- ======= TABLA FACTURAS_DETALLES ===========
-- ===========================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'facturas_detalles';

select * from facturas_detalles;

insert into facturas_detalles(id_factura , tipo , descr_factura , costo_asoc , iva , medio_de_pago ,descr_pago) values
(1, 'B' , 'Consumidor Final' , 86 , 8, 'EFECTIVO', 'Un Solo Pago'),
(2, 'B' , 'Consumidor Final' , 86 , 8 , 'TARJETA CREDITO','Un solo Pago'),
(3, 'B' , 'Consumidor Final' , 86 , 8 , 'TARJETA DEBITO','Un solo Pago');





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA VENTAS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'ventas';

select * from ventas;

insert into ventas(id_empleado, id_factura ) values 
(1,1),
(1,2),
(2,3);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==========================================
-- ======= TABLA VENTAS_PRODUCTOS ===========
-- ==========================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'ventas_productos';

select * from ventas_productos;

insert into ventas_productos(id_venta, id_producto, cantidad) values 
(1,1,4),
(1,2,5),
(1,3,5),
(2,2,2),
(2,3,4),
(2,5,5);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==========================================
-- ======= TABLA COMPRAS_CLIENTES ===========
-- ==========================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'compras_clientes';

select * from compras_clientes;

insert into compras_clientes(id_venta,  id_cliente) values 
(1,1),
(2,2);


