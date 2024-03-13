

// 1. Realizar un algoritmo que cree un 3archivo de números enteros no ordenados y permita
// incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
// archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
// se ingrese el número 30000, que no debe incorporarse al archivo

program tp1_1;
type
  integer_file_type = file of integer;

  // procedure AsignarNombreArchivo(var nombreArchivo:String; archivo:integer_file_type);
  // begin
  //   if (nombreArchivo = '') then
  //     nombreArchivo := 'archivo_sin_nombre.txt';
  
  //   Assign(archivo, nombreArchivo);
  // end;

//main
var
  archivo_enteros : integer_file_type;
  num:integer;
  nombreFile:string;

begin
  writeln('ingrese nombre para el archivo de numeros enteros:..');
  readln(nombreFile);
  Assign(archivo_enteros, nombreFile+'.txt');
  rewrite(archivo_enteros);

  writeln('ingrese un numero, 30000 para cortar la carga ');
  readln(num);
  while (num <> 30000) do 
  begin
    write(archivo_enteros, num);
    writeln('Ingrese otro numero, (30000 para cortar la carga)');
    readln(num)
  end;
  writeln('Fin del programa');
  close(archivo_enteros);
end.

