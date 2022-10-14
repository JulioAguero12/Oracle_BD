create or replace PACKAGE medico_ops AS
    --agregar medico
    PROCEDURE nuevo_medico(
    v_nombre medico.nombre%TYPE,
    v_especialidad medico.especialidad%TYPE,
    v_exp medico.años_experiencia%TYPE);

    --eliminar un medico
    PROCEDURE borrar_medico(
    v_medico_id medico.medico_id%TYPE);

    --modificar medico
    PROCEDURE modificar_medico(
    v_medico_id medico.medico_id%TYPE,
    v_especialidad medico.especialidad%TYPE,
    v_exp medico.años_experiencia%TYPE);

END medico_ops;

/
create or replace PACKAGE BODY medico_ops AS

    --agregar medico
    PROCEDURE nuevo_medico(
    v_nombre medico.nombre%TYPE,
    v_especialidad medico.especialidad%TYPE,
    v_exp medico.años_experiencia%TYPE)
    IS
    BEGIN 
        INSERT INTO medico (nombre,especialidad,años_experiencia)
        VALUES(v_nombre,v_especialidad,v_exp);
        DBMS_OUTPUT.PUT_LINE('Medico Registrado Correctamente ');
    END nuevo_medico;

    --eliminar medico
    PROCEDURE borrar_medico(
    v_medico_id medico.medico_id%TYPE)
    AS no_existe_medico EXCEPTION;
        c number;
    BEGIN
        c:=0;
        select count(*) into c from MEDICO 
        where medico_id = v_medico_id;
        IF(c=1)THEN
            DELETE FROM medico
            WHERE medico_id = v_medico_id;
            DBMS_OUTPUT.PUT_LINE('El medico fue eliminado ');
        ELSE
            RAISE no_existe_medico;
        END IF; 
        EXCEPTION 
            WHEN no_existe_medico THEN 
                DBMS_OUTPUT.PUT_LINE('Medico no registrado'); 	
    END borrar_medico;

    --modificar medico
    PROCEDURE modificar_medico(
    v_medico_id medico.medico_id%TYPE,
    v_especialidad medico.especialidad%TYPE,
    v_exp medico.años_experiencia%TYPE)
    AS no_existe_medico EXCEPTION;
        c number;
    BEGIN
        c:=0;
        select count(*) into c from MEDICO 
        where medico_id = v_medico_id;
        IF(c=1)THEN
            UPDATE medico 
            SET especialidad = v_especialidad,
                años_experiencia = v_exp
            WHERE medico_id = v_medico_id;  
            DBMS_OUTPUT.PUT_LINE('Medico modificado');
        ELSE
            RAISE no_existe_medico;
        END IF; 
        EXCEPTION 
            WHEN no_existe_medico THEN 
                DBMS_OUTPUT.PUT_LINE('Medico no registrado'); 
    END modificar_medico;

END medico_ops;


  







