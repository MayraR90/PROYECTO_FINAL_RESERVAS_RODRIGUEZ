# PROYECTO_FINAL_RESERVAS_RODRIGUEZ


--- 

## **PROYECTO FINAL**

**CURSO:** *SQL*

**ALUMNA**: *RODRIGUEZ, MAYRA ALEJANDRA*

**COMISIÓN:** *57190* 

**TUTOR:** *ARIEL ANNONE*

**DOCENTE:** *ANDERSON MICHEL TORRES*

---
## PROBLEMA
*Se está desarrollando un sistema de gestión de reservas de las actividades para un club con varias sedes, que permita poder  manejar todas las operaciones relacionadas con las mismas.*

## DESCRIPCIÓN DEL PROBLEMA
***1. Gestión de socios y actividades:** Necesitamos una base de datos que nos permita registrar la información de los socios y de las actividades que reservan en cada una de las sedes.*

***2. Gestión de reservas y disponibilidad:** La base de datos debe permitirnos registrar la disponibilidad de las reservas de cada actividad. Esto nos permitirá evitar conflictos de reservas.*

***3. Registro de reservas:** Necesitamos un sistema que pueda registrar de manera detallada cada reserva realizada.*

## DESCRIPCIÓN
*Necesitamos una base de la base para nuestros clubles que permita registrar las reservas que realizan los socios para las actividades que brindamos  todos los días.*


## TABLAS

**1. SOCIOS**
- *Almacena información sobre los socios que realizan reservas.*
- ***Atributos:** ID_SOCIO (PK), NOMBRE, APELLIDO, DNI, TELÉFONO, EMAIL Y FECHA_ALTA.*

**2. RESERVAS**
- *Registra las reservas realizadas por los socios del club.*
- ***Atributos:** ID_RESERVA (PK), FECHA_HORA, CANCELACIÓN, ID_SOCIO (FK) , ID_ACTIVIDAD (FK), ID_PROFESOR (FK) Y ID_SEDE (FK).*
  
**3. ACTIVIDADES**
- *Contiene información sobre las actividades disponibles en el club.*
- ***Atributos:** ID_ACTIVIDAD (PK), NOMBRE, FECHA_HORA, DISPONIBILIDAD Y ID_PROFESOR (FK).*

**4. UBICACIÓN**
- *Contiene información de las sedes que tenemos sobre las cuáles se realizarán las reservas de las actividades.*
- ***Atributos:** ID_SEDE (PK), DIRECCIÓN, TELÉFONO y ID_DUEÑO (FK).*

**5. DUEÑO**
- *Contiene información de los dueños de cada una de nuestras sedes.*
- ***Atributos:** ID_DUEÑO (PK), NOMBRE, APELLIDO, TELÉFONO.*


**6. PROFESORES.**
- *Contiene información de los profesores que realizan las actividades en nuestras sedes.*
- ***Atributos:** ID_PROFESOR (PK), NOMBRES, APELLIDO, DNI, TELÉFONO, ALTA, ID_ACTIVIDAD (FK), ID_SEDE (FK).*
 

----------------------------------------------------------------------------------------

**VISTAS.**

VISTA N° 1:

CREAREMOS UNA VISTA QUE SE OCUPE DE MOSTRARNOS LAS ALTAS DE LOS SOCIOS ENTRE EL 01/01/2024 Y 30/06/2024.PARA ESO UTILIZAREMOS LA TABLA “SOCIOS” Y EL ID SOCIO,NOMBRE, APELLIDO Y FECHA DE ALTA.


VISTA N° 2:

PARA VISUALIZAR LAS RESERVAS QUE SE REALIZAN SOBRE LA ACTIVIDAD “FÚTBOL” EN LAS DISTINTAS SEDES.UTILIZAREMOS LA TABLA “RESERVAS” Y EL ID RESERVAS, ID ACTIVIDAD (ID 12) E ID SEDE.


VISTA N° 3:

NECESITAMOS SABER LOS NOMBRES DE LOS  PROFESORES DICTAN LA ACTIVIDAD “SPINNING” Y EL DOMICILIO DE LA SEDE. PARA ESTO,NECESITAMOS UTILIZAR LA TABLA “ACTIVIDADES”,“PROFESOR”  Y “SEDE” CON  ID ACTIVIDAD, NOMBRE (“SPINNING”),APELLIDO  DEL PROFESOR Y DOMICILIO.


VISTA N° 4:

CREAMOS UNA VISTA PARA SABER CUÁNTOS PROFESORES TENEMOS EN CADA UNA DE NUESTRAS SEDES Y QUÉ ACTIVIDADES DICTAN.PARA ELLO,NECESITAMOS UTILIZAR LAS TABLAS “SEDE”, “PROFESORES” Y “ACTIVIDADES” CON EL ID SEDE,NOMBRE DEL PROFESOR Y LA ACTIVIDAD.

VISTA N° 5:

NECESITAMOS SABER LA DISPONIBILIDAD CON LA QUE CONTAMOS PARA LA ACTIVIDAD “PILATES”.
UTILIZAREMOS LAS TABLAS “RESERVAS”, “ACTIVIDADES” Y “SEDE” CON EL ID ACTIVIDAD, NOMBRE, FECHA Y HORA Y LA DIRECCIÓN DE LA SEDE  PARA VISUALIZAR ESTA INFORMACIÓN.


VISTA N° 6:

CREAMOS UNA VISTA QUE SE ENCARGUE DE MOSTRARNOS LAS ACTIVIDADES QUE DICTAMOS UTILIZANDO LA TABLA “ACTIVIDADES” CON EL ID ACTIVIDADES Y EL NOMBRE.



--------------------------------------------------------------------
**FUNCIONES**

1. FUNCIÓN PARA CONTAR EL NÚMERO DE RESERVAS DE UN SOCIO ESPECÍFICO:ESTA FUNCIÓN TOMARÁ EL ID DE UN SOCIO Y DEVOLVERÁ EL NÚMERO DE RESERVAS QUE HA HECHO.
SE USARÁ LA TABLA “RESERVAS” PARA BRINDAR ESTA INFORMACIÓN.

2. FUNCIÓN PARA OBTENER EL NOMBRE COMPLETO DE UN PROFESOR QUE DICTA UNA ACTIVIDAD ESPECÍFICA:ESTA FUNCIÓN TOMARÁ EL NOMBRE DE UNA ACTIVIDAD Y DEVOLVERÁ EL NOMBRE COMPLETO DEL PROFESOR QUE LA DICTA. UTILIZANDO LAS TABLAS “ACTIVIDADES” Y “PROFESORES”.

3. FUNCIÓN PARA OBTENER LA DIRECCIÓN DE LA SEDE DONDE UN PROFESOR DICTA UNA ACTIVIDAD:ESTA FUNCIÓN TOMARÁ EL ID DE UN PROFESOR Y DEVOLVERÁ LA DIRECCIÓN DE LA SEDE DONDE DICTA UNA ACTIVIDAD. USANDO INFORMACIÓN DE LAS TABLAS “SEDE” Y “PROFESORES”.


--------------------------------------------------------------------
**STORED PROCEDURES.**


1. PROCEDIMIENTO PARA INSERTAR UN NUEVO SOCIO:ESTE PROCEDIMIENTO ALMACENADO INSERTA UN NUEVO REGISTRO EN LA TABLA SOCIOS.

2. PROCEDIMIENTO PARA ACTUALIZAR LA DISPONIBILIDAD DE UNA ACTIVIDAD:ESTE PROCEDIMIENTO ALMACENADO ACTUALIZA EL ESTADO DE DISPONIBILIDAD DE UNA ACTIVIDAD ESPECÍFICA.

3. PROCEDIMIENTO PARA ACTUALIZAR LA INFORMACIÓN DE UN SOCIO:ESTE PROCEDIMIENTO ALMACENADO ACTUALIZA LA INFORMACIÓN DE UN SOCIO EN LA TABLA SOCIOS.

---

**TRIGGERS.**

ESTOS TRIGGERS NOS PERMITEN AUTOMATIZAR ALGUNAS TAREAS EN LA BASE DE DATOS COMO LA PREVENCIÓN DE ERRORES Y DUPLICADO DE RESERVAS.

 
* EJEMPLO N° 1: ESTE TRIGGER NOS AYUDA A EVITAR DUPLICADOS DE DNI ENTRE TABLAS. SE ACTIVA ANTES DE INSERTAR UN NUEVO REGISTRO EN LA TABLA PROFESORES Y VERIFICA QUE EL DNI NO ESTÉ DUPLICADO EN LA TABLA SOCIOS.

![image](https://github.com/user-attachments/assets/48f25da3-cebb-4152-96c6-e7fa5da84329)

 
SE USARÁ A MODO DE EJEMPLO LA SIGUIENTE INSERCIÓN DE DATOS PARA VERIFICAR EL TRIGGER. CUYA INSERCIÓN NO SERÁ EXITOSA DEBIDO A QUE EL DNI PERTENECE A UN SOCIO.

![image](https://github.com/user-attachments/assets/2370f698-a6a6-41c0-b3dd-932bde4cf205)


* EJEMPLO N° 2: EVITAR LA DUPLICACIÓN DE CORREOS ELECTRÓNICOS EN LA TABLA SOCIOS.ESTE TRIGGER SE ASEGURA DE QUE CADA CORREO ELECTRÓNICO EN LA TABLA SEA ÚNICO,ES DECIR, QUE NO HAYA DOS SOCIOS CON EL MISMO CORREO REGISTRADO. 


![image](https://github.com/user-attachments/assets/4eacf5ea-ba81-4215-a651-89f36257d36e)

SE USARÁ A MODO DE EJEMPLO LA SIGUIENTE INSERCIÓN DE DATOS,USANDO EL MAIL DE LA SOCIA VALERIA MORENO,CUOYO MAIL ES 'valeria19@example.com'.

![image](https://github.com/user-attachments/assets/dbee0c1f-1346-4d1b-aff6-fe1fed41bbee)

El mismo nos dará el error: 'El correo electrónico ya está registrado en otro socio'

--- 
**ROLES Y USUARIOS.**

ROLES:
1. Rol administrativo.

Este rol tiene control total sobre todas las tablas y puede realizar cualquier operación, incluyendo la creación, modificación, y eliminación de tablas, así como la administración de usuarios y roles.

Usuario: admin_user

2. Rol de gestor de reservas.

Este rol se encarga de gestionar las reservas, así como de actualizar información relacionada con los socios y las actividades.

Usuario: reservas_manager

3. Rol de gestor de sedes.
   
Administra la información relacionada con las sedes y los dueños. Puede agregar nuevas sedes y dueños, así como modificar y eliminar los registros existentes.

Usuario: sedes_manager

4. Rol de gestor de profesores
   
Permite gestionar la información de los profesores, incluyendo su asignación a actividades y sedes.

 Usuario: profesores_manager
 
5. Rol de socio
   
Este rol tiene permisos limitados para actualizar solo la información de los socios y consultar datos relacionados con sus reservas y actividades.

Usuario: servicio_socio


SE PROCEDE A CREAR LOS USUARIOS:

![image](https://github.com/user-attachments/assets/92095353-8872-429e-b1a2-b5efa0196a40)


Y LUEGO,LOS ROLES:

![image](https://github.com/user-attachments/assets/7172d838-0842-4d4b-8488-90dc5b12de47)


ASIGNACIÓN DE ROLES:
1. Rol administrativo con permisos completos

![image](https://github.com/user-attachments/assets/9e5cd3be-5a6e-4cb6-b4ad-88b8f69caf19)


2. Rol de gestor de reservas

![image](https://github.com/user-attachments/assets/cf582921-f5a3-44c6-a86c-35c673a0767c)

3. Rol de gestor de sedes

![image](https://github.com/user-attachments/assets/68a335fb-13f0-4dda-91e8-45e35f3ba6d4)

4. Rol de gestor de profesores

![image](https://github.com/user-attachments/assets/f6c5d70a-777e-4512-acac-bbce8019d094)


5. Rol de socio con permisos limitados

![image](https://github.com/user-attachments/assets/024816dd-7633-4c90-9931-7aef3a97e4e3)

ASIGNACIÓN DE ROLES A USUARIOS.

![image](https://github.com/user-attachments/assets/4553e4bc-bbee-4a02-bbbd-2eb21c2a90b9)





Una vez creados los roles, usarios y asignaciones, se activan los roles y se actualizan los privilegios con los siguientes comandos:

Se  activarán los diferentes roles:

    --SET ROLE ALL;


Y luego, se actualizarán los privilegios en el servidor
                          
    --FLUSH PRIVILEGES;

--- 
**LENGUAJE DE CONTROL DE TRANSACCIONES (TCL):APLICADO A STORE PROCEDURES.**

EJEMPLO N° 1:insertar_socio.

DESCRIPCIÓN: ASEGURA QUE LA INSERCIÓN DE UN NUEVO SOCIO EN LA TABLA SOCIOS SE REALICE CORRECTAMENTE.

![image](https://github.com/user-attachments/assets/b1536e96-46c1-4fe3-9595-081e1b76ea4b)


EJEMPLO N°2:actualizar_socio

DESCRIPCIÓN:ASEGURA QUE LA ACTUALIZACIÓN DE LA INFORMACIÓN DE UN SOCIO EN LA TABLA SOCIOS SE REALICE CORRECTAMENTE.

![image](https://github.com/user-attachments/assets/27e287b9-9b78-433a-911a-4ca05840ff4a)


---
**BACKUP**

![image](https://github.com/user-attachments/assets/64181c00-3ca5-4583-b520-949848a1c783)

![image](https://github.com/user-attachments/assets/03096364-113c-4ac0-97b7-d69c06dec3e6)

![image](https://github.com/user-attachments/assets/d28aed15-f8b2-4bf8-a1a9-577d99bc476e)



Herramientas adicionales: | ChatGPT | Excalidraw
