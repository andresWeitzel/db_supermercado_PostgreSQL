# Base de Datos Gestión de Supermercado  


</br>

## Descripción 
* Base de Datos de un Supermercado para la Administración de Productos, Proveedores, Clientes, Ventas, etc.
* Se implementa con el SGDB PostgreSQL a través del GDB DBeaver y se modulariza a través del DDL, DML y QUERIES.
* Dentro del DML se modulariza la inserción, modificación y eliminación de Registros para la comprobación de funcionalidad de la db 
* No se desarrolla la sección de Administración ni Gestión de la Base de Datos (Triggers, Procedimientos Almacenados, etc)


</br>

#### Diagrama Entidad Relación  `db_supermercado`

![Index app](https://github.com/andresWeitzel/db_supermercado_tienda_online/blob/master/doc/db_supermercado_ER.png)


* DBeaver implementa la Notación IDEF1X para el Diagrama Entidad Relación. En la documentación que anexa DBeaver(https://dbeaver.com/docs/wiki/ER-Diagrams/) no está del todo claro la relación que implementa. Investigando sobre las mismas, se puede concluir que la Relación Diamante y Círculo entre línea Punteada se declara como relaciónes Opcionales.

![Index app](https://github.com/andresWeitzel/Administracion_Gestion_BasesDeDatos_PostgreSQL/blob/master/documentacion/relacionDeTablas.png)

</br>

### Vista de Registros como Ejemplificación
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

## `Documentación y Guía Del Proyecto`
#### (Esta Documentación y Guía que Desarrollé es para la Creación, Configuración, Manejo, Etc de la Base de Datos `db_supermercado` con PostgreSQL en DBeaver. Como así también sobre cuestiones de este Proyecto, Aplicaciones del Código, Descarga del Proyecto, Uso de DBeaver, Manejo de los Posibles Errores que pudiesen surgir, Manejo de Git, Consideraciones y Declaraciones del Proyecto, etc. Recomiendo Leerla y Realizar todo paso a paso como se indica en la misma, cualquier aporte o sugerencia, informar al respecto).

## Indice

  #### Sección 1) Configuración de la Base de Datos

  - [ Paso 1) Configuración y Puesta en Marcha de la Base de Datos.](#paso-1-configuración-y-puesta-en-marcha-de-la-base-de-datos-db_supermercado)

  - [ Paso 2) Ejecución de los Archivos .SQL](#paso-2-ejecución-de-los-archivos-.SQL)

  

#### Sección 2) Uso y Manejo de GIT

- [ Paso 3) Descarga y Configuración de Git](#paso-3-descarga-y-configuración-de-git)

- [ Paso 4) Subir el proyecto al repositorio de github desde la consola de git](#paso-4-subir-el-proyecto-al-repositorio-de-github-desde-la-consola-de-git)
 
- [Paso 5) Actualización del repositorio del proyecto desde la consola de GIT](#paso-5-actualización-del-repositorio-del-proyecto-desde-la-consola-de-GIT)
  


</br>

## Sección 1) Configuración de la Base de Datos

</br>

### Paso 1) Configuración y Puesta en Marcha de la Base de Datos `db_supermercado`
#### (Primeramente deberás descargar el SGDB PostgreSQL , luego algún GDB como por ej. DBeaver y crear la db ).

#### 1.1) Descarga de DBeaver
* https://dbeaver.io/
* Descargar, Ejecutar e Instalar (Siguiente, Siguiente).


#### 1.2) Descarga de PostgreSQL
*  https://www.postgresql.org/download/
*  Descargar, Ejecutar e Instalar (Siguiente, Siguiente).


#### 1.3) Configuración de PostgreSQL en DBeaver (Conexión a PostgreSQL).
* Click sobre la Pestaña Archivo.
    * --> Nuevo
    * --> Database Connection, Siguiente.
    * --> Seleccionar el SGDB PostgreSQL, Siguiente.
    * --> En el Host dejamos como aparece `localhost`
    * --> En Database dejamos como aparece `postgres`
    * --> El resto lo dejamos todo por defecto ( Host, Port, etc ).
    * --> Finalizar, asegurarse que se haya creado la conexión a Postgres correctamente
    * --> Ya está la conexión configurada.




#### 1.4) Creación de la Base de Datos `db_supermercado` en la Conexión de PostgreSQL
#### ( En DBeaver tuve problemas al incluir código sql para la creación de la db, así que vamos a crear la db manualmente)
* Una vez realizado el paso anterior, se debería haber desplegado la Conexión PostgreSQL, sino desplagar para visualizar 
*  Click Der sobre la conexión creada `postgres`
    * --> Crear, Base de Datos
    * --> En Database Name colocamos `db_supermercado`.
    * --> En owner Seleccionamos postgres o dejarlo seleccionado por defecto.
    * --> Template database vacío.
    * --> En Encoding Seleccionamos UTF8 o dejarlo seleccionado por defecto.
    * --> Tablespace pg_default o dejarlo seleccionado por defecto.
    * --> Aceptar, ya está la db creada.


#### 1.5) Creación de una Conexión Independiente de la Base de Datos `db_supermercado`
* Ya tenemos creada la conexión con Postgres y nuestra base de datos, ahora podemos crear una conexión independiente para su uso, cuestión de comodidad
* Click sobre la Pestaña Archivo.
    * --> Nuevo
    * --> Database Connection, Siguiente.
    * --> Seleccionar el SGDB PostgreSQL, Siguiente.
    * --> En Database escribimos nuestra db creada `db_supermercado`
    * --> Seguidamente vamos a agregar una contraseña, en password escribimos `postgres`
    * --> El resto lo dejamos todo por defecto ( Host, Port, etc ).
    * --> Finalizar, asegurarse que se haya creado la db con su configuración
    * --> Ya está la conexión configurada.
    * --> IMPORTANTE : Lo único configurable es `Database: db_supermercado` y `Contraseña:postgres`


</br>

### Paso 2) Ejecución de los Archivos `.SQL`
#### (Vamos a trabajar con los Archivos sql dentro de DBeaver, los mismos están enumerados para su orden de ejecución).

#### 2.1) Importamos los Archivos SQL a DBeaver
* Click sobre Archivo (Barra Superior)
    * --> Buscar Archivo Denominado..
    * --> Seleccionas los .sql y Open.
    * --> Listo
 

#### 2.2) Orden de Ejecución de los Scripts
* Cada uno de los Archivos están enumerados para que se realice el orden de ejecución correspondiente.

* 01_db_supermercado_DDL.sql
* 02_db_supermercado_DML_INSERTS.sql
* 03_db_supermercado_DML_UPDATES.sql
* 04_db_supermercado_DML_DELETES.sql
* 05_db_supermercado_DML_QUERIES.sql



</br>


## Sección 2) Uso y Manejo de Git.

</br>

### Paso 3) Descarga y Configuración de Git

#### 3.1) Descarga de Git
* Nos dirigimos a https://git-scm.com/downloads y descargamos el versionador
* Como toda aplicacion siguiente.... siguiente....
* IMPORTANTE:NO TENER DBEAVER ABIERTO DURANTE LA INSTALACION, SINO NO RECONOCE EL PATH

#### 3.2) Abrir una Consola de Git (Git Bash) desde Windows
* --> Escribimos Git Bash desde el Buscador de Windows
* --> Desde la consola escribimos el comando cd seguidamente de la ruta del proyecto
* --> Tenemos que tener la ruta del Proyecto y pegarla en el Git Bash
* --> Una vez dentro del Proyecto podremos hacer uso de Git

</br>

### Paso 4) Subir el proyecto al repositorio de github desde la consola de git 

#### 4.1) Creamos un nuevo repositorio en GitHub.

#### 4.2) Inicializamos nuestro repositorio local .git desde la terminal.
* git init

#### 4.3) Agregamos lo desarrollado a nuestro repo local desde la terminal.
* git add *

#### 4.4) Agregamos lo que tenemos en nuestro repo local al área de Trabajo desde la terminal.
* git commit -m "agrega un comentario entre comillas"

#### 4.5)  Le indicamos a git donde se va a almacenar nuestro proyecto(fijate en tu repositorio de github cual es el enlace de tu proyecto(esta en code)).
* git remote add origin https://github.com/andresWeitzel/db_supermercado

#### 4.6) Subimos nuestro proyecto.
* git push -u origin master


</br>


### Paso 5) Actualización del repositorio del proyecto desde la consola de GIT

#### 5.1) Visualizamos las modificaciones realizadas en local
* git status

#### 5.2) Agregamos lo modificado al area de trabajo
* git add *

#### 5.3) Confirmamos las modificaciones realizadas
* git commit -m "tu commit entre comillas"

#### 5.4) Sincronizamos y traemos todos los cambios del repositorio remoto a la rama en la que estemos trabajando actualmente.
##### (SOLO SI SE REALIZARON CAMBIOS DESDE OTRA LADO, ej: en github u/o/y un equipo de trabajo)
* git pull https://github.com/andresWeitzel/db_supermercado

#### 5.5) Enviamos todos los cambios locales al repo en github
* git push https://github.com/andresWeitzel/db_supermercado

#### 5.6) En casos extremos pisamos todo el repositorio
* git push -f --set-upstream origin master


</br>


