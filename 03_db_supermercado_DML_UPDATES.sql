
/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML UPDATES =============
 */



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================

select * from proveedores;

-- Actualizamos un registro completo
update proveedores set 
direccion='Geneal San Vicente 397'
, nro_tel_princ ='6374-648'
,email='consultas.cunnington.2022@gmail.com'
where id = 5;


-- Depuramos (TIPOGRAFIA) todos los registros del campo empresa
update proveedores set empresa = initcap(empresa);
	
-- Depuramos (TIPOGRAFIA) todos los registros del campo tipo_producto 
update proveedores set tipo_producto  = initcap(tipo_producto);
	
-- Depuramos (QUITAMOS COMAS) todos los registros del campo tipo_producto 
update proveedores set tipo_producto  = replace(tipo_producto, ',' , '-');

-- Depuramos (QUITAMOS las Y) todos los registros del campo tipo_producto 
update proveedores set tipo_producto  = replace(tipo_producto, 'Y' , '-');
	
select * from proveedores;



