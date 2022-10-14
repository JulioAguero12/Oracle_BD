CREATE OR REPLACE PACKAGE medicamento_ops AS
    --agregar medicamento
    PROCEDURE nuevo_medicamento(
    f_medComp_id medicamento.Compa�iaF_id%TYPE,
    f_nomCom medicamento.NombreComercial%TYPE,
    f_formula medicamento.formula%TYPE);
    
    --eliminar medicamento
    PROCEDURE eliminar_medicamento(
    f_medComp_id medicamento.Compa�iaF_id%TYPE,
    f_nomCom medicamento.NombreComercial%TYPE);
    
    --modificar medicamento
    PROCEDURE modificar_medicamento(
    f_medComp_id medicamento.Compa�iaF_id%TYPE,
    f_nomCom medicamento.NombreComercial%TYPE,
    f_nuevoNomCom medicamento.NombreComercial%TYPE,
    f_formula medicamento.formula%TYPE);
    
END medicamento_ops;
/

CREATE OR REPLACE PACKAGE BODY medicamento_ops AS

    PROCEDURE nuevo_medicamento(
        f_medComp_id medicamento.Compa�iaF_id%TYPE,
        f_nomCom medicamento.NombreComercial%TYPE,
        f_formula medicamento.formula%TYPE)
    AS
        no_existe_compa�ia EXCEPTION;
        c number; 
    BEGIN
        select count(*) into c from COMPA�IA_FARMACEUTICA
        where COMPA�IAF_ID = f_medComp_id; 
        IF(c=1)THEN
            INSERT INTO medicamento(Compa�iaF_id,NombreComercial,formula)
            VALUES(f_medComp_id,f_nomCom,f_formula);
           dbms_output.put_line('Medicamento Registrado Correctamente'); 
        ELSE
            RAISE no_existe_compa�ia;
        END IF;      
        EXCEPTION
            WHEN no_existe_compa�ia THEN
                dbms_output.put_line('No existe la Compa�ia Farmaceutica');
    END nuevo_medicamento;
    
    --eliminar medicamento
    PROCEDURE eliminar_medicamento (
        f_medComp_id medicamento.Compa�iaF_id%TYPE,
        f_nomCom medicamento.NombreComercial%TYPE)
    AS
       no_existe_compa�ia EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from MEDICAMENTO 
        where COMPA�IAF_ID = f_medComp_id AND NOMBRECOMERCIAL = f_nomCom;
        IF(c=1)THEN
            DELETE FROM MEDICAMENTO
            WHERE COMPA�IAF_ID = f_medComp_id AND NOMBRECOMERCIAL = f_nomCom;
            dbms_output.put_line('Medicamento eliminado');
        ELSE
            RAISE no_existe_compa�ia;
        END IF;
        
        EXCEPTION
            WHEN no_existe_compa�ia THEN
                dbms_output.put_line('No existe el medicamento');
    END eliminar_medicamento;
 
    --modificar medicamento
    PROCEDURE modificar_medicamento (
        f_medComp_id medicamento.Compa�iaF_id%TYPE,
        f_nomCom medicamento.NombreComercial%TYPE,
        f_nuevoNomCom medicamento.NombreComercial%TYPE,
        f_formula medicamento.formula%TYPE)
    AS
        no_existe_compa�ia EXCEPTION;
       c number;
    BEGIN
        c:=0;
        select count(*) into c from COMPA�IA_FARMACEUTICA
        where COMPA�IAF_ID = f_medComp_id;   
        IF(c=1)THEN
             UPDATE medicamento
            SET NombreComercial = f_NuevoNomCom, formula = f_formula
            WHERE NombreComercial = f_nomCom AND Compa�iaF_ID = f_medComp_id;
            dbms_output.put_line('Medicamento modificado');
        ELSE
            RAISE no_existe_compa�ia;
        END IF;      
        EXCEPTION
            WHEN no_existe_compa�ia THEN
                dbms_output.put_line('Medicamento no existente');
    END modificar_medicamento;
    
END medicamento_ops;
/