-- Nivel 1

-- ----------------------------
-- Table structure for especialidades
-- ----------------------------
CREATE TABLE especialidades (
  IDESPECIALIDAD NUMBER NOT NULL,
  DESCRIPCION NVARCHAR2(30)
)
;

-- ----------------------------
-- Table structure for ciudades
-- ----------------------------
CREATE TABLE ciudades (
  IDCIUDAD NUMBER NOT NULL,
  DESCRIPCION NVARCHAR2(30)
)
;

-- Nivel 2

-- ----------------------------
-- Table structure for medicos
-- ----------------------------
CREATE TABLE medicos (
  IDMEDICO NVARCHAR2(10) NOT NULL,
  APELLIDOS NVARCHAR2(50),
  NOMBRE NVARCHAR2(50),
  IDESPECIALIDAD NUMBER
)
;

-- ----------------------------
-- Table structure for pacientes
-- ----------------------------
CREATE TABLE pacientes (
  IDPACIENTE NUMBER NOT NULL,
  APELLIDOS NVARCHAR2(50),
  NOMBRE NVARCHAR2(50),
  FECHA_NACIMIENTO DATE,
  DIRECCION NVARCHAR2(50),
  TELEFONO NVARCHAR2(10),
  IDCIUDAD NUMBER
)
;


-- Nivel 3

-- ----------------------------
-- Table structure for citas
-- ----------------------------
CREATE TABLE citas (
  IDCITA NUMBER NOT NULL,
  FECHA DATE,
  IDMEDICO NVARCHAR2(10),
  IDPACIENTE NUMBER,
  HABITACION NUMBER,
  CAMA NVARCHAR2(1),
  PAGO NUMBER
)
;

--  Primary Key

-- ----------------------------
-- Primary Key structure for table especialidades
-- ----------------------------
ALTER TABLE especialidades ADD PRIMARY KEY (IDESPECIALIDAD);

-- ----------------------------
-- Primary Key structure for table ciudades
-- ----------------------------
ALTER TABLE ciudades ADD PRIMARY KEY (IDCIUDAD);

-- ----------------------------
-- Primary Key structure for table medicos
-- ----------------------------
ALTER TABLE medicos ADD PRIMARY KEY (IDMEDICO);

-- ----------------------------
-- Primary Key structure for table pacientes
-- ----------------------------
ALTER TABLE pacientes ADD PRIMARY KEY (IDPACIENTE);

-- ----------------------------
-- Primary Key structure for table citas
-- ----------------------------
ALTER TABLE citas ADD PRIMARY KEY (IDCITA);


-- Foreing Keys

-- ----------------------------
-- Indexes structure for table medicos
-- ----------------------------
CREATE INDEX FK_MED_ESP
  ON medicos (IDESPECIALIDAD);

-- ----------------------------
-- Foreign Keys structure for table medicos
-- ----------------------------
ALTER TABLE medicos ADD CONSTRAINT FK_MED_ESP FOREIGN KEY (IDESPECIALIDAD) REFERENCES especialidades (IDESPECIALIDAD);


-- ----------------------------
-- Indexes structure for table pacientes
-- ----------------------------
CREATE INDEX FK_PAC_CIU
  ON pacientes (IDCIUDAD);

-- ----------------------------
-- Foreign Keys structure for table pacientes
-- ----------------------------
ALTER TABLE pacientes ADD CONSTRAINT FK_PAC_CIU FOREIGN KEY (IDCIUDAD) REFERENCES ciudades (IDCIUDAD);



-- ----------------------------
-- Indexes structure for table citas
-- ----------------------------
CREATE INDEX FK_CITAS_MED
  ON citas (IDMEDICO);
CREATE INDEX FK_CITAS_PAC
  ON citas (IDPACIENTE);

-- ----------------------------
-- Foreign Keys structure for table citas
-- ----------------------------
ALTER TABLE citas ADD CONSTRAINT FK_CITAS_MED FOREIGN KEY (IDMEDICO)   REFERENCES medicos (IDMEDICO);
ALTER TABLE citas ADD CONSTRAINT FK_CITAS_PAC FOREIGN KEY (IDPACIENTE) REFERENCES pacientes (IDPACIENTE);

