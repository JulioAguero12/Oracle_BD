CREATE OR REPLACE PACKAGE lineaventa_ops AS
    PROCEDURE ingresa_lv (
        STOCKID lineaventa.stock_id%type, 
        ventaID lineaventa.venta_id%type, 
        farmID lineaventa.farmacia_id%type, 
        nombreComercial lineaventa.nombrecomercial%type,
        companiaID lineaventa.compañiaf_id%type, 
        preciolv lineaventa.precio%type, 
        cant lineaventa.cntvendida%type
    );

    PROCEDURE modifica_lv (
        NROLV  lineaventa.nrolineaventa%TYPE,
        farmID lineaventa.farmacia_id%type,
        cant   lineaventa.cntvendida%type
    );

    PROCEDURE elimina_lv (
        NROLV  lineaventa.nrolineaventa%TYPE
    );

END lineaventa_ops;
/

CREATE OR REPLACE PACKAGE BODY lineaventa_ops AS

    PROCEDURE ingresa_lv (
        STOCKID lineaventa.stock_id%type, 
        ventaID lineaventa.venta_id%type, 
        farmID lineaventa.farmacia_id%type, 
        nombreComercial lineaventa.nombrecomercial%type,
        companiaID lineaventa.compañiaf_id%type, 
        preciolv lineaventa.precio%type, 
        cant lineaventa.cntvendida%type
    ) AS
        noexistefarmacia EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from FARMACIA
        where FARMACIA_ID = farmID; 
        IF(c=1)THEN
            insert into lineaventa(STOCK_ID,VENTA_ID,FARMACIA_ID,NOMBRECOMERCIAL,COMPAÑIAF_ID,PRECIO,CNTVENDIDA)
            values(STOCKID,ventaID, farmID, nombreComercial, companiaID, preciolv, cant);
           dbms_output.put_line('Linea de Venta Registrada Correctamente'); 
        ELSE
            RAISE noexistefarmacia;
        END IF;      
        EXCEPTION
            WHEN noexistefarmacia THEN
                dbms_output.put_line('Farmacia Inexistente');
    END ingresa_lv;

    PROCEDURE modifica_lv (
        NROLV  lineaventa.nrolineaventa%TYPE,
        farmID lineaventa.farmacia_id%type,
        cant   lineaventa.cntvendida%type
    ) AS
        noexistefarmacia EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from FARMACIA
        where FARMACIA_ID = farmID;  
        IF(c=1)THEN
            UPDATE LINEAVENTA
            SET CNTVENDIDA = cant
            WHERE NROLINEAVENTA = NROLV;
            dbms_output.put_line('Linea de Venta modificada');
        ELSE
            RAISE noexistefarmacia;
        END IF;      
        EXCEPTION
            WHEN noexistefarmacia THEN
                dbms_output.put_line('Farmacia Inexistente');
    END modifica_lv;
 
    --eliminar paciente 
    PROCEDURE elimina_lv (
    NROLV  lineaventa.nrolineaventa%TYPE
    ) AS
       noexistelv EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from LINEAVENTA 
        where NROLINEAVENTA = NROLV;
        IF(c=1)THEN
            DELETE FROM LINEAVENTA
            WHERE NROLINEAVENTA = NROLV;
            dbms_output.put_line('Linea de Venta eliminada');
        ELSE
            RAISE noexistelv;
        END IF;
        
        EXCEPTION
            WHEN noexistelv THEN
                dbms_output.put_line('Linea de Venta Inexistente');
    END elimina_lv;
    
END lineaventa_ops;











