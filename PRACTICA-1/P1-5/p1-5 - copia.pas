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
uses crt;

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

  procedure crear_registros_de_celulares();
  begin
  end;
  
  procedure fin_programa();
  begin
    writeln('--------------------------------');
    writeln('---------- FIN PROGRAMA --------');
    writeln('--------------------------------');
  end;
  
  procedure comenzar_menu();
  var
    opc:integer;
  begin
    repeat
	writeln('+-------------  MENU -----------------+');
	writeln('| 1) CREAR REGISTROS DE CELULARES     |');
	writeln('| 2) CREAR ARCHIVO DE CELULARES       |');
	writeln('| 3) IMPRIMIR EMP. MAYORES A 70 ANIOS |');
	writeln('| 0) SALIR                            |');
	writeln('+-------------- MENU -----------------+');
	read(opc);
	clrscr;
	case opc of
	  1 : crear_registros_de_celulares();
	  
	end;
      until opc = 0;
      readln();
  end;

VAR
  archivo_celulares:file_type_celulares;
  registro_celulares:record_type_celulares;
  
BEGIN
  assign(archivo_celulares,'celulares.txt');
  
  comenzar_menu();
  fin_programa();
	
	
END.

