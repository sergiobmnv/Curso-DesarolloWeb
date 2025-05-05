INSERT INTO tipo_inmueble VALUES ('TI0001','Alquiler');
INSERT INTO tipo_inmueble VALUES ('TI0002','Venta');
INSERT INTO tipo_movimiento VALUES ('TP0001','Alquiler');
INSERT INTO tipo_movimiento VALUES ('TP0002','Venta');
INSERT INTO estado VALUES ('ES0001','Alquiler');
INSERT INTO estado VALUES ('ES0002','Venta');
INSERT INTO horario VALUES ('H0001','Mañana');
INSERT INTO horario VALUES ('H0002','Tarde');
INSERT INTO horario VALUES ('H0003','Noche');
INSERT INTO inmueble VALUES (1,'c/Alamillo 1','Manzanares',13200,120000.00,NULL,'27/01/2020','Piso reformado','TI0002');
INSERT INTO inmueble VALUES (2,'c/Lopez Montes 16','Daimiel',13250,NULL,250.00,NULL,'Piso con calefacción','TI0001');
INSERT INTO inmueble_estado VALUES (2,'ES0001');
INSERT INTO inmueble_estado VALUES (1,'ES0002');
INSERT INTO agente VALUES ('05784218V','c/Alicante 15, 2ºB','Ciudad Real','agente@inmobiliaria.es','926213040','Miguel','Lopez',1400,'Agente de ventas','H0001');
INSERT INTO cliente VALUES ('05863471G','c/Toledo 21 4ºC','Ciudad Real','cliente@gmail.com','926213040','Julian','Fernandez Pinto');
INSERT INTO movimiento VALUES (1,'27/01/2020',145000.00,1,'TP0002','05863471G','05784218V');
INSERT INTO comision VALUES (1, 800, '29/11/2019','05784218V');
INSERT INTO comision VALUES (2, 1300, '30/12/2019','05784218V');
INSERT INTO comision VALUES (3, 1200, '27/01/2020','05784218V');

INSERT INTO agente VALUES ('1111111','c/Alicante 15, 2ºB','Ciudad Real','agente@inmobiliaria.es','926213040','Luis','Lopez',1400,'Agente de ventas','H0001');

INSERT INTO comision VALUES (4, 700, '29/11/2023','1111111');
INSERT INTO comision VALUES (5, 900, '30/12/2023','1111111');

COMMIT;