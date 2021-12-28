
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


insert into productos(codigo, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
('AET78U9', 'Agua de Mesa sin Gas Nestlé Bidón 6.3L', 'Nestlé' ,'Bebidas', 'Agua' , 6.3 , 195.60 , 500 ),
('UI7R8O9', 'Vino blanco Cuesta Del Madero 750 cc.', 'Cuesta del Madero' ,'Bebidas', 'Vinos' , 0.750 , 187.75 , 200 ),
('COPR8O6', 'Tapa de Asado de Novillo x kg', 'Genérico' ,'Carnes y Pescados', 'Carne Vacuna' , 1.00 , 649.00 , 100 ),
('KLIO837', 'Bocaditos de Pollo Swift 380g', 'Swift' ,'Congelados', 'Nuggets y Rebozados' , 0.380 , 224.71 , 250 ),
('LL8JI9D', 'Leche Entera Larga Vida Apóstoles 1L', 'Apóstoles' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 67.15 , 500 ),
('LL8JI10', 'Leche Entera uat Larclas tetra 1L', 'Larclas' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 70.85 , 500 ),
('GHT7729', 'Mandarina Nova Huella Natural', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 70.85 , 300 ),
('GHJ7711', 'Cebolla x kg', 'Genérico' ,'Frutas y Verduras', 'Verduras' , 1.00 , 48.00 , 300 );

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
('Huella Natural' , 'Frutas y Verduras' , 'Av. San Viroler 222' , '237635333', '-', 'huellas.consultas@gmail.com');

select * from proveedores;
