# Base de Datos Supermercado Tienda Online 


</br>

## Descripción 
* Base de Datos de un Supermercado para la administración de productos, proveedores, ventas, etc.
* En primera instancia esta base de datos la diseñe y desarrolle para una aplicación web cuyo estado actual es stand by.
* La db se implementa con el SGDB PostgreSQLa través de SG DBeaver y se modulariza a través del DDL, DML y QUERIES.
* No se desarrolla la sección de administración ni gestión (Triggers, Procedimientos Almacenados, etc)


</br>

#### Diagrama Entidad Relación  `db_inmobiliaria`

![Index app](https://github.com/andresWeitzel/db_supermercado_tienda_online/blob/master/doc/db_supermercado_ER.png)


* DBeaver implementa la Notación IDEF1X para el Diagrama Entidad Relación. En la documentación que anexa DBeaver(https://dbeaver.com/docs/wiki/ER-Diagrams/) no está del todo claro la relación que implementa. Investigando sobre las mismas, se puede concluir que la Relación Diamante y Círculo entre línea Punteada se declara como relaciónes Opcionales.

![Index app](https://github.com/andresWeitzel/Administracion_Gestion_BasesDeDatos_PostgreSQL/blob/master/documentacion/relacionDeTablas.png)

</br>

### Vista de Registros como ejemplificación
#### Listado de productos de la Tabla  `productos`

![Index app](https://github.com/andresWeitzel/db_supermercado_tienda_online/blob/master/doc/listado_productos.png)

</br>

#### Listado de empleados de la Tabla  `empleados`

![Index app](https://github.com/andresWeitzel/db_supermercado_tienda_online/blob/master/doc/listado_empleados.png)


<hr>

## Más Información

</br>


| **Tecnologías Empleadas** | **Versión** | **Finalidad** |               
| ------------- | ------------- | ------------- |
| PostgreSQL | 13.4  | SGDB  |
| DBeaver | 21.1  | Gestor de Base de Datos | 
| Git Bash | 2.29.1  | Control de Versiones |
| CMD | 10 | Manipular los Servicios de Postgres mediante linea de comandos | 

</br>


## Descarga y Documentacion de las Tecnologías Empleadas:

</br>

| **Tecnologías** | **Descarga** | **Documentación** |               
| ------------- | ------------- | ------------- |
| Git Bash |  https://git-scm.com/downloads |   https://git-scm.com/docs |
| PostgreSQL |  https://www.postgresql.org/download/  | https://www.postgresql.org/docs/current/tutorial.html  |
| DBeaver | https://dbeaver.io/download/  | https://github.com/dbeaver/dbeaver/wiki | 

</br>

## Bibliografía Recomendada

* https://www.postgresqltutorial.com/postgresql-string-functions/
* http://es.tldp.org/Postgresql-es/web/navegable/user/x2341.html
* https://www.postgresql.org/docs/9.1/functions-string.html
* https://microbuffer.wordpress.com/2011/04/12/funciones-con-strings-en-postgresql/
* https://www.postgresql.org/docs/8.2/functions-sequence.html




<hr>
