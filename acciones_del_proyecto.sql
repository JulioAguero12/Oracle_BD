-- MEDICO 
--Ingresar(nombre, especialidad, años_de_experiencia)
EXECUTE medico_ops.nuevo_medico('Filino de Cos', 'Neurologia',dbms_random.value(1,40));
EXECUTE medico_ops.nuevo_medico('Calcideo', 'Traumatologia',dbms_random.value(1,40));
EXECUTE medico_ops.nuevo_medico( 'Calímaco', 'Neurologia',dbms_random.value(1,40));
EXECUTE medico_ops.nuevo_medico('Cares de Atenas', 'Neumologia',dbms_random.value(1,40));
EXECUTE medico_ops.nuevo_medico('Fainarate', 'Odontología',dbms_random.value(1,40));
EXECUTE medico_ops.nuevo_medico('Hercules', 'Psicologia',dbms_random.value(1,40));

--Si el medico con id 6 quiere cambiar su especialidad y actualizar sus años de experiencia
EXECUTE medico_ops.modificar_medico(6,'Odontología',15);
--Medico con id erroneo
EXECUTE medico_ops.modificar_medico(100,'Odontología',15);

--Eliminar medico con id 6
EXECUTE medico_ops.borrar_medico(6);
--Eliminar medico con id erroneo
EXECUTE medico_ops.borrar_medico(100);

SELECT * FROM medico; 




-- PACIENTE 
--Ingresar (paciente_id, medico_id, nombre, direccion, edad)
EXECUTE paciente_ops.ingresa_paciente (null,2,'Chester Short','Apdo.:163-7179 Imperdiet Avenida',dbms_random.value(1,115));
EXECUTE paciente_ops.ingresa_paciente (null,2,'Brianna C. Lewis','496-3649 Nec Av.',dbms_random.value(1,115));
EXECUTE paciente_ops.ingresa_paciente (null,4,'Zeus C. Irwin','331-5216 Nonummy C/',dbms_random.value(1,115));
EXECUTE paciente_ops.ingresa_paciente (null,5,'Jermaine Conrad','9893 Lorem, C.',dbms_random.value(1,115));
EXECUTE paciente_ops.ingresa_paciente (null,5,'Baxter Castillo','Apartado núm.: 155, 6615 Quam. C/',dbms_random.value(1,115));
EXECUTE paciente_ops.ingresa_paciente (null,5,'Flynn D. Silva','452-3649 Nec Av.',dbms_random.value(1,115));

-- PACIENTE (paciente_id, medico_id, direccion)
--Si el paciente con id 5 quiero cambiar al medico con id 3 ademas de una nueva direccion
EXECUTE paciente_ops.modifica_paciente(5,3,'8003 Pellentesque');
--Modificar Paciente con id erroneo 
EXECUTE paciente_ops.modifica_paciente(50,3,'8003 Pellentesque');

--Eliminar paciente con id 5
EXECUTE paciente_ops.elimina_paciente(6);
--Eliminar paciente con id erroneo
EXECUTE paciente_ops.elimina_paciente(50);

SELECT * FROM paciente;




-- COMPAÑIA FARMACEUTICA 
--ingresar (nombre, telefono)
EXECUTE comp_farm_ops.nueva_compañia('Química Suiza S.A.',2114000);
EXECUTE comp_farm_ops.nueva_compañia('Lansier',3328302);
EXECUTE comp_farm_ops.nueva_compañia('Hersil S.A',7133333);
EXECUTE comp_farm_ops.nueva_compañia('Hospira',2114034);
EXECUTE comp_farm_ops.nueva_compañia('Grünenthal Peruana',2241727);
EXECUTE comp_farm_ops.nueva_compañia('DUBONP S.A.',2211588);
EXECUTE comp_farm_ops.nueva_compañia('Bayer S.A.',2113800);
EXECUTE comp_farm_ops.nueva_compañia('TECNOFARMA',70003000);
EXECUTE comp_farm_ops.nueva_compañia('Genomma Lab',554300);

--Si la compañia Farmaceutica con id 9 quiere cambiar de nombre y actualizar su numero de telefono
EXECUTE comp_farm_ops.modificar_compañia(9,'Laboratorio Genomma',927395123);
--Modificar compañia Farmaceutica con id erronero
EXECUTE comp_farm_ops.modificar_compañia(50,'Química Suiza S.A.',927395123);

--eliminar compañia Farmaceutica con id 9
EXECUTE comp_farm_ops.eliminar_compañia(9)
--eliminar compañia Farmaceutica con id erroneo
EXECUTE comp_farm_ops.eliminar_compañia(90)

SELECT * FROM compañia_farmaceutica;




-- MEDICAMENTO (compañiaf_id,nombrecomercial,formula)
--Ingresar (compañiaf_id,nombrecomercial,formula)
EXECUTE medicamento_ops.nuevo_medicamento(1, 'Fluoruro de sodio','Comprimido');
EXECUTE medicamento_ops.nuevo_medicamento(1, 'Ranitidina','Inyectable');
EXECUTE medicamento_ops.nuevo_medicamento(2, 'Sucralfato','Liquido oral');
EXECUTE medicamento_ops.nuevo_medicamento(2, 'Atropina','Inyectable');
EXECUTE medicamento_ops.nuevo_medicamento(2, 'Omeprazol','Inyectable');
EXECUTE medicamento_ops.nuevo_medicamento(3, 'Domperidona','Inyectable');
EXECUTE medicamento_ops.nuevo_medicamento(4, 'Metformina','Comprimido');
EXECUTE medicamento_ops.nuevo_medicamento(5, 'Glimepirida','Comprimido');
EXECUTE medicamento_ops.nuevo_medicamento(5, 'Metformina + rosiglitazona','Comprimido');
EXECUTE medicamento_ops.nuevo_medicamento(6, 'Repaglinida','Comprimido');
EXECUTE medicamento_ops.nuevo_medicamento(7, 'Tocoferol','Cápsula blanda');
EXECUTE medicamento_ops.nuevo_medicamento(7, 'Retinol','Cápsula blanda');
EXECUTE medicamento_ops.nuevo_medicamento(7, 'Warfarina','Comprimido');
EXECUTE medicamento_ops.nuevo_medicamento(8, 'Heparina sódica','Inyectable');
EXECUTE medicamento_ops.nuevo_medicamento(3, 'Metoclopramida','Líquido oral');

--id compañia, nombre antiguo, nombre nuevo, nueva formula
EXECUTE medicamento_ops.modificar_medicamento(3,'Metoclopramida','Meta','Inyectable');
--Modificando un medicamento de una compañia que no existe
EXECUTE medicamento_ops.modificar_medicamento(50,'Metoclopramida','Meta','Inyectable');

--Eliminando un medicamento con id compañia 3 y nombrecomercial Meta
EXECUTE medicamento_ops.eliminar_medicamento(3,'Meta');
--Eliminando un medicamento con id compañia inexistente
EXECUTE medicamento_ops.eliminar_medicamento(30,'Meta');

SELECT * FROM MEDICAMENTO;




-- FARMACIA 
--Ingresar nombre, direccion, telefono)
EXECUTE farmacia_ops.nueva_farmacia('Boticas Peru','Jr. Baltazar Grados Nro. 794',2744207);
EXECUTE farmacia_ops.nueva_farmacia('Famifarma', 'Mza. B Lote. 13 Asc. los Topacios',6152100);
EXECUTE farmacia_ops.nueva_farmacia('Boticas la Merced', 'Mza. T5 Lote. 10 Sec. 3er Sector Angamos',2193300);
EXECUTE farmacia_ops.nueva_farmacia('Farmacias Vida Sana', 'Av. Leandra Torres Nro. 276',2155300);
EXECUTE farmacia_ops.nueva_farmacia('Farmacias Unidas', 'Av. Guardia Civil Nro. 498',2652200);
EXECUTE farmacia_ops.nueva_farmacia('Farmacias Santa Ana', 'Av. 13 de Enero Nro. 2282',7984500);
EXECUTE farmacia_ops.nueva_farmacia('Farmacias Kalyfar', 'Av. Armando Filomeno Nro. 219',4523100);
EXECUTE farmacia_ops.nueva_farmacia('Farmacias Inkafarma', 'Av. Los Proces',5223200);
EXECUTE farmacia_ops.nueva_farmacia('Farmacias Salud', 'Av. Los Angeles',6793200);

--Modificar nombre de la farmacia ,direccion , telefono
EXECUTE farmacia_ops.modificar_farmacia(9,'Farmacias Covid','Av. Universitaria 550','924613998');
--Modificar con farmacia id erroneo
EXECUTE farmacia_ops.modificar_farmacia(90,'Farmacias Covid','Av. Universitaria 550','924613998');

--Eliminar farmacia con id 9
EXECUTE farmacia_ops.elimina_farmacia(9)
--Eliminar farmacia con id erroneo
EXECUTE farmacia_ops.elimina_farmacia(90)

SELECT * FROM farmacia;




-- CONTRATO (compañiaf_id,farmacia_id,fechainicio,fechafin,texto, nombresupervisor)
EXECUTE contrato_ops.ingresa_contrato(4, 2, '01-03-2015', '01-01-2021', 'TextoA','Flynn D. Silva');
EXECUTE contrato_ops.ingresa_contrato(5, 1, '11-06-2013', '15-12-2021', 'TextoB','Mona Wilkins');
EXECUTE contrato_ops.ingresa_contrato(7, 5, '12-12-2015', '14-01-2024', 'TextoC','Jade H. Bray');
EXECUTE contrato_ops.ingresa_contrato(8, 7, '15-05-2012', '15-10-2025', 'TextoD','April Y. Wagner');
EXECUTE contrato_ops.ingresa_contrato(2, 1, '12-12-2017', '14-01-2023', 'TextoE','Kyle K. Mitchell');
EXECUTE contrato_ops.ingresa_contrato(8, 1, '15-05-2018', '15-10-2021', 'TextoF','Troy G. Cotton');
EXECUTE contrato_ops.ingresa_contrato(4, 8, '01-03-2015', '01-01-2021', 'TextoA','Flynn D. Silva');
EXECUTE contrato_ops.ingresa_contrato(5, 5, '11-06-2013', '15-12-2021', 'TextoB','Mona Wilkins');
EXECUTE contrato_ops.ingresa_contrato(1, 5, '12-12-2015', '14-01-2024', 'TextoC','Jade H. Bray');
EXECUTE contrato_ops.ingresa_contrato(2, 7, '15-05-2012', '15-10-2025', 'TextoD','April Y. Wagner');
EXECUTE contrato_ops.ingresa_contrato(6, 1, '12-12-2017', '14-01-2023', 'TextoE','Kyle K. Mitchell');
EXECUTE contrato_ops.ingresa_contrato(3, 1, '01-03-2015', '01-01-2021', 'TextoA','Flynn D. Silva');
EXECUTE contrato_ops.ingresa_contrato(4, 1, '11-06-2013', '15-12-2021', 'TextoB','Mona Wilkins');
EXECUTE contrato_ops.ingresa_contrato(7, 1, '15-05-2012', '15-10-2025', 'TextoD','April Y. Wagner');
EXECUTE contrato_ops.ingresa_contrato(1,2, '15-05-2018', '15-10-2021', 'TextoF','Troy G. Cotton');
EXECUTE contrato_ops.ingresa_contrato(1,3, '01-03-2015', '01-01-2021', 'TextoA','Flynn D. Silva');
EXECUTE contrato_ops.ingresa_contrato(1,4, '11-06-2013', '15-12-2021', 'TextoB','Mona Wilkins');
EXECUTE contrato_ops.ingresa_contrato(1,6, '12-12-2015', '14-01-2024', 'TextoC','Jade H. Bray');
EXECUTE contrato_ops.ingresa_contrato(1,7, '15-05-2012', '15-10-2025', 'TextoD','April Y. Wagner');


EXECUTE contrato_ops.modifica_contrato(4, 2, 'Chupetin');

EXECUTE contrato_ops.elimina_contrato(4, 2);

SELECT * FROM contrato;




-- STOCK 
-- Ingresar FARMACIA_ID,NOMBRECOMERCIAL,COMPAÑIAF_ID,PRECIO,CANTIDAD
EXECUTE stock_ops.nuevo_stock(1,'Glimepirida',5,15,6);
EXECUTE stock_ops.nuevo_stock(5,'Retinol',7,15,10);
EXECUTE stock_ops.nuevo_stock(7,'Heparina sódica',8,5,18);
EXECUTE stock_ops.nuevo_stock(2,'Fluoruro de sodio',1,12,100);
EXECUTE stock_ops.nuevo_stock(3,'Fluoruro de sodio',1,15,20);
EXECUTE stock_ops.nuevo_stock(4,'Fluoruro de sodio',1,17,90);
EXECUTE stock_ops.nuevo_stock(5,'Fluoruro de sodio',1,18,80);
EXECUTE stock_ops.nuevo_stock(6,'Fluoruro de sodio',1,20,82);
EXECUTE stock_ops.nuevo_stock(1,'Sucralfato',2,15,10);
EXECUTE stock_ops.nuevo_stock(1,'Repaglinida',6,1,100);
EXECUTE stock_ops.nuevo_stock(1,'Domperidona',3,17,90);
EXECUTE stock_ops.nuevo_stock(1,'Metformina',4,18,80);
EXECUTE stock_ops.nuevo_stock(1,'Heparina sódica',8,20,80);

--Ingresando un nuevo stock a una farmacia y compañia farmaceutica que no tienen contrato
EXECUTE stock_ops.nuevo_stock(7,'Glimepirida',5,15,100);

--Modificando el STOCK de ID 32 Actulizando su precio y luego su cantidad
EXECUTE stock_ops.modificar_producto(32,21,85)
--Modificando el STOCK erroneo
EXECUTE stock_ops.modificar_producto(100,21,85)

--Eliminando el STOCK de ID 32
EXECUTE stock_ops.eliminar_producto(32)
--Eliminando un STOCK erroneo
EXECUTE stock_ops.eliminar_producto(100)

SELECT * FROM stock;




-- VENTA 
--Ingresar FARMACIA ID, PACIENTE ID
EXECUTE ventas_ops.ingresa_venta(1,1);
EXECUTE ventas_ops.ingresa_venta(2,2);
EXECUTE ventas_ops.ingresa_venta(5,4);
EXECUTE ventas_ops.ingresa_venta(1,4);
EXECUTE ventas_ops.ingresa_venta(2,5);
EXECUTE ventas_ops.ingresa_venta(1,5);
EXECUTE ventas_ops.ingresa_venta(1,2);
EXECUTE ventas_ops.ingresa_venta(1,1);
EXECUTE ventas_ops.ingresa_venta(5,4);
EXECUTE ventas_ops.ingresa_venta(1,4);
EXECUTE ventas_ops.ingresa_venta(2,5);
EXECUTE ventas_ops.ingresa_venta(1,5);
EXECUTE ventas_ops.ingresa_venta(1,2);
EXECUTE ventas_ops.ingresa_venta(1,1);
EXECUTE ventas_ops.ingresa_venta(4,NULL);
EXECUTE ventas_ops.ingresa_venta(1,NULL);


--Eliminar venta con ventaID igual a 1 y pacienteID igual a 1
EXECUTE ventas_ops.elimina_venta(1,1)
--Eliminar venta con ventaID igual a 4 y pacienteID igual a null
EXECUTE ventas_ops.elimina_venta(4,null)
--Eliminar venta con ventaID que no existe
EXECUTE ventas_ops.elimina_venta(50,null)




-- LINEA DE VENTA 
--Ingresar
--ventaID stockid, ventaID, FARMID, NombreComercial, CompañiaID, PrecioLV, cannt
EXECUTE lineaventa_ops.ingresa_lv(9,7,1,'Sucralfato',2,15,2);
EXECUTE lineaventa_ops.ingresa_lv(11,8,1,'Domperidona',3,17,2);
EXECUTE lineaventa_ops.ingresa_lv(12,4,1,'Metformina',4,18,2);
EXECUTE lineaventa_ops.ingresa_lv(4,2,2,'Fluoruro de sodio',1,12,2);
EXECUTE lineaventa_ops.ingresa_lv(7,3,5,'Fluoruro de sodio',1,18,2);
EXECUTE lineaventa_ops.ingresa_lv(10,4,1,'Repaglinida',6,1,2);
EXECUTE lineaventa_ops.ingresa_lv(4,5,2,'Fluoruro de sodio',1,12,2);
EXECUTE lineaventa_ops.ingresa_lv(1,6,1,'Glimepirida',5,15,2);
EXECUTE lineaventa_ops.ingresa_lv(9,7,1,'Sucralfato',2,15,2);
EXECUTE lineaventa_ops.ingresa_lv(11,8,1,'Domperidona',3,17,2);
EXECUTE lineaventa_ops.ingresa_lv(7,9,5,'Fluoruro de sodio',1,18,2);
EXECUTE lineaventa_ops.ingresa_lv(10,10,1,'Repaglinida',6,1,2);
EXECUTE lineaventa_ops.ingresa_lv(4,11,2,'Fluoruro de sodio',1,12,2);
EXECUTE lineaventa_ops.ingresa_lv(10,12,1,'Repaglinida',6,1,2);
EXECUTE lineaventa_ops.ingresa_lv(1,13,1,'Glimepirida',5,15,2);
EXECUTE lineaventa_ops.ingresa_lv(12,14,1,'Metformina',4,18,2);
EXECUTE lineaventa_ops.ingresa_lv(6,15,4,'Fluoruro de sodio',1,17,2);
EXECUTE lineaventa_ops.ingresa_lv(9,16,1,'Sucralfato',2,15,2);

EXECUTE lineaventa_ops.ingresa_lv(9,7,1,'Sucralfato',2,15,3);
EXECUTE lineaventa_ops.ingresa_lv(11,8,1,'Domperidona',3,17,3);
EXECUTE lineaventa_ops.ingresa_lv(12,4,1,'Metformina',4,18,3);
EXECUTE lineaventa_ops.ingresa_lv(4,2,2,'Fluoruro de sodio',1,12,3);
EXECUTE lineaventa_ops.ingresa_lv(7,3,5,'Fluoruro de sodio',1,18,3);
EXECUTE lineaventa_ops.ingresa_lv(10,4,1,'Repaglinida',6,1,3);
EXECUTE lineaventa_ops.ingresa_lv(4,5,2,'Fluoruro de sodio',1,12,3);
EXECUTE lineaventa_ops.ingresa_lv(1,6,1,'Glimepirida',5,15,3);
EXECUTE lineaventa_ops.ingresa_lv(9,7,1,'Sucralfato',2,15,3);
EXECUTE lineaventa_ops.ingresa_lv(11,8,1,'Domperidona',3,17,3);
EXECUTE lineaventa_ops.ingresa_lv(7,9,5,'Fluoruro de sodio',1,18,3);
EXECUTE lineaventa_ops.ingresa_lv(10,10,1,'Repaglinida',6,1,3);
EXECUTE lineaventa_ops.ingresa_lv(4,11,2,'Fluoruro de sodio',1,12,3);
EXECUTE lineaventa_ops.ingresa_lv(10,12,1,'Repaglinida',6,1,3);
EXECUTE lineaventa_ops.ingresa_lv(1,13,1,'Glimepirida',5,15,3);
EXECUTE lineaventa_ops.ingresa_lv(12,14,1,'Metformina',4,18,3);
EXECUTE lineaventa_ops.ingresa_lv(6,15,4,'Fluoruro de sodio',1,17,3);
EXECUTE lineaventa_ops.ingresa_lv(9,16,1,'Sucralfato',2,15,3);

--Actualizar
--numlineaventa,farmID, cantidad
EXECUTE lineaventa_ops.modifica_lv(22,1,4)

--Eliminar
EXECUTE lineaventa_ops.elimina_lv(26)





-- RECETA (medico_id, paciente_id, nombrecomercial, compañiaf_id, fecha, cantidad)
--Registar Receta
EXECUTE receta_ops.ingresa_receta(2,1,'Glimepirida',5,to_date(sysdate,'YYYY/MM/DD:HH:MI:SSAM'), 2);
EXECUTE receta_ops.ingresa_receta(3,2,'Tocoferol',7,to_date(sysdate,'YYYY/MM/DD:HH:MI:SSAM'), 1);

--Actualizar receta
--recetaID, cantidad
EXECUTE receta_ops.modifica_receta(1,3)

--Eliminar
--recetaID
EXECUTE receta_ops.elimina_receta(2)

SELECT * FROM receta;




--Dada una farmacia, mostrar la información de sus contratos. 
DECLARE 
    c_codigofarmacia contrato.Farmacia_ID%TYPE := &codigo;
BEGIN
    mostrarDatos_ops.mostrarContratosFarmacia(c_codigofarmacia);
END;



--Dada una compañia farmaceutica, mostrar la información de sus contratos. (tabla contratos)
DECLARE 
    c_codigocompannia contrato.compañiaf_id%TYPE := &codigo;
BEGIN
    mostrardatos_ops.mostrarcontratoscompañia(c_codigocompannia);
END;




--Dada una compañía farmacéutica, mostrar la lista sus medicamentos.(tabla stock)
DECLARE 
    s_codigocomp stock.CompañiaF_ID%TYPE := &codigo;
BEGIN
     mostrarDatos_ops.mostrarMedicamentosCompañia(s_codigocomp);
END;




--Dada una farmacia, mostrar la lista de sus medicamentos junto con la compañía farmacéutica a la que pertenecen. (tabla stock)
DECLARE 
    s_farmacodigo stock.Farmacia_ID%TYPE := &codigo;
BEGIN
     mostrarDatos_ops.mostrarFMC( s_farmacodigo);
END;




 --Dada una farmacia, mostrar sus ventas y sus totales por cada venta (por periodo de tiempo). (tabla ventas)
 -- probar con codigo 1200 para la farmaci_id
DECLARE 
    v_farmacodigo venta.Farmacia_ID%TYPE := &codigo;
BEGIN
     mostrarDatos_ops.mostrarventasfarmacia( v_farmacodigo);
END;




--Dado un paciente, mostrar sus recetas registradas. (tabla recetas)
DECLARE 
    r_paccodigo Receta.Paciente_ID%TYPE := &codigo;
BEGIN
     mostrarDatos_ops.mostrarRecetasPaciente(r_paccodigo);
END;





