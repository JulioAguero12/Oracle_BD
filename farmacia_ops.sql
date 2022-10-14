create or replace PACKAGE farmacia_ops AS
    --agregar farmacia
    PROCEDURE nueva_farmacia(
    f_nombre farmacia.nombre%TYPE,
    f_direccion farmacia.direccion%TYPE,
    f_telf farmacia.telefono%TYPE);
    
    --eliminar farmacia
    PROCEDURE elimina_farmacia (
    f_farmaid farmacia.farmacia_ID%TYPE);

    --modificar farmacia
    PROCEDURE modificar_farmacia(
    f_farmaid farmacia.farmacia_ID%TYPE,
    f_nombre farmacia.nombre%TYPE,
    f_direccion farmacia.direccion%TYPE,
    f_telf farmacia.telefono%TYPE);
    
END farmacia_ops;
/

create or replace PACKAGE BODY farmacia_ops AS
    --ingresar farmacia
    PROCEDURE nueva_farmacia(
    f_nombre farmacia.nombre%TYPE,
    f_direccion farmacia.direccion%TYPE,
    f_telf farmacia.telefono%TYPE)
    IS
    BEGIN 
        INSERT INTO farmacia(nombre,direccion,telefono)
        VALUES(f_nombre,f_direccion,f_telf);
        dbms_output.put_line('Farmacia Registrada Correctamente');
    END nueva_farmacia;

    --eliminar farmacia 
    PROCEDURE elimina_farmacia (
    f_farmaid farmacia.farmacia_ID%TYPE) 
    AS noexistefarmacia EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from farmacia 
        where farmacia_id=f_farmaid;
        IF(c=1)THEN
            DELETE FROM farmacia
            WHERE farmacia_id = f_farmaid;
            dbms_output.put_line('Farmacia Eliminada');
        ELSE
            RAISE noexistefarmacia;
        END IF;  
        EXCEPTION
            WHEN noexistefarmacia THEN
                dbms_output.put_line('No existe la farmacia');
    END elimina_farmacia;
    
    --modificar farmacia
    PROCEDURE modificar_farmacia(
    f_farmaid farmacia.farmacia_ID%TYPE,
    f_nombre farmacia.nombre%TYPE,
    f_direccion farmacia.direccion%TYPE,
    f_telf farmacia.telefono%TYPE)
    AS noexistefarmacia EXCEPTION;
        c number;
    BEGIN
        c:=0;
        select count(*) into c from farmacia 
        where farmacia_id=f_farmaid;
        IF(c=1)THEN
            UPDATE farmacia 
            SET nombre = f_nombre, 
            direccion = f_direccion,
            telefono = f_telf
            WHERE farmacia_ID = f_farmaid;  
            dbms_output.put_line('Farmacia Modificada');
        ELSE
            RAISE noexistefarmacia;
        END IF;  
        EXCEPTION
            WHEN noexistefarmacia THEN
                dbms_output.put_line('No existe la farmacia');
    END modificar_farmacia;

END farmacia_ops;