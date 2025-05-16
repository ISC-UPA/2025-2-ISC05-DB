-- primer nivel --

INSERT INTO especialidades VALUES (1,'Análisis'),(2,'Cirugía'),(3,'General'),(4,'Ginecología'),(5,'Intensivos'),(6,'Oftalmología'),(7,'Pediatría'),(8,'Psiquiatría'),(9,'Radiología');

INSERT INTO ciudades VALUES (1,'Alcorcón'),(2,'Getafe'),(3,'Madrid'),(4,'Móstoles');

-- 2 nivel ----

INSERT INTO medicos VALUES ('AJH','Jiménez Hernández Juan Carlos','Antonio',7),('CEM','Esteban Muñoz Sergio','Carmen',8),('CSM','Sánchez Martínez','Carlos',3),('ESMH','San Martín Hernández','Eva',7),('FHL','Hernández López','Fernanda',9),('FVP','Vidal Planella','Federico',1),('JMP','Moreno Navarro','Juana',5),('OPA','Pons Álvarez','Olga',5),('PAP','Armengol Prats','Pedro',2),('SGM','Gutiérrez Mellado','Sebastián',6),('SVT','Vázquez Torres','Santiago',4);

INSERT INTO pacientes VALUES (100,'Romerales Pinto','José','1975-03-21 00:00:00','Azorín, 34','912563256.',4),(102,'González Sancho','Santiago','1947-10-30 00:00:00','Coslada, 12','914562587.',3),(103,'Rodríguez Santacana','Carmen','1987-11-06 00:00:00','Javier Poncela, 3','915478555.',2),(110,'Puig Monza','Alberto','1936-07-18 00:00:00','División Azul, 56','914589966.',2),(120,'Pérez Sanabria','Sergio','1950-04-12 00:00:00','Pizarro, 45','915584471.',1),(130,'Flores López','Jaime','1932-01-23 00:00:00','Alcatraz, 56','914526654.',3),(131,'Morales Miguel','Enrique','1990-08-12 00:00:00','Madrid, 45','914552203.',3),(140,'Torrente Hermosilla','Ana','1958-03-25 00:00:00','Barcelona, 35','914785236.',1),(142,'Prats Hernández','Olga','1958-03-25 00:00:00','Versalles, 2','917458963.',4),(200,'Jiménez Blanco','Carlos','1973-01-12 00:00:00','Gran Vía, 123','914589632.',3),(201,'Tomás Caballo','María','1955-05-05 00:00:00','Enrique Velasco, 3','914578559.',3),(207,'Guerra Santa','Rogelia','1990-07-12 00:00:00','Castellana, 12','914562258.',3),(220,'Granadino Callejas','Iván','1975-07-19 00:00:00','Doctor Más, 46','914522369.',3),(231,'Navarrete Prat','Luis','1940-06-13 00:00:00','Trujillo, 33','914512589.',1),(240,'Armengol Prats','Mónica','1985-07-02 00:00:00','Doce de octrubre, 1','914588963.',3),(300,'Rodríguez Monzón','Joaquín','1977-05-05 00:00:00','Barcelona, 111','914578521.',1),(302,'Martínez Lozano','Loreto','1951-01-24 00:00:00','Cipreses, 56','914589632.',1);

--  3 nivel ----

INSERT INTO citas VALUES (1,'1998-04-23 00:00:00','SVT',200,101,'A',300.00),(2,'1998-05-24 00:00:00','CSM',103,105,'A',300.00),(3,'1998-06-15 00:00:00','PAP',300,125,'B',300.00),(4,'1998-09-12 00:00:00','SGM',120,204,'B',300.00),(5,'1998-10-12 00:00:00','SGM',100,205,'B',300.00),(7,'1999-02-01 00:00:00','FHL',240,201,'A',100.00),(8,'2000-04-02 00:00:00','OPA',110,201,'A',100.00),(9,'2000-05-03 00:00:00','FVP',220,305,'A',300.00),(11,'2000-05-13 00:00:00','OPA',207,306,'A',300.00),(12,'2000-06-15 00:00:00','CSM',220,303,'B',300.00),(14,'2000-06-30 00:00:00','SGM',130,504,'B',300.00),(15,'2000-07-02 00:00:00','ESMH',231,504,'B',300.00),(16,'2000-07-05 00:00:00','FVP',200,405,'B',300.00),(17,'2000-08-08 00:00:00','PAP',140,401,'A',300.00),(18,'2000-08-10 00:00:00','SGM',142,409,'B',300.00),(19,'2000-08-12 00:00:00','SGM',120,504,'A',300.00),(20,'2000-08-20 00:00:00','FHL',240,509,'B',300.00);


