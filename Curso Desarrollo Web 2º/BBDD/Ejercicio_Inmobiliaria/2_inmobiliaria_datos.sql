INSERT INTO tipo_inmueble VALUES ('TI0001','Alquiler'),('TI0002','Venta');

INSERT INTO tipo_movimiento VALUES ('TP0001','Alquiler'),('TP0002','Venta');

INSERT INTO estado VALUES ('ES0001','Alquiler'),('ES0002','Venta');

INSERT INTO horario VALUES ('H0001','Mañana'),('H0002','Tarde'),('H0003','Noche');

INSERT INTO inmueble VALUES (1,'c/Alamillo 1','Manzanares',13200,120000.00,NULL,'2020-01-27 00:00:00','Piso reformado','TI0002'),
(2,'c/Lopez Montes 16','Daimiel',13250,NULL,250.00,NULL,'Piso con calefacción','TI0001');

INSERT INTO inmueble_estado VALUES (2,'ES0001'),(1,'ES0002');

INSERT INTO agente VALUES 
('05784218V','c/Alicante 15, 2ºB','Ciudad Real','agente1@inmobiliaria.es','926213040','Miguel','Lopez',1400,'Agente de ventas','H0001'),
('87452147P','c/Alicante 15, 2ºB','Ciudad Real','agente2@inmobiliaria.es','926213040','Luis','Lopez',1400,'Agente de administracion','H0002'),
('21365478D','c/Burgos 15, 2ºB','Argamasilla','agente3@inmobiliaria.es','926555040','Nicolas','Cosoui',3000,'Agente de alquiler','H0001'),
('95478568M','c/Teruel 15, 2ºB','Manzanares','agente4@inmobiliaria.es','926658940','Manuel','Gonzalez',1800,'Agente de comercio','H0001'),
('11178568M','c/Teruel 15, 2ºB','Almagro','agente4@inmobiliaria.es','926658940','Angel','Ruiz',1800,'Agente de comercio','H0003');

INSERT INTO cliente VALUES ('05863471G','c/Toledo 21 4ºC','Ciudad Real','cliente1@gmail.com','926213040','Julian','Fernandez Pinto'),
('74125896K','c/Toledo 21 4ºC','Ciudad Real','cliente2@gmail.com','926213040','Julian','Fernandez Pinto'),
('85412364F','c/Lugo 22','Manzanares','cliente3@gmail.com','926212222','Julian','Fernandez Pinto'),
('95123458S','c/Sevilla 54','Daimiel','cliente4@gmail.com','926212587','Julian','Fernandez Pinto'),
('75321485M','c/Segura 45','Ciudad Real','cliente5@gmail.com','926219632','Julian','Fernandez Pinto');

INSERT INTO movimiento VALUES (1,'2020-01-27 00:00:00',145000.00,1,'TP0002','05863471G','05784218V');
INSERT INTO movimiento VALUES (2,'2025-01-30 00:00:00',145000.00,1,'TP0002','74125896K','05784218V');
INSERT INTO movimiento VALUES (3,'2025-01-30 00:00:00',145000.00,1,'TP0002','75321485M','05784218V');
INSERT INTO movimiento VALUES (4,'2025-01-30 00:00:00',145000.00,1,'TP0002','85412364F','87452147P');
INSERT INTO movimiento VALUES (5,'2025-01-30 00:00:00',145000.00,1,'TP0001','85412364F','87452147P');
INSERT INTO movimiento VALUES (6,'2025-01-30 00:00:00',145000.00,1,'TP0001','95123458S','21365478D');
INSERT INTO movimiento VALUES (7,'2025-01-30 00:00:00',145000.00,1,'TP0002','75321485M','95478568M');
INSERT INTO movimiento VALUES (8,'2025-01-30 00:00:00',145000.00,1,'TP0002','74125896K','95478568M');
INSERT INTO movimiento VALUES (9,'2025-02-17 00:00:00',145000.00,1,'TP0001','85412364F','87452147P');

INSERT INTO comision VALUES (1, 800, '2019-11-29 00:00:00','05784218V'),
(2, 1300, '2019-12-30 00:00:00','05784218V'),
(3, 1200, '2020-01-27 00:00:00','87452147P'),
(4, 700, '2023-11-29 00:00:00','21365478D'),
(5, 900, '2023-12-30 00:00:00','87452147P');