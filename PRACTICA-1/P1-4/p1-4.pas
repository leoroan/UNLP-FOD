{
   p1-4.pas
   
   3. Realizar un programa que presente un menú con opciones para:
      a. Crear un archivo de registros no ordenados de empleados y completarlo con
	datos ingresados desde teclado. De cada empleado se registra: número de
	empleado, apellido, nombre, edad y DNI. 
	Algunos empleados se ingresan con DNI 00. 
	|La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
      b. Abrir el archivo anteriormente generado y
	i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
	  determinado.
	ii. Listar en pantalla los empleados de a uno por línea.
	iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.
	
      NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una
	única vez
   
   
}


program p1_4;
uses crt;

type
  
  record_type_empleado = record
    nro:integer;
    apellido:string;
    nombre:string;
    edad:integer;
    dni:Longint;
  end;
  
  file_type_empleado = file of record_type_empleado;
  
  procedure crear_y_cargar_archivo_empleados(var archivo : file_type_empleado);
    
    procedure leer(var empleado:record_type_empleado);
    begin
      with empleado do
	begin
	  writeln('Ingrese apellido del empleado...');
	  readln(apellido);
	  if(apellido<>'')then
	    begin
	      writeln('ingrese nombre del empleado...');
	      readln(nombre);
	      writeln('ingrese numero del empleado...');
	      readln(nro);
	      writeln('ingrese edad del empleado...');
	      readln(edad);
	      writeln('ingrese dni del empleado...');
	      readln(dni);
	    end
	end;	 
	ClrScr; 
    end;
    
  var
    registro_empleado:record_type_empleado;
  begin
    writeln('Comienzo de carga de datos del empleado...');
    rewrite(archivo);
    
    leer(registro_empleado);
    while(registro_empleado.apellido<>'') do 
      begin
	write(archivo, registro_empleado);
	writeln('Cargando otro empleado...(en blanco para salir)');
	leer(registro_empleado)
      end;   
    
    writeln('Fin de carga de datos del empleado...');
    readln();
    close(archivo);
    ClrScr;
  end;
  
  procedure imprimir_en_pantalla_todos_los_empleados(var archivo:file_type_empleado);
  var
    empleado:record_type_empleado;
  begin
    reset(archivo); 
    writeln('Comienzo de impresion de datos de los empleados...');
    while( not EOF(archivo) ) do
	begin
	  read(archivo, empleado);
	  writeln('EMPLEADO: ',empleado.nombre,' ',empleado.apellido);
	end; 
    writeln('Fin de impresion de datos de los empleados...');
    close(archivo);
    ReadKey;
    ClrScr;
  end;
  
  procedure imprimir_en_pantalla_segun_nombre_o_apellido(var archivo:file_type_empleado);
  var
    empleado:record_type_empleado;
    nombre:string;
    encontre:boolean;
  begin
    encontre:=false;
    reset(archivo);
    writeln('Comienzo de impresion de empleados segun nombre o apellido...');
    writeln('Ingrese el nombre o apellido a buscar...');
    readln();
    readln(nombre);
    while( not EOF(archivo) and not encontre ) do
      begin
	read(archivo, empleado);
	if((empleado.nombre=nombre) or (empleado.apellido=nombre))then
	  encontre:=true
      end;
    clrscr;
    if(encontre)then
      begin
	writeln('Registro de empleado encontrado:');
	writeln('datos: DNI: ',empleado.dni,' EMP.NRO: ',empleado.nro);
      end
    else
      writeln('Registro de empleado NO encontrado');
    
    writeln('Fin de impresion de empleados segun nombre o apellido...');
    close(archivo);
    ReadKey;
    ClrScr;
  end;
  
  procedure imprimir_en_pantalla_emp_mayores_70(var archivo:file_type_empleado);
  var
    empleado:record_type_empleado;
  begin
    reset(archivo);
    writeln('Comienzo de impresion de empleados mayores a 70 anios...');
    while( not EOF(archivo) )do
      begin
	read(archivo, empleado); 
	if(empleado.edad>70)then
	  writeln('---->',empleado.nombre,' ',empleado.apellido,' EDAD: ',empleado.edad)
	
      end;    
    writeln('Fin de impresion de empleados mayores a 70 anios...');
    close(archivo);
    ReadKey;
    ClrScr;
  end;
  

VAR
  archivo_empleado:file_type_empleado;
  opc:byte;
BEGIN

  assign(archivo_empleado, 'empleadosFile.txt');  
  //cargar el archivo con datos de empleados:
  crear_y_cargar_archivo_empleados(archivo_empleado);  
  //imprimir en pantalla archivo de empleados:
  reset(archivo_empleado);
  
  if(FileSize(archivo_empleado)=0)then
    begin
      writeln('+---------------+');
      writeln('| ARCHIVO VACIO |');
      writeln('+---------------+');
    end
    else
      repeat
	writeln('+-------------  MENU -----------------+');
	writeln('| 1) IMPRIMIR SEGUN NOMBRE O APELLIDO |');
	writeln('| 2) IMPRIMIR TODOS LOS EMPLEADOS     |');
	writeln('| 3) IMPRIMIR EMP. MAYORES A 70 ANIOS |');
	writeln('| 0) SALIR                            |');
	writeln('+-------------- MENU -----------------+');
	read(opc);
	clrscr;
	case opc of
	  1 : imprimir_en_pantalla_segun_nombre_o_apellido(archivo_empleado);
	  2 : imprimir_en_pantalla_todos_los_empleados(archivo_empleado); 
	  3 : imprimir_en_pantalla_emp_mayores_70(archivo_empleado);   	  
	end;
      until opc = 0;
      writeln('---------- FIN PROGRAMA --------');
      readln();

  //close(archivo_empleado)
END.

