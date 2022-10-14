CREATE OR REPLACE PACKAGE medicamento_ops AS
    --agregar medicamento
    PROCEDURE nuevo_medicamento(
    f_medComp_id medicamento.CompañiaF_id%TYPE,
    f_nomCom medicamento.NombreComercial%TYPE,
    f_formula medicamento.formula%TYPE);
    
    --eliminar medicamento
    PROCEDURE eliminar_medicamento(
    f_medComp_id medicamento.CompañiaF_id%TYPE,
    f_nomCom medicamento.NombreComercial%TYPE);
    
    --modificar medicamento
    PROCEDURE modificar_medicamento(
    f_medComp_id medicamento.CompañiaF_id%TYPE,
    f_nomCom medicamento.NombreComercial%TYPE,
    f_nuevoNomCom medicamento.NombreComercial%TYPE,
    f_formula medicamento.formula%TYPE);
    
END medicamento_ops;
/

CREATE OR REPLACE PACKAGE BODY medicamento_ops AS

    PROCEDURE nuevo_medicamento(
        f_medComp_id medicamento.CompañiaF_id%TYPE,
        f_nomCom medicamento.NombreComercial%TYPE,
        f_formula medicamento.formula%TYPE)
    AS
        no_existe_compañia EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from COMPAÑIA_FARMACEUTICA
        where COMPAÑIAF_ID = f_medComp_id; 
        IF(c=1)THEN
            INSERT INTO medicamento(CompañiaF_id,NombreComercial,formula)
            VALUES(f_medComp_id,f_nomCom,f_formula);
           dbms_output.put_line('Medicamento Registrado Correctamente'); 
        ELSE
            RAISE no_existe_compañia;
        END IF;      
        EXCEPTION
            WHEN no_existe_compañia THEN
                dbms_output.put_line('No existe la Compañia Farmaceutica');
    END nuevo_medicamento;
    
    --eliminar medicamento
    PROCEDURE eliminar_medicamento (
        f_medComp_id medicamento.CompañiaF_id%TYPE,
        f_nomCom medicamento.NombreComercial%TYPE)
    AS
       no_existe_compañia EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from MEDICAMENTO 
        where COMPAÑIAF_ID = f_medComp_id AND NOMBRECOMERCIAL = f_nomCom;
        IF(c=1)THEN
            DELETE FROM MEDICAMENTO
            WHERE COMPAÑIAF_ID = f_medComp_id AND NOMBRECOMERCIAL = f_nomCom;
            dbms_output.put_line('Medicamento eliminado');
        ELSE
            RAISE no_existe_compañia;
        END IF;
        
        EXCEPTION
            WHEN no_existe_compañia THEN
                dbms_output.put_line('No existe el medicamento');
    END eliminar_medicamento;
 
    --modificar medicamento
    PROCEDURE modificar_medicamento (
        f_medComp_id medicamento.CompañiaF_id%TYPE,
        f_nomCom medicamento.NombreComercial%TYPE,
        f_nuevoNomCom medicamento.NombreComercial%TYPE,
        f_formula medicamento.formula%TYPE)
    AS
        no_existe_compañia EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from COMPAÑIA_FARMACEUTICA
        where COMPAÑIAF_ID = f_medComp_id;   
        IF(c=1)THEN
             UPDATE medicamento
            SET NombreComercial = f_NuevoNomCom, formula = f_formula
            WHERE NombreComercial = f_nomCom AND CompañiaF_ID = f_medComp_id;
            dbms_output.put_line('Medicamento modificado');
        ELSE
            RAISE no_existe_compañia;
        END IF;      
        EXCEPTION
            WHEN no_existe_compañia THEN
                dbms_output.put_line('Medicamento no existente');
    END modificar_medicamento;
    
END medicamento_ops;
/