

CREATE OR REPLACE PACKAGE contrato_ops AS
    PROCEDURE ingresa_contrato (
        compf_id   contrato.compa�iaf_id%TYPE,
        farm_id    contrato.farmacia_id%TYPE,
        fechai     contrato.fechainicio%TYPE,
        fechaf     contrato.fechafin%TYPE,
        text       contrato.texto%TYPE,
        supv       contrato.nombre_supervisor%TYPE
    );

    PROCEDURE modifica_contrato (
        compf_id   contrato.compa�iaf_id%TYPE,
        farm_id    contrato.farmacia_id%TYPE,
        supv       contrato.nombre_supervisor%TYPE
    );

    PROCEDURE elimina_contrato (
        compf_id   contrato.compa�iaf_id%TYPE,
        farm_id    contrato.farmacia_id%TYPE
    );

END contrato_ops;
/

CREATE OR REPLACE PACKAGE BODY contrato_ops AS
    
    
    
    PROCEDURE ingresa_contrato (
        compf_id   contrato.compa�iaf_id%TYPE,
        farm_id    contrato.farmacia_id%TYPE,
        fechai     contrato.fechainicio%TYPE,
        fechaf     contrato.fechafin%TYPE,
        text       contrato.texto%TYPE,
        supv       contrato.nombre_supervisor%TYPE
    ) AS
        noexistecompa�ia EXCEPTION;
        noexistefarmacia EXCEPTION;
        c number;
        d number;
        
    BEGIN
        select count(*) into c from COMPA�IA_FARMACEUTICA
        where COMPA�IAF_ID = compf_id; 
        IF(c=1)THEN
            INSERT INTO contrato VALUES (
                compf_id,
                farm_id,
                fechai,
                fechaf,
                text,
                supv
            );
           dbms_output.put_line('Contrato Registrado Correctamente'); 
        ELSE
            RAISE noexistecompa�ia;
        END IF;      
        EXCEPTION
            WHEN noexistecompa�ia THEN
                dbms_output.put_line('No existe la Compa�ia Farmaceutica');     
    END ingresa_contrato;
    
    PROCEDURE modifica_contrato (
        compf_id   contrato.compa�iaf_id%TYPE,
        farm_id    contrato.farmacia_id%TYPE,
        supv       contrato.nombre_supervisor%TYPE
    ) IS
       noexistecontrato EXCEPTION;
       c number;
    BEGIN
    
        c:=0;
        select count(*) into c from contrato where compa�iaf_id=compf_id and farmacia_id=farm_id;
        IF(c=1)THEN
        UPDATE contrato
        SET
            nombre_supervisor = supv
        WHERE
            compa�iaf_id = compf_id
            AND farmacia_id = farm_id;
        ELSE
            RAISE noexistecontrato;
        END IF;
        
        EXCEPTION
            WHEN noexistecontrato THEN
                dbms_output.put_line('no existe ese contrato');
    END modifica_contrato;

    PROCEDURE elimina_contrato (
        compf_id   contrato.compa�iaf_id%TYPE,
        farm_id    contrato.farmacia_id%TYPE
    ) AS
       noexistecontrato EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from contrato where compa�iaf_id=compf_id and farmacia_id=farm_id;
        IF(c=1)THEN
            DELETE FROM contrato
            WHERE
            compa�iaf_id = compf_id
            AND farmacia_id = farm_id;
            dbms_output.put_line('contrato eliminado');
        ELSE
            RAISE noexistecontrato;
        END IF;
        
        EXCEPTION
            WHEN noexistecontrato THEN
                dbms_output.put_line('no existe ese contrato');
    END elimina_contrato;

END contrato_ops;

/



