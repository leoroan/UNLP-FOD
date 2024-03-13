# Introducción a las Bases de Datos

## Fundamentos de Organización de Datos

### Práctica 1

#### Creación, consulta y mantenimiento de archivos secuenciales - Algorítmica Básica.


1. [Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando se ingrese el número 30000, que no debe incorporarse al archivo.](https://github.com/leoroan/UNLP-FOD/tree/PRACTICA1/P1-1)

2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el promedio de los números ingresados. El nombre del archivo a procesar debe ser proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el contenido del archivo en pantalla.

3. Realizar un programa que presente un menú con opciones para:
   a. Crear un archivo de registros no ordenados de empleados y completarlo con datos ingresados desde teclado. De cada empleado se registra: número de empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
   b. Abrir el archivo anteriormente generado y
      i. Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado.
      ii. Listar en pantalla los empleados de a uno por línea.
      iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.
      
   NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una única vez.

4. Agregar al menú del programa del ejercicio 3, opciones para:
   a. Añadir una o más empleados al final del archivo con sus datos ingresados por teclado.
   b. Modificar edad a una o más empleados.
   c. Exportar el contenido del archivo a un archivo de texto llamado “todos_empleados.txt”.
   d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados que no tengan cargado el DNI (DNI en 00).
   
   NOTA: Las búsquedas deben realizarse por número de empleado.

5. Realizar un programa para una tienda de celulares, que presente un menú con opciones para:
   a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos ingresados desde un archivo de texto denominado “celulares.txt”. Los registros correspondientes a los celulares, deben contener: código de celular, el nombre, descripción, marca, precio, stock mínimo y el stock disponible.
   b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock mínimo.
   c. Listar en pantalla los celulares del archivo cuya descripción contenga una cadena de caracteres proporcionada por el usuario.
   d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado “celular.txt” con todos los celulares del mismo.
   
   NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el usuario una única vez.
   NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique en dos líneas consecutivas: en la primera se especifica: código de celular, el precio, marca y nombre, y en la segunda el stock disponible, stock mínimo y la descripción, en ese orden. Cada celular se carga leyendo dos líneas del archivo “carga.txt”.

6. Agregar al menú del programa del ejercicio 5, opciones para:
   a. Añadir uno o más celulares al final del archivo con sus datos ingresados por teclado.
   b. Modificar el stock de un celular dado.
   c. Exportar el contenido del archivo binario a un archivo de texto denominado: ”SinStock.txt”, con aquellos celulares que tengan stock 0.
   
   NOTA: Las búsquedas deben realizarse por nombre de celular.

7. Realizar un programa que permita:
   a. Crear un archivo binario a partir de la información almacenada en un archivo de texto. El nombre del archivo de texto es: “novelas.txt”
   b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar una novela y modificar una existente. Las búsquedas se realizan por código de novela.
   
   NOTA: La información en el archivo de texto consiste en: código de novela, nombre,género y precio de diferentes novelas argentinas. De cada novela se almacena la información en dos líneas en el archivo de texto. La primera línea contendrá la siguiente información: código novela, precio, y género, y la segunda línea almacenará el nombre de la novela.

IMPORTANTE: Se recomienda implementar los ejercicios prácticos en Dev-Pascal. El ejecutable puede descargarse desde la plataforma Ideas

