
{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creados en el ejercicio 1, 
* informe por pantalla cantidad de números menores a 1500 
* y el promedio de los números ingresados.
El nombre del archivo a procesar debe ser proporcionado por el usuario una única vez. 
Además, el algoritmo deberá listar el contenido del archivo en pantalla.
}

program tp1_2;
uses Crt;

type
  integer_file_type = file of integer;
  
//main
var
  archivo_enteros : integer_file_type;
  num:integer;
  nombreFile:string;

begin
  writeln('ingrese nombre de archivo para abrir... ');
  readln(nombreFile);
  
  assign(archivo_enteros, nombreFile+'.txt');
  
  reset(archivo_enteros);
  ClrScr;

  while ( not EOF(archivo_enteros) ) do 
    begin
      read(archivo_enteros, num);
      writeln('>>> ', num);
    end;
  
  writeln('Fin del programa');
  close(archivo_enteros);
end.


