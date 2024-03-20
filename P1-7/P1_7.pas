{
   P1_7.pas
   
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


program P1_7;

uses crt, SysUtils;

type
  record_type_novela=record
    nombre:string;
    codigo:integer;
    genero:string;
    precio:real;
  end;
  
  file_type_novelas=file of record_type_novela;
  
  procedure leer(var r:record_type_novela);
  begin
    with r do
      begin
	writeln('ingrese el nombre de novela...(ESCRIBA "FIN" PARA TERMINAR...)');
	readln(nombre);
	if(nombre<>'fin')then
	  begin
	    writeln('ingrese el codigo de la novela...');
	    readln(codigo);
	    writeln('ingrese el genero de la novela...');
	    readln(genero);
	    writeln('ingrese el precio de la novela...');
	    readln(precio);
	  end;	  
      end;
  end;  
  
  procedure crear_archivo_de_texto(var archivo:text);
  var
    novela:record_type_novela;
  begin
    rewrite(archivo);
    leer(novela);
    while(novela.nombre<>'fin')do
      begin
	writeln(archivo, novela.precio, ' ',novela.codigo, ' ',novela.genero);
	writeln(archivo, novela.nombre);
	leer(novela);
      end;
    
    close(archivo); 
    readkey;
    clrscr;   
  end;
  
  procedure crear_archivo_de_texto_a_binario(var archivo_texto:text; var archivo_binario:file_type_novelas);
  var
    novela:record_type_novela;
    
  begin
    reset(archivo_texto);
    rewrite(archivo_binario);
    while(not eof(archivo_texto))do
      begin
	readln(archivo_texto, novela.precio, novela.codigo, novela.genero);
	readln(archivo_texto, novela.nombre);
	write(archivo_binario, novela);
      end;
    
    close(archivo_texto);
    close(archivo_binario);
    readkey;
    clrscr;    
  end;
  
  procedure actualizar_archivo_binario(var archivo:file_type_novelas);
  var
    novela:record_type_novela;
  begin
    writeln('updating file...');
    reset(archivo);
    seek(archivo,filesize(archivo));
    leer(novela);
    write(archivo, novela);    
    close(archivo);
    clrscr;
    readkey;    
  end;
  
  procedure imprimir_binario(var archivo:file_type_novelas);
  var
    novela:record_type_novela;
  begin
    reset(archivo);
    while(not eof(archivo))do
      begin
      read(archivo, novela);
      writeln('NOMBRE: ',novela.nombre,' CODIGO: ',novela.codigo,' PRECIO: ', FloatToStr(novela.precio), ' GENERO: ',novela.genero);
      end;
    
    close(archivo);
  end;

VAR
  archivo_binario_novelas:file_type_novelas;
  archivo_texto_novelas:text;
  
BEGIN
  assign(archivo_texto_novelas,'novelas.txt');
  assign(archivo_binario_novelas,'novelas.bin');
  
  if(FileExists('novelas.txt'))then
    begin
      if(FileExists('novelas.bin'))then
	begin
	  actualizar_archivo_binario(archivo_binario_novelas);
	  imprimir_binario(archivo_binario_novelas);
	end
      else
	crear_archivo_de_texto_a_binario(archivo_texto_novelas, archivo_binario_novelas);
      
    end
  else
    crear_archivo_de_texto(archivo_texto_novelas);
  
	
	
END.

