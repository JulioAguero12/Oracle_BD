
create or replace PACKAGE comp_farm_ops AS
    --agregar compa�ia farmaceutica
    PROCEDURE nueva_compa�ia(
    f_compNombre compa�ia_farmaceutica.nombre%TYPE,
    f_compTelf compa�ia_farmaceutica.telefono%TYPE);
    
    --eliminar compa�ia farmaceutica
    PROCEDURE eliminar_compa�ia (
    f_comp_id compa�ia_farmaceutica.compa�iaF_id%TYPE);

    --modificar compa�ia farmaceutica
    PROCEDURE modificar_compa�ia(
    f_comp_id compa�ia_farmaceutica.compa�iaF_id%TYPE,
    f_compNombre compa�ia_farmaceutica.nombre%TYPE,
    f_compTelf compa�ia_farmaceutica.telefono%TYPE);

END comp_farm_ops;

/



create or replace PACKAGE BODY comp_farm_ops AS

    --agregar compa�ia farmaceutica
    PROCEDURE nueva_compa�ia(
    f_compNombre compa�ia_farmaceutica.nombre%TYPE,
    f_compTelf compa�ia_farmaceutica.telefono%TYPE)
    AS
    BEGIN
         INSERT INTO compa�ia_farmaceutica(nombre,telefono)
         VALUES(f_compNombre,f_compTelf);
         dbms_output.put_line('Compa�ia Farmaceutica Registrada Correctamente');
    END nueva_compa�ia;

    --eliminar compa�ia farmaceutica
    PROCEDURE eliminar_compa�ia (
    f_comp_id compa�ia_farmaceutica.compa�iaF_id%TYPE) 
    AS noexistecomp EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from COMPA�IA_FARMACEUTICA 
        where COMPA�IAF_ID=f_comp_id;
        IF(c=1)THEN
            DELETE FROM COMPA�IA_FARMACEUTICA
            WHERE COMPA�IAF_ID=f_comp_id;
            dbms_output.put_line('Compa�ia Farmaceutica Eliminada');
        ELSE
            RAISE noexistecomp;
        END IF;  
        EXCEPTION
            WHEN noexistecomp THEN
                dbms_output.put_line('No existe la Compa�ia Farmaceutica');
    END eliminar_compa�ia;
    
    --modificar compa�ia_farmaceutica
    PROCEDURE modificar_compa�ia(
    f_comp_id compa�ia_farmaceutica.compa�iaF_id%TYPE,
    f_compNombre compa�ia_farmaceutica.nombre%TYPE,
    f_compTelf compa�ia_farmaceutica.telefono%TYPE)
    AS noexistecomp EXCEPTION;
        c number;
    BEGIN
        c:=0;
        select count(*) into c from COMPA�IA_FARMACEUTICA 
        where COMPA�IAF_ID=f_comp_id;
        IF(c=1)THEN
            UPDATE COMPA�IA_FARMACEUTICA 
            SET nombre = f_compNombre, 
                telefono = f_compTelf
            WHERE compa�iaF_id = f_comp_id;   
            dbms_output.put_line('Compa�ia Farmaceutica Modificada');
        ELSE
            RAISE noexistecomp;
        END IF;  
        EXCEPTION
            WHEN noexistecomp THEN
                dbms_output.put_line('No existe la Compa�ia Farmaceutica');
    END modificar_compa�ia;


END comp_farm_ops;