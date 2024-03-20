{
   p1_5.pas
   
   Copyright 2024 lean <lean@>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program p1_4;
uses crt, SysUtils;
  
//var
//  GlobalVariable: String;

type
  record_type_celulares=record
    codigo:integer;
    nombre:string;
    descripcion:string;
    marca:string;
    precio:real;
    stock_minimo:integer;
    stock_disponible:integer;
  end;    
  
  file_type_celulares=file of record_type_celulares;
  
  procedure exportar_binario_a_texto(var archivo:file_type_celulares; var archivo_texto:Text);
  var
    celular:record_type_celulares;
  begin
    reset(archivo);
    rewrite(archivo_texto);
    writeln('CREACION DE NUEVO ARCHIVO DE TEXTO.... procesando');
    while(not EOF(archivo))do
      begin
	read(archivo, celular);
	writeln(archivo_texto, celular.codigo, ' ' ,FloatToStr(celular.precio), ' ' ,celular.nombre);
	
      end;
    writeln('Presione una tecla para continuar...');
    readkey;
    clrscr;
    close(archivo);
    close(archivo_texto);
  end;
  
  procedure buscar_celular_por_descripcion_del_usuario(var archivo:file_type_celulares);
  var
    desc:string;
    encontre:boolean;
    celular:record_type_celulares;
    
  begin
    encontre:=false;
    reset(archivo);
    writeln(' COMIENZO LISTADO DE BUSQUEDA DE EQUIPO SEGUN DESCRIPCION ');
    writeln('Ingrese palabra para buscar equipo...(se distinguen mayusculas de minusculas)');
    readln(desc);
    while(not eof(archivo) and (not encontre))do
      begin
	read(archivo, celular); 
	if(Pos(desc, celular.descripcion) > 0)then
	  encontre:=true;	  
      end;
    if(encontre)then
      writeln('Equipo encontrado>> *Codigo: ', celular.codigo, ' *Descripcion: ', celular.descripcion, ' *Precio: ', FloatToStr(celular.precio))
    else
      writeln('No se encontro equipo con descripcion segun palabra buscada...');
    writeln(' FIN LISTADO DE BUSQUEDA DE EQUIPO SEGUN DESCRIPCION ');
    writeln('Presione una tecla para continuar...');
    readkey;
    clrscr;
    
  end;
  
  procedure listar_celulares_con_stock_menor_al_minimo(var archivo:file_type_celulares);
  var
    celular:record_type_celulares;
  begin
    writeln(' COMIENZO LISTADO DE EQUIPO CON STOCK MENOR AL MINIMO ');
    reset(archivo);
      while(not EOF(archivo))do
	begin
	  read(archivo, celular);
	  //writeln('COD: ',celular.codigo, ' PRECIO: ', FloatToStr(celular.precio), ' STOCK: ', IntToStr(celular.stock_disponible), ' STOCK-MINIMO: ', IntToStr(celular.stock_minimo), ' NOMBRE: ', celular.nombre, ' MARCA: ', celular.marca, ' DESCRIPCION: ', celular.descripcion);	  
	  if(celular.stock_disponible<celular.stock_minimo)then
	    writeln('---> EQUIPO: ',celular.nombre, ' codigo: ', celular.codigo, ' quedan: ',celular.stock_disponible);
	end;
    close(archivo);
    writeln(' FIN LISTADO DE EQUIPO CON STOCK MENOR AL MINIMO ');
    writeln('Presione una tecla para continuar...');
    readkey;
    clrscr;
  end;
  
  procedure crear_archivo_en_base_a_otro(var archivo_base:Text; var archivo:file_type_celulares);
  var
    celular:record_type_celulares;
    
  begin
    reset(archivo_base);
    rewrite(archivo);
    writeln('CREACION DE NUEVO ARCHIVO');
    while(not EOF(archivo_base))do
      begin
	readln(archivo_base, celular.codigo, celular.precio, celular.stock_minimo, celular.stock_disponible, celular.nombre);
	readln(archivo_base, celular.marca);
	readln(archivo_base, celular.descripcion);
	write(archivo, celular);
      end;
    writeln('Presione una tecla para continuar...');
    readkey;
    clrscr;
    close(archivo_base);
    close(archivo);
    
  end;

  procedure crear_y_cargar_archivo_celulares(var archivo:Text);
  
    procedure leer(var reg: record_type_celulares);
    begin
      writeln('COMIENZO DE CREACION DE NUEVO REGISTRO: CELULAR');
      with reg do
	begin
	  writeln('Ingrese codigo del equipo celular(cod:999 para terminar)');
	  readln(codigo);
	  if (codigo <> 999) then
	    begin
	      writeln('Ingrese nombre del equipo celular...');
	      readln(nombre);
	      writeln('Ingrese descripcion del equipo celular...');
	      readln(descripcion);
	      writeln('Ingrese marca del equipo celular...');
	      readln(marca);
	      writeln('Ingrese precio del equipo celular...');
	      readln(precio);
	      writeln('Ingrese stock minimo del equipo celular...');
	      readln(stock_minimo);
	      writeln('Ingrese stock disponible del equipo celular...');
	      readln(stock_disponible);
	    end;	
	end;
      writeln('FIN DE CREACION DE NUEVO REGISTRO: CELULAR');
      writeln('Presione una tecla para continuar...');
      readkey;
      clrscr;
      
    end;
    
  var
    celular:record_type_celulares;
    
  begin
    rewrite(archivo);
    leer(celular);
    writeln('COMIENZO CARGA DE TEXTO A ARCHIVO NUEVO');
    while(celular.codigo<>999)do
      begin
	writeln(archivo, IntToStr(celular.codigo), ' ',celular.precio, ' ',IntToStr(celular.stock_minimo), ' ',IntToStr(celular.stock_disponible), ' ',celular.nombre);
	writeln(archivo, celular.marca);
	writeln(archivo, celular.descripcion);
	leer(celular);
      end;        
    close(archivo);
    writeln('FIN CARGA DE TEXTO A ARCHIVO');
    writeln('Presione una tecla para continuar...');
    readkey;
    clrscr;
        
  end;

VAR
  archivo_base_celulares:Text; 
  archivo_final_celulares:file_type_celulares;
  archivo_texto:Text;
  
BEGIN  
  assign(archivo_base_celulares,'celulares.txt'); 
  assign(archivo_final_celulares,'celulares.dat');
  assign(archivo_texto,'celular.txt');
  
  if(FileExists('celulares.txt'))then
    begin
      writeln('ARCHIVO "CELULARES" EXISTENTE');
      readkey;
      clrscr;
      //writeln('[1] MODIFICAR'); // reset
      //writeln('[2] CREAR NUEVO'); // rewrite()
      //modificar_archivo(archivo_celulares)
    end
  else
    //si no existe, lo creamos
    crear_y_cargar_archivo_celulares(archivo_base_celulares);  
  
  crear_archivo_en_base_a_otro(archivo_base_celulares, archivo_final_celulares);
  listar_celulares_con_stock_menor_al_minimo(archivo_final_celulares);
  buscar_celular_por_descripcion_del_usuario(archivo_final_celulares);
  exportar_binario_a_texto(archivo_final_celulares,archivo_texto);
  //comenzar_menu();
  //fin_programa();
	
	
END.

