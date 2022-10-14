CREATE OR REPLACE PACKAGE stock_ops AS
    --agregar stock
    PROCEDURE nuevo_stock(
    s_farmid stock.Farmacia_ID%TYPE,
    s_nomCom stock.NombreComercial%TYPE,
    s_compid stock.CompañiaF_id%TYPE,
    s_precio stock.precio%TYPE,
    s_cantidad stock.cantidad%TYPE
    );
    
    --eliminar stock
    PROCEDURE eliminar_producto(
    s_stockid stock.stock_id%TYPE);
    
    --modificar stock
    PROCEDURE modificar_producto(
    s_stockid stock.stock_id%TYPE,
    s_nuevoPrecio stock.precio%TYPE,
    s_nuevaCantidad stock.cantidad%TYPE
    );
    
END stock_ops;
/

CREATE OR REPLACE PACKAGE BODY stock_ops AS
    --agregar stock
    PROCEDURE nuevo_stock(
        s_farmid stock.Farmacia_ID%TYPE,
        s_nomCom stock.NombreComercial%TYPE,
        s_compid stock.CompañiaF_id%TYPE,
        s_precio stock.precio%TYPE,
        s_cantidad stock.cantidad%TYPE
        )
    AS
        noexistefarmacia EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from FARMACIA
        where FARMACIA_ID = s_farmid; 
        IF(c=1)THEN
            INSERT INTO stock(Farmacia_ID,NombreComercial,CompañiaF_ID,precio, cantidad)
            VALUES(s_farmid, s_nomCom, s_compid,s_precio, s_cantidad);
           dbms_output.put_line('Stock Registrado Correctamente'); 
        ELSE
            RAISE noexistefarmacia;
        END IF;      
        EXCEPTION
            WHEN noexistefarmacia THEN
                dbms_output.put_line('Farmacia Inexistente');
    END nuevo_stock;
    
    --eliminar registro del stock 
    PROCEDURE eliminar_producto(
    s_stockid stock.stock_id%TYPE)
    AS
       noexisteregistro EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from STOCK 
        where STOCK_ID = s_stockid;
        IF(c=1)THEN
            DELETE FROM STOCK
            WHERE STOCK_ID = s_stockid;
            dbms_output.put_line('Registro del Stock eliminado');
        ELSE
            RAISE noexisteregistro;
        END IF;
        
        EXCEPTION
            WHEN noexisteregistro THEN
                dbms_output.put_line('Stock no registrado');
    END eliminar_producto;
    
    PROCEDURE modificar_producto (
    s_stockid stock.stock_id%TYPE,
    s_nuevoPrecio stock.precio%TYPE,
    s_nuevaCantidad stock.cantidad%TYPE
    ) AS
        noexisteregistro EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from STOCK 
        WHERE STOCK_ID = s_stockid;   
        IF(c=1)THEN
            UPDATE STOCK
            SET CANTIDAD = s_nuevaCantidad, PRECIO = s_nuevoPrecio
            WHERE STOCK_ID = s_stockid; 
            dbms_output.put_line('Registro del Stock modificado');
        ELSE
            RAISE noexisteregistro;
        END IF;      
        EXCEPTION
            WHEN noexisteregistro THEN
                dbms_output.put_line('Stock no registrado');
    END modificar_producto;
    
END stock_ops;
/


