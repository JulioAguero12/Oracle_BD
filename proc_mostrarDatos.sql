


create or replace PACKAGE mostrarDatos_ops AS
    --Dada una farmacia, mostrar la información de sus contratos. (tabla contratos)
    PROCEDURE mostrarcontratosfarmacia (
        m_farmaid contrato.farmacia_id%TYPE
    );
    
    --Dada una compañia farmaceutica, mostrar la información de sus contratos. (tabla contratos)
    PROCEDURE mostrarcontratoscompañia (
        m_compaid contrato.compañiaf_id%TYPE
    );

    --Dada una compañía farmacéutica, mostrar la lista sus medicamentos.(tabla medicamento)
    PROCEDURE mostrarmedicamentoscompañia (
        s_compid medicamento.compañiaf_id%TYPE
    );

    -- Dada una farmacia, mostrar la lista de sus medicamentos junto con la compañía farmacéutica a la que pertenecen. (tabla stock)
    PROCEDURE mostrarfmc (
        s_farmaid stock.farmacia_id%TYPE
    );

    -- Dada una farmacia, mostrar sus ventas y sus totales por cada venta (por periodo de tiempo). (tabla ventas)
    PROCEDURE mostrarventasfarmacia (
        v_farmaid venta.farmacia_id%TYPE
    );

    --Dado un paciente, mostrar sus recetas registradas. (tabla recetas)
    PROCEDURE mostrarrecetaspaciente (
        r_pacid receta.paciente_id%TYPE
    );

END mostrarDatos_ops;
/
create or replace PACKAGE BODY mostrarDatos_ops AS

    --Dada una farmacia, mostrar la información de sus contratos. 
    PROCEDURE mostrarcontratosfarmacia (
        m_farmaid contrato.farmacia_id%TYPE
    ) AS
        CURSOR farma_contrato IS
        SELECT
            f.nombre              AS farma,
            c.nombre              AS compañia,
            t.fechainicio         AS inicio,
            t.fechafin            AS fin,
            t.texto               AS text,
            t.nombre_supervisor   AS super
        FROM
            farmacia                f,
            compañia_farmaceutica   c,
            contrato                t
        WHERE
            t.farmacia_id = m_farmaid
            AND f.farmacia_id = t.farmacia_id
            AND c.compañiaf_id = t.compañiaf_id;

    BEGIN
        FOR fc IN farma_contrato LOOP
            dbms_output.put_line('la farmacia '
                                 || fc.farma
                                 || ' tiene contrato la compañia '
                                 || fc.compañia
                                 || ', Fecha Inicial-> '
                                 || fc.inicio
                                 || ', Fecha Final-> '
                                 || fc.fin
                                 || ', Descripcion-> '
                                 || fc.text
                                 || ', Supervisor-> '
                                 || fc.super);
        END LOOP;
    END mostrarcontratosfarmacia;
    

    --Dada una compañia farmaceutica, mostrar la información de sus contratos. (tabla contratos)
    PROCEDURE mostrarcontratoscompañia (
        m_compaid contrato.compañiaf_id%TYPE
    ) AS
        CURSOR compa_contrato IS
        SELECT
            f.nombre              AS farma,
            c.nombre              AS compañia,
            t.fechainicio         AS inicio,
            t.fechafin            AS fin,
            t.texto               AS text,
            t.nombre_supervisor   AS super
        FROM
            farmacia                f,
            compañia_farmaceutica   c,
            contrato                t
        WHERE
            c.compañiaf_id = m_compaid
            AND f.farmacia_id = t.farmacia_id
            AND c.compañiaf_id = t.compañiaf_id;

    BEGIN
        FOR fc IN compa_contrato LOOP
            dbms_output.put_line('La Compañia Farmaceutica '
                                 || fc.compañia
                                 || ' tiene contrato la Farmacia '
                                 || fc.farma
                                 || ', Fecha Inicial-> '
                                 || fc.inicio
                                 || ', Fecha Final-> '
                                 || fc.fin
                                 || ', Descripcion-> '
                                 || fc.text
                                 || ', Supervisor-> '
                                 || fc.super);
        END LOOP;
    END mostrarcontratoscompañia;
    

    --Dada una compañía farmacéutica, mostrar la lista sus medicamentos.(tabla medicamento)
    PROCEDURE mostrarmedicamentoscompañia (
        s_compid medicamento.compañiaf_id%TYPE
    ) AS

        CURSOR compañia_medicamento IS
        SELECT
            c.nombre,
            m.nombrecomercial
        FROM
            compañia_farmaceutica   c,
            medicamento             m
        WHERE
            m.compañiaf_id = s_compid
            AND c.compañiaf_id = m.compañiaf_id;
    BEGIN
        FOR a IN compañia_medicamento LOOP
            dbms_output.put_line('La Compañia Farmaceutica '
                                 || a.nombre
                                 || ' produce el medicamento-> '
                                 || a.nombrecomercial);
        END LOOP;
    END mostrarmedicamentoscompañia;


    --Dada una farmacia, mostrar la lista de sus medicamentos junto con la compañía farmacéutica a la que pertenecen. (tabla stock)
    PROCEDURE mostrarfmc (
        s_farmaid stock.farmacia_id%TYPE
    ) AS

        CURSOR farmamedicomp IS
        SELECT
            f.nombre            AS farma,
            c.nombre            AS compañia,
            s.nombrecomercial   AS ncomer
        FROM
            farmacia                f,
            compañia_farmaceutica   c,
            stock                   s
        WHERE
            s.farmacia_id = s_farmaid
            AND f.farmacia_id = s.farmacia_id
            AND c.compañiaf_id = s.compañiaf_id;

    BEGIN
        FOR a IN farmamedicomp LOOP
            dbms_output.put_line('La Farmacia '
                                 || a.farma
                                 || ' tiene el medicamento '
                                 || a.ncomer
                                 || ' de la Compañia Farmaceutica '
                                 || a.compañia);
        END LOOP;
    END mostrarfmc;


    --Dada una farmacia, mostrar sus ventas y sus totales por cada venta (por periodo de tiempo). (tabla ventas)

    PROCEDURE mostrarventasfarmacia (
        v_farmaid venta.farmacia_id%TYPE
    ) AS

        CURSOR venta_farmacia IS
        SELECT
            l.venta_id AS nrovntas,
           SUM (l.cntvendida) AS totalvntas,
            v.fecha AS fecha
        FROM
            venta        v,
            lineaventa   l
        WHERE
            v.farmacia_id= v_farmaid
            AND v.venta_id = l.venta_id
        GROUP BY l.venta_id,v.fecha;
    BEGIN
        FOR con IN venta_farmacia LOOP
            dbms_output.put_line('IdVenta-> '
                                 || con.nrovntas
                                 || ' Total de Ventas-> '
                                 || con.totalvntas
                                 || ' Fecha-> '
                                 || con.fecha);
        END LOOP;
    END mostrarventasfarmacia;


    --Dado un paciente, mostrar sus recetas registradas. (tabla recetas)
    PROCEDURE mostrarrecetaspaciente (
        r_pacid receta.paciente_id%TYPE
    ) AS

        CURSOR recetas_paciente IS
        SELECT
            p.nombre            AS pnombre,
            r.nombrecomercial   AS noc,
            r.fecha             AS fechacompra,
            r.cantidad          AS cant
        FROM
            paciente   p,
            receta     r
        WHERE
            r.paciente_id = r_pacid
            AND p.paciente_id = r.paciente_id;

    BEGIN
        FOR pac IN recetas_paciente LOOP
            dbms_output.put_line('el paciente  '
                                 || pac.pnombre
                                 || ' compro '
                                 || pac.cant
                                 || ' unidades del medicamento '
                                 || pac.noc
                                 || ' Fecha-> '
                                 || pac.fechacompra);
        END LOOP;
    END mostrarrecetaspaciente;

END mostrarDatos_ops;



