# PROYECTO_FINAL_RESERVAS_RODRIGUEZ


--- 

## **PROYECTO FINAL**

**CURSO:** *SQL*

**ALUMNA**: *RODRIGUEZ, MAYRA ALEJANDRA*

**COMISIÓN:** *57190* 

**TUTOR:** *ARIEL ANNONE*

**DOCENTE:** *ANDERSON MICHEL TORRES*

---

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

-- ESTOS TRIGGERS NOS PERMITEN AUTOMATIZAR ALGUNAS TAREAS EN LA BASE DE DATOS COMO LA PREVENCIÓN DE ERRORES Y DUPLICADO DE RESERVAS.


-- EJEMPLO N° 1: ESTE TRIGGER NOS AYUDA A EVITAR DUPLICADOS DE DNI ENTRE TABLAS. SE ACTIVA ANTES DE INSERTAR UN NUEVO REGISTRO EN LA TABLA PROFESORES Y VERIFICA QUE EL DNI NO ESTÉ DUPLICADO EN LA TABLA SOCIOS.

DROP TRIGGER IF EXISTS VERIFICAR_DNI_UNICO;

DELIMITER //

CREATE TRIGGER VERIFICAR_DNI_UNICO
BEFORE INSERT ON PROFESORES
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM SOCIOS WHERE DNI = NEW.DNI) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL DNI YA EXISTE EN LA TABLA SOCIOS';
    END IF;
END //

DELIMITER ;

-- Se usará a modo de ejemplo la siguiente inserción de datos para verificar el trigger.Cuya inserción no será exitosa debido a que el dni pertenece a un socio. 

INSERT INTO PROFESORES (NOMBRES, APELLIDO, DNI, TELEFONO, ALTA, ID_ACTIVIDAD, ID_SEDE)

VALUES ('Macarena', 'Gutierrez', 12345601, 399349960, '2023-01-01 10:00:00', 1, 1);

-- EJEMPLO N° 2: EVITAR LA DUPLICACIÓN DE CORREOS ELECTRÓNICOS EN LA TABLA SOCIOS.ESTE TRIGGER SE ASEGURA DE QUE CADA CORREO ELECTRÓNICO EN LA TABLA SEA ÚNICO,ES DECIR, QUE NO HAYA DOS SOCIOS CON EL MISMO CORREO REGISTRADO. 


DROP TRIGGER IF EXISTS evitar_duplicado_mail;

DELIMITER //

CREATE TRIGGER evitar_duplicado_mail

BEFORE INSERT ON SOCIOS

FOR EACH ROW

BEGIN
    IF EXISTS (SELECT 1 FROM SOCIOS WHERE MAIL = NEW.MAIL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está registrado en otro socio';
    END IF;
    
END //

DELIMITER ;

-- Se usará a modo de ejemplo la siguiente inserción de datos para verificar el trigger; tomando de ejemplo el mail de la socia Valeria Moreno, cuyo mail es 'valeria19@example.com'.

INSERT INTO SOCIOS (NOMBRE, APELLIDO, DNI, TELEFONO, MAIL, FECHA_ALTA)

VALUES ('Valeria', 'Mendoza', 87654991, 22994455, 'valeria19@example.com', '2024-09-10 09:00:00');

--  El mismo nos dará el error: 'El correo electrónico ya está registrado en otro socio'


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


Una vez creados los roles, usarios y asignaciones, se activan los roles y se actualizan los privilegios con los siguientes respectivos comandos:

COMPLETAR ESTA PARTE CON LA ACTIVACIÓN Y LOS CÓGIDOS EN SQL.


**LENGUAJE DE CONTROL DE TRANSACCIONES (TCL):APLICADO A STORE PROCEDURES.**

EJEMPLO N° 1:insertar_socio.

DESCRIPCIÓN: ASEGURA QUE LA INSERCIÓN DE UN NUEVO SOCIO EN LA TABLA SOCIOS SE REALICE CORRECTAMENTE Y QUE,EN CASO DE ERROR, LA TRANSACCIÓN SE REVIERTA PARA MANTENER LA INTEGRIDAD DE LOS DATOS.

START TRANSACTION;

BEGIN
    -- Llamada al procedimiento almacenado para insertar un nuevo socio
    CALL insertar_socio('Julia', 'Martínez', 45000994, 1234897893, 'julia.martinez8@example.com', '2024-09-15 10:00:00');
    
    -- Supongamos que quieres realizar otra operación que depende de esta inserción
    -- (por ejemplo, insertar una reserva, si existiera una función de reserva).

    -- Si todo se ejecuta correctamente, confirmamos la transacción
    COMMIT;

EXCEPTION
    -- Si ocurre algún error, revertimos la transacción
    ROLLBACK;
END;


EJEMPLO N°2:actualizar_socio

DESCRIPCIÓN:ASEGURA QUE LA ACTUALIZACIÓN DE LA INFORMACIÓN DE UN SOCIO EN LA TABLA SOCIOS SE REALICE CORRECTAMENTE,Y EN CASO DE ERROR, LA TRANSACCIÓN SE REVIERTA.

BUSCAR UN SOCIO DE EJEMPLO.

START TRANSACTION;

BEGIN
    -- Llamada al procedimiento almacenado para actualizar la información de un socio
    CALL actualizar_socio(1, 'Pedro', 'Ramírez', 12345601, 23456701, 'pedro23@example.com', '2023-01-01 10:00:00');
    
    -- Si todo se ejecuta correctamente, confirmamos la transacción
    COMMIT;

EXCEPTION
    -- Si ocurre algún error, revertimos la transacción
    ROLLBACK;
END;

**BACKUP**
