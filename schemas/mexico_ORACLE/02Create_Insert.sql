CREATE TABLE ciudades (
  IdCiudad integer ,
  Abr varchar2(5) ,
  Nombre varchar2(20) ,
  Capital varchar2(20) ,
  Lada integer ,
  Tot_mun integer ,
  Hombres integer ,
  Mujeres integer ,
  Gobernador varchar2(40) ,
  Sexo number(1,0) ,
  Partido varchar2(10) ,
  Inicio date ,
  Fin date 
);

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
ALTER SESSION SET NLS_SORT = BINARY_AI;  -- Accent   Insensitive    a=á
ALTER SESSION SET NLS_COMP = LINGUISTIC; -- May, Min Insensitive    A=a

INSERT INTO ciudades VALUES(1,'Ags','AGUASCALIENTES','AGUASCALIENTES',449,11,696683,728924,'Martín Orozco Sandoval',1,'PAN','2016-12-01','2021-09-30');
INSERT INTO ciudades VALUES(2, 'BC', 'BAJA CALIFORNIA', 'MEXICALI', 686, 5, 1900589, 1868431, 'Jaime Bonilla Valdez', 1, 'MORENA', '2019-11-01', '2021-10-31');
INSERT INTO ciudades VALUES(3, 'BCS', 'BAJA CALIFORNIA SUR', 'LA PAZ', 612, 5, 405879, 392568, 'Carlos Mendoza Davis', 1, 'PAN', '2015-09-10', '2021-09-09');
INSERT INTO ciudades VALUES(4, 'Camp', 'CAMPECHE', 'CAMPECHE', 981, 11, 456939, 471424, 'Carlos Miguel Aysa González', 1, 'PRI', '2019-06-13', '2021-09-15');
INSERT INTO ciudades VALUES(5, 'Coah', 'COAHUILA', 'SALTILLO', 844, 38, 1563669, 1583102, 'Rutilio Escandón', 1, 'MORENA', '2018-12-08', '2024-12-07');
INSERT INTO ciudades VALUES(6, 'Col', 'COLIMA', 'COLIMA', 312, 10, 360622, 370769, 'Javier Corral Jurado', 1, 'PAN', '2016-10-04', '2021-09-07');
INSERT INTO ciudades VALUES(7, 'Chis', 'CHIAPAS', 'TUXTLA GUTIERREZ', 961, 118, 2705947, 2837881, 'Claudia Sheinbaum', 0, 'MORENA', '2018-12-05', '2024-12-04');
INSERT INTO ciudades VALUES(8, 'Chih', 'CHIHUAHUA', 'CHIHUAHUA', 614, 67, 1853822, 1888047, 'Miguel Ángel Riquelme Solís', 1, 'PRI', '2017-12-01', '2023-11-30');
INSERT INTO ciudades VALUES(9, 'DF', 'DISTRITO FEDERAL', '', 55, 16, 4404927, 4805017, 'José Ignacio Peralta', 1, 'PRI', '2016-02-11', '2021-10-31');
INSERT INTO ciudades VALUES(10, 'Dgo', 'DURANGO', 'DURANGO', 674, 39, 904866, 927784, 'José Rosas Aispuro', 1, 'PAN', '2016-09-15', '2022-09-14');
INSERT INTO ciudades VALUES(11, 'Gto', 'GUANAJUATO', 'GUANAJUATO', 473, 46, 2996454, 3170480, 'Diego Sinhué Rodríguez Vallejo', 1, 'PAN', '2018-09-26', '2024-09-25');
INSERT INTO ciudades VALUES(12, 'Gro', 'GUERRERO', 'CHILPANCINGO.', 747, 81, 1700612, 1840073, 'Héctor Astudillo Flores', 1, 'PRI', '2015-10-27', '2021-10-26');
INSERT INTO ciudades VALUES(13, 'Hgo', 'HIDALGO', 'PACHUCA', 771, 84, 1481379, 1601462, 'Omar Fayad', 1, 'PRI', '2016-09-05', '2022-09-04');
INSERT INTO ciudades VALUES(14, 'Jal', 'JALISCO', 'GUADALAJARA', 33, 125, 4098455, 4249696, 'Enrique Alfaro Ramírez', 1, 'MC', '2018-12-06', '2024-12-05');
INSERT INTO ciudades VALUES(15, 'Mex', 'MEXICO', 'TOLUCA', 722, 125, 8251295, 8741123, 'Alfredo del Mazo Maza', 1, 'PRI', '2017-09-15', '2023-09-14');
INSERT INTO ciudades VALUES(16, 'Mich', 'MICHOACAN', 'MORELIA', 443, 113, 2306341, 2442505, 'Silvano Aureoles Conejo', 1, 'PRD', '2015-10-01', '2021-09-30');
INSERT INTO ciudades VALUES(17, 'Mor', 'MORELOS', 'CUERNAVACA', 777, 33, 950847, 1020673, 'Cuauhtémoc Blanco', 1, 'ES', '2018-10-01', '2024-09-30');
INSERT INTO ciudades VALUES(18, 'Nay', 'NAYARIT', 'TEPIC', 311, 20, 612278, 623178, 'Antonio Echevarría García', 1, 'PAN', '2017-09-19', '2021-09-18');
INSERT INTO ciudades VALUES(19, 'NL', 'NUEVO LEON', 'MONTERREY', 81, 51, 2890950, 2893492, 'Jaime Rodríguez Calderón', 1, 'IND', '2015-10-04', '2021-10-03');
INSERT INTO ciudades VALUES(20, 'Oax', 'OAXACA', 'OAXACA', 951, 570, 1974843, 2157305, 'Alejandro Murat Hinojosa', 1, 'PRI', '2016-12-01', '2022-11-30');
INSERT INTO ciudades VALUES(21, 'Pue', 'PUEBLA', 'PUEBLA', 0, 217, 3160115, 3423163, 'Miguel Barbosa Huerta', 1, 'MORENA', '2019-08-01', '2024-12-01');
INSERT INTO ciudades VALUES(22, 'Qro', 'QUERETARO', 'QUERETARO', 0, 18, 1156820, 1211647, 'Francisco Domínguez Servién', 1, 'PAN', '2015-10-01', '2021-09-30');
INSERT INTO ciudades VALUES(23, 'QRoo', 'QUINTANA ROO', 'CHETUMAL.', 0, 8, 936779, 921206, 'Carlos Joaquín González', 1, 'PRD', '2016-09-25', '2022-09-24');
INSERT INTO ciudades VALUES(24, 'SLP', 'SAN LUIS POTOSI', 'SAN LUIS POTOSI', 444, 58, 1372451, 1449804, 'Juan Manuel Carreras', 1, 'PRI', '2015-09-26', '2021-09-25');
INSERT INTO ciudades VALUES(25, 'Sin', 'SINALOA', 'CULIACAN', 667, 18, 1494815, 1532128, 'Quirino Ordaz Coppel', 1, 'PRI', '2017-01-01', '2022-12-31');
INSERT INTO ciudades VALUES(26, 'Son', 'SONORA', 'HERMOSILLO', 662, 72, 1472197, 1472643, 'Claudia Pavlovich Arellano', 0, 'PRI', '2015-09-13', '2021-09-12');
INSERT INTO ciudades VALUES(27, 'Tab', 'TABASCO', 'VILLAHERMOSA.', 0, 17, 1173671, 1228927, 'Adán Augusto López Hernández', 1, 'MORENA', '2019-01-01', '2024-09-30');
INSERT INTO ciudades VALUES(28, 'Tamps', 'TAMAULIPAS', 'CIUDAD VICTORIA.', 0, 43, 1736140, 1791595, 'Francisco Javier García Cabeza de Vaca', 1, 'PAN', '2016-10-01', '2021-09-30');
INSERT INTO ciudades VALUES(29, 'Tlax', 'TLAXCALA', 'TLAXCALA', 246, 60, 649894, 693083, 'Marco Antonio Mena Rodríguez', 1, 'PRI', '2017-01-01', '2021-08-30');
INSERT INTO ciudades VALUES(30, 'Ver', 'VERACRUZ', 'XALAPA', 228, 212, 3871774, 4190805, 'Cuitláhuac García Jiménez', 1, 'MORENA', '2018-12-01', '2024-11-30');
INSERT INTO ciudades VALUES(31, 'Yuc', 'YUCATAN', 'MERIDA', 999, 106, 1140279, 1180619, 'Mauricio Vila Dosal', 1, 'PAN', '2018-10-01', '2024-09-30');
INSERT INTO ciudades VALUES(32, 'Zac', 'ZACATECAS', 'ZACATECAS', 492, 58, 791058, 831080, 'Alejandro Tello Cristerna', 1, 'PRI', '2016-09-12', '2021-09-11');
COMMIT;

