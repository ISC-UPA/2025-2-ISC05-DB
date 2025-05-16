-- Nivel 1

-- ----------------------------
-- Records of especialidades
-- ----------------------------
INSERT INTO especialidades VALUES ('1', 'Análisis');
INSERT INTO especialidades VALUES ('2', 'Cirugía');
INSERT INTO especialidades VALUES ('3', 'General');
INSERT INTO especialidades VALUES ('4', 'Ginecología');
INSERT INTO especialidades VALUES ('5', 'Intensivos');
INSERT INTO especialidades VALUES ('6', 'Oftalmología');
INSERT INTO especialidades VALUES ('7', 'Pediatría');
INSERT INTO especialidades VALUES ('8', 'Psiquiatría');
INSERT INTO especialidades VALUES ('9', 'Radiología');
COMMIT;
COMMIT;

-- ----------------------------
-- Records of ciudades
-- ----------------------------
INSERT INTO ciudades VALUES ('1', 'Alcorcón');
INSERT INTO ciudades VALUES ('2', 'Getafe');
INSERT INTO ciudades VALUES ('3', 'Madrid');
INSERT INTO ciudades VALUES ('4', 'Móstoles');
COMMIT;
COMMIT;

-- Nivel 2

-- ----------------------------
-- Records of medicos
-- ----------------------------
INSERT INTO medicos VALUES ('AJH', 'Jiménez Hernández Juan Carlos', 'Antonio', '7');
INSERT INTO medicos VALUES ('CEM', 'Esteban Muñoz Sergio', 'Carmen', '8');
INSERT INTO medicos VALUES ('CSM', 'Sánchez Martínez', 'Carlos', '3');
INSERT INTO medicos VALUES ('ESMH', 'San Martín Hernández', 'Eva', '7');
INSERT INTO medicos VALUES ('FHL', 'Hernández López', 'Fernanda', '9');
INSERT INTO medicos VALUES ('FVP', 'Vidal Planella', 'Federico', '1');
INSERT INTO medicos VALUES ('JMP', 'Moreno Navarro', 'Juana', '5');
INSERT INTO medicos VALUES ('OPA', 'Pons Álvarez', 'Olga', '5');
INSERT INTO medicos VALUES ('PAP', 'Armengol Prats', 'Pedro', '2');
INSERT INTO medicos VALUES ('SGM', 'Gutiérrez Mellado', 'Sebastián', '6');
INSERT INTO medicos VALUES ('SVT', 'Vázquez Torres', 'Santiago', '4');
COMMIT;
COMMIT;

-- ----------------------------
-- Records of pacientes
-- ----------------------------
INSERT INTO pacientes VALUES ('100', 'Romerales Pinto', 'José', TO_DATE('1975-03-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Azorín, 34', '912563256.', '4');
INSERT INTO pacientes VALUES ('102', 'González Sancho', 'Santiago', TO_DATE('1947-10-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Coslada, 12', '914562587.', '3');
INSERT INTO pacientes VALUES ('103', 'Rodríguez Santacana', 'Carmen', TO_DATE('1987-11-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Javier Poncela, 3', '915478555.', '2');
INSERT INTO pacientes VALUES ('110', 'Puig Monza', 'Alberto', TO_DATE('1936-07-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'División Azul, 56', '914589966.', '2');
INSERT INTO pacientes VALUES ('120', 'Pérez Sanabria', 'Sergio', TO_DATE('1950-04-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Pizarro, 45', '915584471.', '1');
INSERT INTO pacientes VALUES ('130', 'Flores López', 'Jaime', TO_DATE('1932-01-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Alcatraz, 56', '914526654.', '3');
INSERT INTO pacientes VALUES ('131', 'Morales Miguel', 'Enrique', TO_DATE('1990-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Madrid, 45', '914552203.', '3');
INSERT INTO pacientes VALUES ('140', 'Torrente Hermosilla', 'Ana', TO_DATE('1958-03-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Barcelona, 35', '914785236.', '1');
INSERT INTO pacientes VALUES ('142', 'Prats Hernández', 'Olga', TO_DATE('1958-03-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Versalles, 2', '917458963.', '4');
INSERT INTO pacientes VALUES ('200', 'Jiménez Blanco', 'Carlos', TO_DATE('1973-01-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Gran Vía, 123', '914589632.', '3');
INSERT INTO pacientes VALUES ('201', 'Tomás Caballo', 'María', TO_DATE('1955-05-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Enrique Velasco, 3', '914578559.', '3');
INSERT INTO pacientes VALUES ('207', 'Guerra Santa', 'Rogelia', TO_DATE('1990-07-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Castellana, 12', '914562258.', '3');
INSERT INTO pacientes VALUES ('220', 'Granadino Callejas', 'Iván', TO_DATE('1975-07-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Doctor Más, 46', '914522369.', '3');
INSERT INTO pacientes VALUES ('231', 'Navarrete Prat', 'Luis', TO_DATE('1940-06-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Trujillo, 33', '914512589.', '1');
INSERT INTO pacientes VALUES ('240', 'Armengol Prats', 'Mónica', TO_DATE('1985-07-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Doce de octrubre, 1', '914588963.', '3');
INSERT INTO pacientes VALUES ('300', 'Rodríguez Monzón', 'Joaquín', TO_DATE('1977-05-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Barcelona, 111', '914578521.', '1');
INSERT INTO pacientes VALUES ('302', 'Martínez Lozano', 'Loreto', TO_DATE('1951-01-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'Cipreses, 56', '914589632.', '1');
COMMIT;
COMMIT;

-- Nivel 3

-- ----------------------------
-- Records of citas
-- ----------------------------
INSERT INTO citas VALUES ('1', TO_DATE('1998-04-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SVT', '200', '101', 'A', '300.00');
INSERT INTO citas VALUES ('2', TO_DATE('1998-05-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'CSM', '103', '105', 'A', '300.00');
INSERT INTO citas VALUES ('3', TO_DATE('1998-06-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'PAP', '300', '125', 'B', '300.00');
INSERT INTO citas VALUES ('4', TO_DATE('1998-09-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SGM', '120', '204', 'B', '300.00');
INSERT INTO citas VALUES ('5', TO_DATE('1998-10-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SGM', '100', '205', 'B', '300.00');
INSERT INTO citas VALUES ('7', TO_DATE('1999-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'FHL', '240', '201', 'A', '100.00');
INSERT INTO citas VALUES ('8', TO_DATE('2000-04-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'OPA', '110', '201', 'A', '100.00');
INSERT INTO citas VALUES ('9', TO_DATE('2000-05-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'FVP', '220', '305', 'A', '300.00');
INSERT INTO citas VALUES ('11', TO_DATE('2000-05-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'OPA', '207', '306', 'A', '300.00');
INSERT INTO citas VALUES ('12', TO_DATE('2000-06-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'CSM', '220', '303', 'B', '300.00');
INSERT INTO citas VALUES ('14', TO_DATE('2000-06-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SGM', '130', '504', 'B', '300.00');
INSERT INTO citas VALUES ('15', TO_DATE('2000-07-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'ESMH', '231', '504', 'B', '300.00');
INSERT INTO citas VALUES ('16', TO_DATE('2000-07-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'FVP', '200', '405', 'B', '300.00');
INSERT INTO citas VALUES ('17', TO_DATE('2000-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'PAP', '140', '401', 'A', '300.00');
INSERT INTO citas VALUES ('18', TO_DATE('2000-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SGM', '142', '409', 'B', '300.00');
INSERT INTO citas VALUES ('19', TO_DATE('2000-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SGM', '120', '504', 'A', '300.00');
INSERT INTO citas VALUES ('20', TO_DATE('2000-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'FHL', '240', '509', 'B', '300.00');
COMMIT;
COMMIT;

