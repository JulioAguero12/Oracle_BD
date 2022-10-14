

CREATE OR REPLACE PACKAGE receta_ops AS
    PROCEDURE ingresa_receta (
        medicoID receta.medico_id%type, 
        pacienteID receta.paciente_id%type,
        nombreComercial receta.nombrecomercial%type, 
        compañiaID receta.compañiaf_id%type, fecha receta.fecha%type,
        cant receta.cantidad%type
    );

    PROCEDURE modifica_receta (
        recetaID    receta.receta_id%type,
        cnt         receta.cantidad%type
    );

    PROCEDURE elimina_receta (
        recetaID    receta.receta_id%type
    );

END receta_ops;
/


CREATE OR REPLACE PACKAGE BODY receta_ops AS

    PROCEDURE ingresa_receta (
        medicoID receta.medico_id%type, 
        pacienteID receta.paciente_id%type,
        nombreComercial receta.nombrecomercial%type, 
        compañiaID receta.compañiaf_id%type, fecha receta.fecha%type,
        cant receta.cantidad%type
    ) AS
        noexistepaciente EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from PACIENTE
        where PACIENTE_ID = pacienteID; 
        IF(c=1)THEN
            insert into receta(MEDICO_ID,PACIENTE_ID,NOMBRECOMERCIAL,COMPAÑIAF_ID,FECHA,CANTIDAD)
            values(medicoID, pacienteID, nombreComercial, compañiaID,fecha, cant);
            dbms_output.put_line('Receta Registrada Correctamente'); 
        ELSE
            RAISE noexistepaciente;
        END IF;      
        EXCEPTION
            WHEN noexistepaciente THEN
                dbms_output.put_line('No existe el paciente');
    END ingresa_receta;

    PROCEDURE modifica_receta (
        recetaID    receta.receta_id%type,
        cnt         receta.cantidad%type
    ) AS
        noexistereceta EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from RECETA 
        where RECETA_ID = recetaID;   
        IF(c=1)THEN
            UPDATE RECETA
            SET CANTIDAD = cnt
            WHERE RECETA_ID = recetaID;
            dbms_output.put_line('Receta modificada');
        ELSE
            RAISE noexistereceta;
        END IF;      
        EXCEPTION
            WHEN noexistereceta THEN
                dbms_output.put_line('Receta no existente');
    END modifica_receta;
 
    --eliminar paciente 
    PROCEDURE elimina_receta (
    recetaID    receta.receta_id%type
    ) AS
       noexistereceta EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from RECETA 
        where RECETA_ID = recetaID;
        IF(c=1)THEN
            DELETE FROM RECETA
            WHERE RECETA_ID = recetaID;
            dbms_output.put_line('Receta eliminada');
        ELSE
            RAISE noexistereceta;
        END IF;
        
        EXCEPTION
            WHEN noexistereceta THEN
                dbms_output.put_line('Receta no existente');
    END elimina_receta;
    
END receta_ops;

