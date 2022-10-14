CREATE OR REPLACE PACKAGE paciente_ops AS
    PROCEDURE ingresa_paciente (
        pac_id   paciente.paciente_id%TYPE,
        med_id   medico.medico_id%TYPE,
        nom      paciente.nombre%TYPE,
        dir      paciente.direccion%TYPE,
        edad     paciente.edad%TYPE
    );

    PROCEDURE modifica_paciente (
        pac_id   paciente.paciente_id%TYPE,
        med_id   paciente.medico_id%TYPE,
        dir      paciente.direccion%TYPE
    );

    PROCEDURE elimina_paciente (
        pac_id paciente.paciente_id%TYPE
    );

END paciente_ops;
/


CREATE OR REPLACE PACKAGE BODY paciente_ops AS

    PROCEDURE ingresa_paciente (
        pac_id   paciente.paciente_id%TYPE,
        med_id   medico.medico_id%TYPE,
        nom      paciente.nombre%TYPE,
        dir      paciente.direccion%TYPE,
        edad     paciente.edad%TYPE
    ) AS
        noexistemedico EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from MEDICO
        where MEDICO_ID = med_id; 
        IF(c=1)THEN
            INSERT INTO paciente VALUES (
                pac_id,
                med_id,
                nom,
                dir,
                edad
            );
           dbms_output.put_line('Paciente Registrada Correctamente'); 
        ELSE
            RAISE noexistemedico;
        END IF;      
        EXCEPTION
            WHEN noexistemedico THEN
                dbms_output.put_line('No existe el MEDICO');
    END ingresa_paciente;

    PROCEDURE modifica_paciente (
        pac_id   paciente.paciente_id%TYPE,
        med_id   paciente.medico_id%TYPE,
        dir      paciente.direccion%TYPE
    ) AS
        noexistepaciente EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from PACIENTE 
        where paciente_id = pac_id;   
        IF(c=1)THEN
            UPDATE paciente
            SET medico_id = med_id, direccion = dir
            WHERE paciente_id = pac_id;
            dbms_output.put_line('Paciente modificado');
        ELSE
            RAISE noexistepaciente;
            dbms_output.put_line('Paciente no existente');
        END IF;      
        EXCEPTION
            WHEN noexistepaciente THEN
                dbms_output.put_line('No existe el paciente');
    END modifica_paciente;
 
    --eliminar paciente 
    PROCEDURE elimina_paciente (pac_id paciente.paciente_id%TYPE
    ) AS
       noexistepaciente EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from PACIENTE 
        where paciente_id = pac_id;
        IF(c=1)THEN
            DELETE FROM PACIENTE
            WHERE paciente_id = pac_id;
            dbms_output.put_line('Paciente eliminado');
        ELSE
            RAISE noexistepaciente;
        END IF;
        
        EXCEPTION
            WHEN noexistepaciente THEN
                dbms_output.put_line('No existe el paciente');
    END elimina_paciente;
    
END paciente_ops;