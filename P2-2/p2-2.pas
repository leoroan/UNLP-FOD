program p2_2;

uses crt, SysUtils;

const 
valor_alto:=9999;

type
  record_type_maestro_alumno:record;
    codigo_alumno:integer;
    apellido:string[25];
    nombre:string[25];
    cantidad_materias_aprobadas_sin_final_aprobado:integer;
    cantidad_materias_aprobadas_con_final_aprobado:integer
  end;

  record_type_detalle_materia_alumno:record;
    codigo_alumno:integer;
    codigo_materia:integer;
    materia_aprobo_cursada:boolean;
    materia_aprobo_final:boolean;
  end;

  file_type_maestro_alumnos:file of record_type_maestro_alumno;
  file_type_detalle_materias_alumnos:file of record_type_detalle_materia_alumno;

VAR
  archivo_maestro:file_type_maestro_alumnos;
  archivo_detalle:file_type_detalle_materias_alumnos;
  registro_maestro:record_type_maestro_alumno;
  registro_detalle:record_type_detalle_materia_alumno;
  archivo_texto_maestro:text;
  archivo_texto_detalle:text;
  archivo_texto_maestro_reporte:text;
  archivo_texto_detalle_reporte:text;
  archivo_texto_listado_final:text;
BEGIN
  assing(archivo_maestro, 'alumnos');
  assing(archivo_detalle, 'informacion_alumno');
  assing(archivo_texto_maestro, 'alumnos.txt');
  
  //Crear el archivo maestro a partir de un archivo de texto llamado “alumnos.txt”
  reset(archivo_texto_maestro);
  rewrite(archivo_maestro);
  while(not eof(archivo_texto_maestro))do
    begin
      readln(archivo_texto_maestro, registro_maestro.codigo_alumno, ' ', registro_maestro.materia_aprobo_cursada, ' ', registro_maestro.materia_aprobo_final, ' ', registro_maestro.nombre, ' ', registro_maestro.apellido );
      write(archivo_maestro, registro_maestro);
    end;
  close(archivo_maestro);
  close(archivo_texto_maestro);

  //Crear el archivo detalle a partir de en un archivo de texto llamado “detalle.txt”
  assing(archivo_texto_detalle, 'detalle.txt');
  reset(archivo_texto_detalle);
  rewrite(archivo_detalle);
  while(not eof(archivo_texto_detalle))do
    begin
      readln(archivo_texto_detalle, registro_detalle.codigo_alumno, ' ',registro_detalle.materia_aprobo_cursada);
      readln(archivo_texto_detalle, registro_detalle.codigo_materia, ' ',registro_detalle.materia_aprobo_final);
      write(archivo_detalle, registro_detalle);
    end;
  close(archivo_detalle);
  close(archivo_texto_detalle);

  //Listar el contenido del archivo maestro en un archivo de texto llamado
  // “reporteAlumnos.txt”.
  assing(archivo_texto_maestro_reporte, 'reporteAlumnos.txt');
  rewrite(archivo_texto_maestro_reporte);
  reset(archivo_maestro);
  while(not eof(archivo_maestro))do
    begin
      read(archivo_maestro, registro_maestro);
      writeln(archivo_texto_maestro_reporte, registro_maestro.codigo_alumno, ' ', registro_maestro.materia_aprobo_cursada, ' ', registro_maestro.materia_aprobo_final, ' ', registro_maestro.nombre, ' ', registro_maestro.apellido );
    end;
  close(archivo_texto_maestro_reporte);
  close(archivo_maestro);

  //Listar el contenido del archivo detalle en un archivo de texto llamado
  //“reporteDetalle.txt
  assing(archivo_texto_detalle_reporte, 'reporteDetalle.txt');
  rewrite(archivo_texto_maestro_reporte);
  reset(archivo_detalle);
  while(not eof(archivo_detalle))do
    begin
      read(archivo_detalle, registro_detalle);
      writeln(archivo_texto_detalle_reporte, registro_maestro.codigo_alumno, ' ', registro_maestro.materia_aprobo_cursada, ' ', registro_maestro.materia_aprobo_final, ' ', registro_maestro.nombre, ' ', registro_maestro.apellido );
    end;
  close(archivo_texto_detalle_reporte);
  close(archivo_detalle);

  //Actualizar el archivo maestro de la siguiente manera:
  //.Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado
  //.Si aprobó la cursada se incrementa en uno la cantidad de materias aprobadas sin
  //final

  reset(archivo_maestro);
  reset(archivo_detalle);
  leer(archivo_detalle, registro_detalle);//procedure
  while(registro_detalle.codigo_alumno<>valor_alto)do  
    begin
      registro_maestro.codigo_alumno:=registro_detalle.codigo_alumno;
      
      while(registro_maestro.codigo_alumno=registro_detalle.codigo_alumno)do
        begin
          if(registro_detalle.materia_aprobo_final)then
            registro_maestro.cantidad_materias_aprobadas_con_final_aprobado:=registro_maestro.cantidad_materias_aprobadas_con_final_aprobado+1;
          else
            if(registro_detalle.materia_aprobo_cursada)then
            registro_maestro.cantidad_materias_aprobadas_sin_final_aprobado:=registro_maestro.cantidad_materias_aprobadas_sin_final_aprobado+1;
          leer(archivo_detalle,registro_detalle);      
        end;
      
      seek(archivo_maestro,filepos(archivo_maestro)-1);
      write(archivo_maestro, registro_maestro);

    end;
  close(archivo_maestro);
  close(archivo_detalle);

  //Listar en un archivo de texto los alumnos que tengan más de cuatro materias
  //con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos.
  assing(archivo_texto_listado_final, 'listado.txt');
  reset(archivo_maestro);
  rewrite(archivo_texto_listado_final);
  while(not eof(archivo_maestro))do
    begin
      read(archivo_maestro, registro_maestro);
      if(registro_maestro.cantidad_materias_aprobadas_sin_final_aprobado>4)then
        writeln(archivo_texto_listado_final, registro_maestro. ...);
        
    end;

  close(archivo_maestro);

END.


