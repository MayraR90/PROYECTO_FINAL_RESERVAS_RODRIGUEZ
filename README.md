# PROYECTO_FINAL_RESERVAS_RODRIGUEZ



## **PROYECTO FINAL**

**CURSO:** *SQL*
**ALUMNA**: *RODRIGUEZ, MAYRA ALEJANDRA*
**COMISIÓN:** *57190* 
**TUTOR:** *ARIEL ANNONE*
**DOCENTE:** *ANDERSON MICHEL TORRES*
---
**CONSIGNAS**
- *Descripción de la temática de la base de datos.*
- *Diagramas de entidad relación de la base de datos.*
- *Listado de las tablas que comprenden la base de datos, con descripción de cada tabla, listado de campos, abreviaturas de nombres de campos, nombres completos de campos, tipos de datos, tipo de clave (foránea, primaria, índice(s).*
- ***Un archivo .sql que contenga:** Script en SQL de creación de la base de datos y tablas. Este puede estar publicado en un repositorio github, con lo cual el documento pdf debe contener los links de las publicaciones.*
- ***Formato:** Aclarar el tipo de archivo en que se espera el desafío. Aclarar que debe tener el nombre “Idea+Apellido”.*
---
## PROBLEMA
*Se está desarrollando un sistema de gestión de reservas de las actividades para un club con varias sedes, que permita poder  manejar todas las operaciones relacionadas con las mismas.*
## DESCRIPCIÓN DEL PROBLEMA
***1. Gestión de socios y actividades:** Necesitamos una base de datos que nos permita registrar la información de los socios y de las actividades que reservan en cada una de las sedes.*
***2. Gestión de reservas y disponibilidad:** La base de datos debe permitirnos registrar la disponibilidad de las reservas de cada actividad. Esto nos permitirá evitar conflictos de reservas.*
***3. Registro de reservas:** Necesitamos un sistema que pueda registrar de manera detallada cada reserva realizada.*
## DESCRIPCIÓN
*Necesitamos una base de la base para nuestro club que permita registrar las reservas que realizan los socios para las actividades que brindamos  todos los días.*
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

- **5. DUEÑO**
- *Contiene información de los dueños de cada una de nuestras sedes.*
- ***Atributos:** ID_DUEÑO (PK), NOMBRE, APELLIDO, TELÉFONO.*
**6. PROFESORES.**
- *Contiene información de los profesores que realizan las actividades en nuestras sedes.*
- ***Atributos:** ID_PROFESOR (PK), NOMBRES, APELLIDO, DNI, TELÉFONO, ALTA, ID_ACTIVIDAD (FK), ID_SEDE (FK).*
