program P2_1;

uses crt, SysUtils;

CONST
valor_alto = 9999;

type
  record_type_detalle_venta=record;
    codigo:integer;
    nombre:string;
    monto_comision:real;
  end;

  record_type_maestro_venta=record;
    codigo:integer;
    monto_total_comision:real;
  end;

  file_type_detalle_ventas=file of record_type_detalle_venta;
  file_type_maestro_ventas=file of record_type_maestro_venta;

  procedure leer_un_registro_detalle(var archivo:file_type_detalle_ventas; var reg:record_type_detalle_venta);
  begin
    if(not eof(archivo))then
      read(archivo, reg)
    else
      reg.codigo:=valor_alto;
  end;

VAR
  archivo_maestro_ventas:file_type_maestro_ventas;
  archivo_detalle_ventas:file_type_detalle_ventas;
  reg_maestro:record_type_maestro_venta;
  reg_detalle:record_type_detalle_venta;
  aux_vendedor_codigo:integer;


BEGIN
  assing(archivo_detalle_ventas, "detalle");
  assing(archivo_maestro_ventas, "maestro");

  reset(archivo_detalle_ventas);
  rewrite(archivo_maestro_ventas);

  leer_un_registro_detalle(archivo_detalle_ventas, reg_detalle);
  while(reg_detalle<>valor_alto)do 
    begin      
      aux_vendedor_codigo:=reg_detalle.codigo;
      total_vendedor:=0;

      while(aux_vendedor_codigo=reg_detalle.codigo)do 
        begin
          reg_maestro.monto_total_comision:=reg_maestro.monto_total_comision+reg_detalle.monto_comision;
          leer_un_registro_detalle(archivo_detalle_ventas, reg_detalle);
        end;

      reg_maestro.codigo:=aux_vendedor_codigo;
      write(archivo_maestro_ventas, reg_maestro);     

    end;

  close(archivo_detalle_ventas);
  close(archivo_maestro_ventas);

END.