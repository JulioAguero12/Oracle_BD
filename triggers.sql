Solo se puede insertar una línea de venta si el stock del medicamento al decrementarse 
quedase con un valor >= 0. 

Al eliminar una línea de venta el stock se incrementa con la cantidad de la línea de venta eliminada.

CREATE OR REPLACE TRIGGER lineaventas_trigger 
BEFORE INSERT OR DELETE OR UPDATE
ON LINEAVENTA 
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    UPDATE STOCK
    SET CANTIDAD = CANTIDAD - :NEW.CNTVENDIDA
    WHERE STOCK_ID = :NEW.STOCK_ID;
  ELSIF DELETING THEN
    UPDATE STOCK
    SET CANTIDAD = CANTIDAD + :OLD.CNTVENDIDA
    WHERE STOCK_ID = :OLD.STOCK_ID;
  END IF;
END;

EXECUTE lineaventa_ops.ingresa_lv(9,16,1,'Sucralfato',2,15,2);


EXECUTE lineaventa_ops.elimina_lv(23)




Modificar una línea de venta equivale a primero eliminar la línea de venta y después
insertar la línea de venta modificada como si fuese una nueva línea de venta. 

create trigger MODIFICAR_LINEAVENTAS
after update on LINEAVENTA
for each row
declare
PRAGMA AUTONOMOUS_TRANSACTION;
begin
  insert into LINEAVENTA(STOCK_ID,VENTA_ID,FARMACIA_ID,NOMBRECOMERCIAL,COMPAÑIAF_ID,PRECIO,CNTVENDIDA)
            values (:old.STOCK_ID,:old.VENTA_ID,:old.FARMACIA_ID,:old.NOMBRECOMERCIAL,:old.COMPAÑIAF_ID,
            :old.PRECIO,:NEW.CNTVENDIDA); 
            COMMIT;
    
end;


EXECUTE lineaventa_ops.modifica_lv(42,4,5)





create or replace trigger MODIFICAR_LINEAVENTAS
before update on LINEAVENTA
for each row
declare
PRAGMA AUTONOMOUS_TRANSACTION;
begin
   DELETE LINEAVENTA
   WHERE NROLINEAVENTA = :OLD.NROLINEAVENTA;
            COMMIT; 
end;




-----------------------------------------------------------------------------
create or replace trigger trr_actualizar_libros
before update on libros
for each row

begin
  delete libros 
  where codigo = :old.codigo;

end trr_actualizar_libros;


 create or replace trigger tr_actualizar_libros
  before update
  on libros
for each row
declare
PRAGMA AUTONOMOUS_TRANSACTION;
 begin
  insert into LIBROS(TITULO,autor,editorial,precio) values(:old.TITULO,:old.AUTOR,:old.EDITORIAL,:new.PRECIO);
  commit;
 end tr_actualizar_libros;


create or replace trigger trr_actualizar_libros
before insert on libros
for each row
begin
  delete libros 
  where codigo = :new.codigo;

end trr_actualizar_libros;








