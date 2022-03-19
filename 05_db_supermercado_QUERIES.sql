/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= QUERIES =============
 */



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================

select * from proveedores;

-- Proveedores ordenados por Empresa 
select * from proveedores order by empresa;

-- Proveedores cuyos Productos sean Bebidas
select * from proveedores where 
tipo_producto like '%Bebidas%' or 
tipo_producto like '%bebidas%';

-- Productos que sean Verduras o Frutas
select * from proveedores where 
tipo_producto like '%Verduras%' or
tipo_producto like '%Frutas%';

-- Productos que sean Lacteos
select * from proveedores where 
tipo_producto like '%Lacteos%';




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ================================
-- ======= TABLA PRODUCTOS ========
-- ================================

select * from productos;
select * from proveedores;


--Productos Ordenados por Id del Proveedor
select * from productos order by id_proveedor;


--Productos cuyo Proveedor sea Nestle
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Nestlé';


--Productos cuyo Proveedor sea Huella Natural
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Huella Natural';


--Productos cuyo Proveedor sea Huella Natural con stock menor de 100
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where ((proveedores.empresa = 'Huella Natural') and 
(productos.stock <= 100));


--Productos cuyo Proveedor sea Huella Natural con stock mayor de 100
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where ((proveedores.empresa = 'Huella Natural') and 
(productos.stock >= 100));


--Productos cuyo Proveedor no tenga especificacion con stock mayor a 200
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where ((proveedores.empresa = 'Sin Especificar') and 
(productos.stock >= 200));



