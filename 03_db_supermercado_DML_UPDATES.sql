
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






-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ========
-- ==================================

select * from productos;



-- Actualizamos los precios de las frutas segun el id del Proveedor
update productos set precio_unidad = (precio_unidad + 20) 
where ((id_proveedor = 8) and (grupo='Frutas'));  


-- Actualizacion de precios en base a su codigo
update productos set precio_unidad = 240
where codigo = 'AET78U9';


--Depuramos los nombres
update productos set nombre  = initcap(nombre);

-- Depuramos (AGREGAMOS nro kilogramo) en todos los registros necesarios 
update productos set nombre  = replace(nombre, 'Kg' , '1Kg');

-- Depuramos (CAMBIAMOS X de kg) en todos los registros necesarios 
update productos set nombre  = replace(nombre, 'X' , 'x');
 

-- Depuramos (CAMBIAMOS  l de Litros) en todos los registros necesarios 
update productos set nombre  = replace(nombre, '1l' , '1L');
 

--Cambiamos el Stock segun marca y gruopo
update productos set stock = 120 
where ((marca='Cuesta del Madero') and (grupo='Vinos'));


select * from productos;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ========
-- ==================================

select * from empleados;

--Depuramos los nombres
update empleados set nombre  = initcap(nombre);

--Depuramos los apellidos
update empleados set apellido  = initcap(apellido);


--Actualizamos antiguedad y sueldo de un empleado
update empleados set antiguedad='4 años y 6 meses', salario_anual = 67000
where ((nombre = 'Marcos') and (apellido='Castro') and (edad='45'));


--Actualizamos correo de un empleado
update empleados set email = 'c.gh.gustamante@gmail.com'
where ((nombre = 'Carlos') and (cargo like '%Bases de Datos%'));


select * from empleados;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA CLIENTES ========
-- ==================================

select * from clientes;

-- Actualizamos nro tel principal
update clientes set nro_tel_princ = '+5498272643'
where ((nombre='Ramiro')and(nro_doc='37849567333'));


--Actualizamos un apellido
update clientes set apellido = 'Aguleña'
where ((nombre='Sofia')and(nro_doc='3494758583'));




select * from clientes;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA FACTURAS ========
-- ==================================

select * from facturas;

--Modificamos la fecha y hora segun el codigo
update facturas set fecha = current_date, hora = current_time 
where numero = '000056';
 

-- Modificamos el importe segun el codigo de factura, agregamos iva
update facturas set importe_total = (importe_total + ((importe_total*8)/100));

select * from facturas;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ========================================
-- ======= TABLA FACTURAS_DETALLES ========
-- ========================================

select * from facturas_detalles;

--Modificamos la descripcion del pago segun el Id de la factura
update facturas_detalles set descr_pago = 'Un solo pago en efectivo'
where id_factura = 1;


-- Aumentamos un 0.45% el costo asociado
update facturas_detalles set costo_asoc = costo_asoc + ((costo_asoc*0.45)/100);



select * from facturas_detalles;





