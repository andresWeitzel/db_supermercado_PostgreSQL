
/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML =============
 */

-- TABLAS

delete from productos cascade;
delete from proveedores cascade;
delete from empleados cascade;
delete from ventas cascade;
delete from clientes cascade;
delete from facturas cascade;
delete from facturas_detalles cascade;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'productos';

-- BEBIDAS
insert into productos(codigo, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
('AET78U9', 'Agua de Mesa sin Gas Nestlé Bidón 6.3L', 'Nestlé' ,'Bebidas', 'Agua' , 6.3 , 195.60 , 500 ),
('UI7R8O9', 'Vino blanco Cuesta Del Madero 750 cc.', 'Cuesta del Madero' ,'Bebidas', 'Vinos' , 0.750 , 187.75 , 200 ),
('YUT2563', 'Gaseosa cola Cunnington 2.25L', 'Cunnington' ,'Bebidas', 'Gaseosas' , 2.25 , 90.00 , 300 ),
('YUT2564', 'Gaseosa Coca Cola sabor original 1.25L', 'Coca cola' ,'Bebidas', 'Gaseosas' , 1.25 , 108.70 , 300 );


-- CARNES Y PESCADOS
insert into productos(codigo, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values 
('COPR8O6', 'Tapa de Asado de Novillo x kg', 'Genérico' ,'Carnes y Pescados', 'Carne Vacuna' , 1.00 , 649.00 , 100 ),
('HJ8R2O6', 'Medallón de pollo rebozado crocante 400 g. x 4 uni', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 0.400 , 369.00 , 100 ),
('KJ8R2O3', 'Pollo entero congelado x kg.', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 1.00 , 174.00 , 300 ),
('JJ5R333', 'Cordero entero x kg.', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 1.00 , 829.90 , 100 );


-- CONGELADOS
insert into productos(codigo, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
('KLIO837', 'Bocaditos de Pollo Swift 380g', 'Swift' ,'Congelados', 'Nuggets y Rebozados' , 0.380 , 224.71 , 250 ),
('KLK1832', 'Medallón de carne Swift receta especial reducido en grasas 4 u.', 'Swift' ,'Congelados', 'Hamburguesas' , 0.320 , 419.10 , 200 ),
('DJK7365', 'Helado Frigor dulce de leche vainilla chocolate balde 1 kg.', 'Frigor' ,'Congelados', 'Helados' , 1.00 , 850.00 , 100 ),
('DJK7366', 'Postre helado Bon O Bon dulce de leche, americana y chocolate 637 g.', 'Bon o Bon' ,'Congelados', 'Helados' , 0.637 , 529.50 , 100 );



--LACTEOS Y PRODUCTOS FRESCOS
insert into productos(codigo, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
('LL8JI9D', 'Leche Entera Larga Vida Apóstoles 1L', 'Apóstoles' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 67.15 , 500 ),
('LL8JI10', 'Leche Entera uat Larclas tetra 1L', 'Larclas' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 70.85 , 500 ),
('HJA2234', 'Yogur bebible entero Sancor yogs mult. vainilla 1 l.', 'Sancor' ,'Lácteos y Productos Frescos', 'Yogures' , 1.00 , 226.80 , 300 ),
('HJA2235', 'Yogur bebible entero Sancor yogs mult. frutilla 1 l.', 'Sancor' ,'Lácteos y Productos Frescos', 'Yogures' , 1.00 , 230.80 , 300 );



--FRUTAS Y VERDURAS
insert into productos(codigo, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
('GHT7729', 'Mandarina Nova Huella Natural', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 70.85 , 300 ),
('GHJ7711', 'Cebolla x kg', 'Genérico' ,'Frutas y Verduras', 'Verduras' , 1.00 , 48.00 , 300 ),
('LLL7465', 'Melon amarillo Huella Natural x kg.', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 140.00 , 200 ),
('EEE8277', 'Manzana roja x kg.', 'Genérico' ,'Frutas y Verduras', 'Frutas' , 1.00 , 159.00 , 100 );



select * from productos;



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'proveedores';



insert into proveedores(empresa, tipo_producto, direccion, nro_telefono_principal, nro_telefono_secundario, email)values
('Nestlé', 'Bebidas, Lácteos y Productos Frescos', 'Vicente López 223', '0800-999-8100', '0800-999-8102', 'nestle.consultas@gmail.com' ),
('Huella Natural' , 'Frutas y Verduras' , 'Av. San Viroler 222' , '237635333', '-', 'huellas.consultas@gmail.com'),
('Sancor' , 'Lacteos y Productos Frecos' , 'Av. Alvarez Jonte 3544' , '011 4072-5887', '011 4072-5885', 'sancor.consultas@gmail.com'),
('Larclas' , 'Lacteos y Productos Frecos' , 'San Rafael 345' , '011 4577-5567', '011 4577-5567', 'larclas.consultas@gmail.com');

select * from proveedores;




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'empleados';

select * from empleados;

-- Cajeros/as 
insert into empleados (nombre, apellido, edad, fecha_nacimiento, tipo_documento, nro_documento, cuil, direccion
, nro_telefono_principal, nro_telefono_secundario, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Macarena', 'Gutierrez', 32, '1989/04/06', 'DNI', '334565243', '12-334565243-7', 'Av. Gaona 352', '1164575222', '1164575222'
, 'maca.gutieerez756@hotmail.com', 'Cajera', 2 , '2019/03/01', 45000),
('Damian', 'gutierrez', 39, '1978/09/14', 'DNI', '33869556', '20-33869556-3', 'Av Alberdi 05', '+5491176844456', '+5491157684445'
, 'damian_gut.756@gmail.com', 'Cajero', 3, '2018/3/4', 139000);


-- Repositores/as
insert into empleados (nombre, apellido, edad, fecha_nacimiento, tipo_documento, nro_documento, cuil, direccion
, nro_telefono_principal, nro_telefono_secundario, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcos', 'Castro', 45, '1971/05/01', 'DNI', '48967156','33489671564', 'Figueroa Alcorta 22', '1178654356', '+5491178654356'
, 'marcosCastro2002_lop@hotmail.com', 'Repositor', 4, '2017/09/6', 150000),
('Marcelo', 'Perez', 28, '1988/03/17', 'DNI', '39345679', '12-39345679-9', 'Carabobo 06', '+5491138765433', '-'
, 'MarceloPerez@gmail.com', 'Repositor', 2, '2019/04/14', 56000);


-- Gerentes/as
insert into empleados (nombre, apellido, edad, fecha_nacimiento, tipo_documento, nro_documento, cuil, direccion
, nro_telefono_principal, nro_telefono_secundario, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcelo', 'Castro', 28, '1989/04/06', 'DNI', '39886386', '14-39886386-5', 'Los Patos 123', '+549118567453', '+549118567453'
, 'marcelocastro.746_jj@gmail.com', 'Gerente', 2, '2019/02/11', 51000);

-- Stack Tecnico
insert into empleados (nombre, apellido, edad, fecha_nacimiento, tipo_documento, nro_documento, cuil, direccion
, nro_telefono_principal, nro_telefono_secundario, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('José', 'bastituta', 34, '1988/09/07', 'DNI', '409876546', '12409876546-0', 'San Acrosio 15781', '1157670000', '+5491157670000'
, 'joseBastituta_88@gmail.com', 'Vendedor(Marketing)', 1, '2020/07/12', 65000),
('Juan', 'Contreras', 28, '1992/9/9', 'DNI', '37998637', '30-37998637-9', 'Av. Las Heras 7567', '1145367655', '-' 
, 'juanContreras.iptre@gmail.com', 'Programador Web', 4 , '2018/4/2', 78000),
('Carlos', 'Gustamante', 31, '1982/04/03', 'DNI', '290076726', '11-290076726-2', 'Av. Figueroa Alcorta 22', '1145639987', '-'
, 'c.gustamante@gmail.com', 'Admin Bases de Datos', 2, '2019/12/02', 57000);

