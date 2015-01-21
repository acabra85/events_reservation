--
-- Poblar cada una de las tablas de alphaingesoft_zxq_arrancar
--
use `xth_8767702_arrancar`;
-- Eliminacion logica de los datos contenidos en las tablas
DELETE FROM `servicio`;
DELETE FROM `proveedor`;
DELETE FROM `ciudad`;
DELETE FROM `tipo_servicio`;

INSERT INTO `proveedor`(`prov_id`,`prov_nombre`,`prov_nit`,`prov_telefono`) VALUES
(1,'Avianca','23451989','(031)7276493'),
(2,'American Airlines','7428982','(091)7472693'),
(3,'Aviatur','62737720','(094)7272643'),
(4,'Hotel Tequendama','72539943','(093)7345893'),
(5,'Cosmos 100','626305621','(091)4334493'),
(6,'Turismo','917294732','(091)9882393'),
(7,'La Chivita','92282182','(094)6542493');

INSERT INTO `ciudad`(`ciudad_id`,`ciudad_nombre`) VALUES
(1,'Bogota'),
(2,'Bucaramanga'),
(3,'Cali'),
(4,'Medellin'),
(5,'Cartagena'),
(6,'Barranquilla'),
(7,'Cucuta');

INSERT INTO `tipo_servicio`(`tipo_srv_id`,`tipo_srv_nombre`,`tipo_srv_descripcion`) VALUES
(1,'Aerolineas','Vuelo Internacional'),
(2,'Hospedaje','Estadia una noche'),
(3,'Guia Turistico','Sitios recomendados'),
(4,'Pasaje terrestre','Viajar en la ciudad');

INSERT INTO `servicio`(`servicio_id`,`tipo_servicio_tipo_srv_id`,`proveedor_prov_id`,`ciudad_ciudad_id`,`servicio_costo`,`servicio_descripcion`,`servicio_fecha`,`servicio_hora` ) VALUES
(1,1,2,4,500000,'Vuelo Internacional Medellin - Lima','2012-06-30','08:30:00'),
(2,1,1,5,230000,'Vuelo Nacional Cartagena - Bogota','2012-06-30','08:30:00'),
(3,2,5,1,200000,'Noche en hotel estadia una noche con comida','2012-06-30','08:30:00'),
(4,3,6,4,500000,'Guia turistico sitios recomendados','2012-06-30','08:30:00'),
(5,4,7,6,92000,'Pasaje viajar en la ciudad en chiva','2012-06-30','08:30:00'),
(6,1,1,5,230000,'Vuelo Nacional Cartagena - Bogota','2012-06-30','09:30:00'),
(7,1,1,5,230000,'Vuelo Nacional Cartagena - Bogota','2012-06-30','10:30:00'),
(8,1,1,5,230000,'Vuelo Nacional Cartagena - Bogota','2012-06-30','11:30:00');


INSERT INTO `secuencia_reserva`(`seq_reserva_id`,`seq_reserva_dato`)
	VALUES (0,0);

