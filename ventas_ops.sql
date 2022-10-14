


--VENTA
CREATE OR REPLACE PACKAGE ventas_ops AS
    PROCEDURE ingresa_venta (
        farmaciaID venta.farmacia_id%type,
        pacienteID venta.paciente_id%type
    );

    PROCEDURE elimina_venta (
        ventaID venta.venta_id%TYPE,
        farmaciaID venta.farmacia_id%type
    );
    
END ventas_ops;
/

CREATE OR REPLACE PACKAGE BODY ventas_ops AS

    PROCEDURE ingresa_venta (
        farmaciaID venta.farmacia_id%type,
        pacienteID venta.paciente_id%type
    )AS
        noexistefarmacia EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from FARMACIA
        where FARMACIA_ID = farmaciaID; 
        IF(c=1)THEN
            INSERT INTO venta VALUES (NULL, farmaciaID, to_date(sysdate,'DD/MM/YYYY:HH:MI:SSAM'), pacienteID);
            dbms_output.put_line('Venta Registrada Correctamente'); 
        ELSE
            RAISE noexistefarmacia;
        END IF;      
        EXCEPTION
            WHEN noexistefarmacia THEN
                dbms_output.put_line('No existe la farmacia');
    END ingresa_venta;

    --eliminar paciente 
    PROCEDURE elimina_venta (
        ventaID venta.venta_id%TYPE,
        farmaciaID venta.farmacia_id%type
    )AS
       noexisteventa EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from VENTA 
        where VENTA_ID = ventaID;
        IF(c=1)THEN
            DELETE FROM VENTA
            WHERE FARMACIA_ID = farmaciaID AND VENTA_ID = ventaID;
            dbms_output.put_line('Venta eliminada');
        ELSE
            RAISE noexisteventa;
        END IF;
        
        EXCEPTION
            WHEN noexisteventa THEN
                dbms_output.put_line('Venta no existente');
    END elimina_venta;
    
END ventas_ops;


--
