
create or replace PACKAGE comp_farm_ops AS
    --agregar compañia farmaceutica
    PROCEDURE nueva_compañia(
    f_compNombre compañia_farmaceutica.nombre%TYPE,
    f_compTelf compañia_farmaceutica.telefono%TYPE);
    
    --eliminar compañia farmaceutica
    PROCEDURE eliminar_compañia (
    f_comp_id compañia_farmaceutica.compañiaF_id%TYPE);

    --modificar compañia farmaceutica
    PROCEDURE modificar_compañia(
    f_comp_id compañia_farmaceutica.compañiaF_id%TYPE,
    f_compNombre compañia_farmaceutica.nombre%TYPE,
    f_compTelf compañia_farmaceutica.telefono%TYPE);

END comp_farm_ops;

/



create or replace PACKAGE BODY comp_farm_ops AS

    --agregar compañia farmaceutica
    PROCEDURE nueva_compañia(
    f_compNombre compañia_farmaceutica.nombre%TYPE,
    f_compTelf compañia_farmaceutica.telefono%TYPE)
    AS
    BEGIN
         INSERT INTO compañia_farmaceutica(nombre,telefono)
         VALUES(f_compNombre,f_compTelf);
         dbms_output.put_line('Compañia Farmaceutica Registrada Correctamente');
    END nueva_compañia;

    --eliminar compañia farmaceutica
    PROCEDURE eliminar_compañia (
    f_comp_id compañia_farmaceutica.compañiaF_id%TYPE) 
    AS noexistecomp EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from COMPAÑIA_FARMACEUTICA 
        where COMPAÑIAF_ID=f_comp_id;
        IF(c=1)THEN
            DELETE FROM COMPAÑIA_FARMACEUTICA
            WHERE COMPAÑIAF_ID=f_comp_id;
            dbms_output.put_line('Compañia Farmaceutica Eliminada');
        ELSE
            RAISE noexistecomp;
        END IF;  
        EXCEPTION
            WHEN noexistecomp THEN
                dbms_output.put_line('No existe la Compañia Farmaceutica');
    END eliminar_compañia;
    
    --modificar compañia_farmaceutica
    PROCEDURE modificar_compañia(
    f_comp_id compañia_farmaceutica.compañiaF_id%TYPE,
    f_compNombre compañia_farmaceutica.nombre%TYPE,
    f_compTelf compañia_farmaceutica.telefono%TYPE)
    AS noexistecomp EXCEPTION;
        c number;
    BEGIN
        c:=0;
        select count(*) into c from COMPAÑIA_FARMACEUTICA 
        where COMPAÑIAF_ID=f_comp_id;
        IF(c=1)THEN
            UPDATE COMPAÑIA_FARMACEUTICA 
            SET nombre = f_compNombre, 
                telefono = f_compTelf
            WHERE compañiaF_id = f_comp_id;   
            dbms_output.put_line('Compañia Farmaceutica Modificada');
        ELSE
            RAISE noexistecomp;
        END IF;  
        EXCEPTION
            WHEN noexistecomp THEN
                dbms_output.put_line('No existe la Compañia Farmaceutica');
    END modificar_compañia;


END comp_farm_ops;