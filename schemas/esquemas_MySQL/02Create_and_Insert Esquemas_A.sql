
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for A_COUNTRIES
-- ----------------------------
DROP TABLE IF EXISTS A_COUNTRIES;
CREATE TABLE A_COUNTRIES  (
  COUNTRY_ID char(2) NOT NULL,
  COUNTRY_NAME varchar(40) NULL,
  REGION_ID INTEGER NULL,
  PRIMARY KEY (COUNTRY_ID),
  CONSTRAINT COUNTR_REG_FK FOREIGN KEY (REGION_ID) REFERENCES A_REGIONS (REGION_ID)
);

-- ----------------------------
-- Records of A_COUNTRIES
-- ----------------------------
BEGIN;
INSERT INTO A_COUNTRIES VALUES ('CA', 'Canada', 2), ('DE', 'Germany', 1), ('UK', 'United Kingdom', 1), ('US', 'United States of America', 2);
COMMIT;

-- ----------------------------
-- Table structure for D_CDS
-- ----------------------------
DROP TABLE IF EXISTS D_CDS;
CREATE TABLE D_CDS  (
  CD_NUMBER INTEGER NOT NULL,
  TITLE varchar(50) NOT NULL,
  PRODUCER varchar(50) NOT NULL,
  YEAR varchar(4) NOT NULL,
  PRIMARY KEY (CD_NUMBER),
  INDEX D_CDS_IDX(TITLE ASC)
);

-- ----------------------------
-- Records of D_CDS
-- ----------------------------
BEGIN;
INSERT INTO D_CDS VALUES (90, 'The Celebrants Live in Concert', 'Old Town Records', '1997'), (91, 'Party Music for All Occasions', 'The Music Man', '2000'), (92, 'Back to the Shire', 'Middle Earth Records', '2002'), (93, 'Songs from My Childhood', 'Old Town Records', '1999'), (94, 'Carpe Diem', 'R and B Inc.', '2000'), (95, 'Here Comes the Bride', 'The Music Man', '2001'), (96, 'Graduation Songbook', 'Tunes Are Us', '1998'), (98, 'Whirled Peas', 'Old Town Records', '2004');
COMMIT;

-- ----------------------------
-- Table structure for D_CLIENTS
-- ----------------------------
DROP TABLE IF EXISTS D_CLIENTS;
CREATE TABLE D_CLIENTS  (
  CLIENT_NUMBER INTEGER NOT NULL,
  FIRST_NAME varchar(25) NOT NULL,
  LAST_NAME varchar(30) NOT NULL,
  PHONE decimal(15, 0) NOT NULL,
  EMAIL varchar(50) NULL,
  PRIMARY KEY (CLIENT_NUMBER)
);

-- ----------------------------
-- Records of D_CLIENTS
-- ----------------------------
BEGIN;
INSERT INTO D_CLIENTS VALUES (5922, 'Hiram', 'Peters', 3715832249, 'hpeters@yahoo.com'), (5857, 'Serena', 'Jones', 7035335900, 'serena.jones@jones.com'), (6133, 'Lauren', 'Vigil', 4072220090, 'lbv@lbv.net');
COMMIT;

-- ----------------------------
-- Table structure for A_DEPARTMENTS
-- ----------------------------
DROP TABLE IF EXISTS A_DEPARTMENTS;
CREATE TABLE A_DEPARTMENTS  (
  DEPARTMENT_ID INTEGER NOT NULL,
  DEPARTMENT_NAME varchar(30) NOT NULL,
  MANAGER_ID INTEGER NULL,
  LOCATION_ID INTEGER NULL,
  PRIMARY KEY (DEPARTMENT_ID),
  INDEX DEPT_LOCATION_IX(LOCATION_ID ASC),
  CONSTRAINT DEPT_LOC_FK FOREIGN KEY (LOCATION_ID) REFERENCES A_LOCATIONS (LOCATION_ID),
  CONSTRAINT DEPT_MGR_FK FOREIGN KEY (MANAGER_ID) REFERENCES A_EMPLOYEES (EMPLOYEE_ID)
);

-- ----------------------------
-- Records of A_DEPARTMENTS
-- ----------------------------
BEGIN;
INSERT INTO A_DEPARTMENTS VALUES (10, 'Administration', 200, 1700), (20, 'Marketing', 201, 1800), (50, 'Shipping', 124, 1500), (60, 'IT', 103, 1400), (80, 'Sales', 149, 2500), (90, 'Executive', 100, 1700), (110, 'Accounting', 205, 1700), (190, 'Contracting', NULL, 1700);
COMMIT;

-- ----------------------------
-- Table structure for D_EVENTS
-- ----------------------------
DROP TABLE IF EXISTS D_EVENTS;
CREATE TABLE D_EVENTS  (
  ID INTEGER NOT NULL,
  NAME varchar(50) NOT NULL,
  EVENT_DATE datetime NOT NULL,
  DESCRIPTION varchar(50) NULL,
  COST decimal(8, 2) NOT NULL,
  VENUE_ID INTEGER NOT NULL,
  PACKAGE_CODE INTEGER NOT NULL,
  THEME_CODE INTEGER NOT NULL,
  CLIENT_NUMBER INTEGER NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT D_EVE_CLIENT_NUMBER_FK FOREIGN KEY (CLIENT_NUMBER) REFERENCES D_CLIENTS (CLIENT_NUMBER),
  CONSTRAINT D_EVE_PACKAGE_CODE_FK FOREIGN KEY (PACKAGE_CODE) REFERENCES D_PACKAGES (CODE),
  CONSTRAINT D_EVE_THEME_CODE_FK FOREIGN KEY (THEME_CODE) REFERENCES D_THEMES (CODE),
  CONSTRAINT D_EVE_VENUE_ID_FK FOREIGN KEY (VENUE_ID) REFERENCES D_VENUES (ID)
);

-- ----------------------------
-- Records of D_EVENTS
-- ----------------------------
BEGIN;
INSERT INTO D_EVENTS VALUES (100, 'Peters Graduation', '2004-05-14 00:00:00', 'Party for 200, red, white, blue motif', 8000, 100, 112, 200, 5922), (105, 'Vigil wedding', '2004-04-28 00:00:00', 'Black tie at Four Season hotel', 10000, 220, 200, 200, 6133);
COMMIT;

-- ----------------------------
-- Table structure for D_JOB_ASSIGNMENTS
-- ----------------------------
DROP TABLE IF EXISTS D_JOB_ASSIGNMENTS;
CREATE TABLE D_JOB_ASSIGNMENTS  (
  PARTNER_ID INTEGER NOT NULL,
  EVENT_ID INTEGER NOT NULL,
  JOB_DATE datetime NOT NULL,
  STATUS varchar(50) NULL,
  PRIMARY KEY (PARTNER_ID, EVENT_ID),
  CONSTRAINT D_JAT_EVENT_ID_FK FOREIGN KEY (EVENT_ID) REFERENCES D_EVENTS (ID),
  CONSTRAINT D_JAT_PARTNER_ID_FK FOREIGN KEY (PARTNER_ID) REFERENCES D_PARTNERS (ID)
);

-- ----------------------------
-- Records of D_JOB_ASSIGNMENTS
-- ----------------------------
BEGIN;
INSERT INTO D_JOB_ASSIGNMENTS VALUES (11, 105, '2004-02-02 00:00:00', 'Visited');
COMMIT;

-- ----------------------------
-- Table structure for D_PACKAGES
-- ----------------------------
DROP TABLE IF EXISTS D_PACKAGES;
CREATE TABLE D_PACKAGES  (
  CODE INTEGER NOT NULL,
  LOW_RANGE INTEGER NOT NULL,
  HIGH_RANGE INTEGER NOT NULL,
  PRIMARY KEY (CODE)
);

-- ----------------------------
-- Records of D_PACKAGES
-- ----------------------------
BEGIN;
INSERT INTO D_PACKAGES VALUES (79, 500, 2500), (87, 2501, 5000), (112, 5001, 10000), (200, 10001, 15000);
COMMIT;

-- ----------------------------
-- Table structure for D_PARTNERS
-- ----------------------------
DROP TABLE IF EXISTS D_PARTNERS;
CREATE TABLE D_PARTNERS  (
  ID INTEGER NOT NULL,
  FIRST_NAME varchar(25) NOT NULL,
  LAST_NAME varchar(30) NOT NULL,
  EXPERTISE varchar(25) NULL,
  SPECIALTY varchar(25) NULL,
  AUTH_EXPENSE_AMT decimal(8, 2) NULL,
  MANAGER_ID INTEGER NULL,
  PARTNER_TYPE varchar(25) NOT NULL,
  PRIMARY KEY (ID)
);

-- ----------------------------
-- Records of D_PARTNERS
-- ----------------------------
BEGIN;
INSERT INTO D_PARTNERS VALUES (11, 'Jennifer', 'cho', 'Weddings', 'All Types', NULL, 33, 'Wedding Coordinator'), (22, 'Jason', 'Tsang', NULL, 'Hip Hop', NULL, 33, 'Disk Jockey'), (33, 'Allison', 'Plumb', 'Event Planning', NULL, 300000, 33, 'Manager');
COMMIT;

-- ----------------------------
-- Table structure for D_PLAY_LIST_ITEMS
-- ----------------------------
DROP TABLE IF EXISTS D_PLAY_LIST_ITEMS;
CREATE TABLE D_PLAY_LIST_ITEMS  (
  EVENT_ID INTEGER NOT NULL,
  SONG_ID INTEGER NOT NULL,
  COMMENTS varchar(80) NULL,
  PRIMARY KEY (EVENT_ID, SONG_ID),
  CONSTRAINT D_PLM_EVENT_ID_FK FOREIGN KEY (EVENT_ID) REFERENCES D_EVENTS (ID),
  CONSTRAINT D_PLM_SONG_ID_FK FOREIGN KEY (SONG_ID) REFERENCES D_SONGS (ID)
);

-- ----------------------------
-- Records of D_PLAY_LIST_ITEMS
-- ----------------------------
BEGIN;
INSERT INTO D_PLAY_LIST_ITEMS VALUES (100, 45, 'Play late'), (100, 46, NULL), (100, 47, 'Play early'), (105, 48, 'Play after cake cutting'), (105, 49, 'Play first'), (105, 47, 'Play for the father');
COMMIT;

-- ----------------------------
-- Table structure for D_SONGS
-- ----------------------------
DROP TABLE IF EXISTS D_SONGS;
CREATE TABLE D_SONGS  (
  ID INTEGER NOT NULL,
  TITLE varchar(50) NOT NULL,
  DURATION varchar(20) NULL,
  ARTIST varchar(20) NULL,
  TYPE_CODE INTEGER NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT D_SNG_TYPE_CODE_FK FOREIGN KEY (TYPE_CODE) REFERENCES D_TYPES (CODE)
);

-- ----------------------------
-- Records of D_SONGS
-- ----------------------------
BEGIN;
INSERT INTO D_SONGS VALUES (45, 'Its Finally Over', '5 min', 'The Hobbits', 12), (46, 'Im Going to Miss My Teacher', '2 min', 'Jane Pop', 12), (47, 'Hurrah for Today', '3 min', 'The Jubilant Trio', 77), (48, 'Meet Me At the Altar', '6 min', 'Bobby West', 1), (49, 'Lets Celebrate', '8 min', 'The Celebrants', 77), (50, 'All These Years', '10 min', 'Diana Crooner', 88);
COMMIT;

-- ----------------------------
-- Table structure for D_THEMES
-- ----------------------------
DROP TABLE IF EXISTS D_THEMES;
CREATE TABLE D_THEMES  (
  CODE INTEGER NOT NULL,
  DESCRIPTION varchar(100) NOT NULL,
  PRIMARY KEY (CODE)
);

-- ----------------------------
-- Records of D_THEMES
-- ----------------------------
BEGIN;
INSERT INTO D_THEMES VALUES (200, 'Tropical'), (220, 'Carnival'), (240, 'Sixties'), (110, 'Classic'), (198, 'Mardi Gras'), (454, 'Eighties'), (340, 'Football'), (502, 'Fairy Tale');
COMMIT;

-- ----------------------------
-- Table structure for D_TRACK_LISTINGS
-- ----------------------------
DROP TABLE IF EXISTS D_TRACK_LISTINGS;
CREATE TABLE D_TRACK_LISTINGS  (
  SONG_ID INTEGER NOT NULL,
  CD_NUMBER INTEGER NOT NULL,
  TRACK decimal(2, 0) NOT NULL,
  PRIMARY KEY (SONG_ID, CD_NUMBER),
  INDEX SONG_ID_IDX(SONG_ID ASC),
  CONSTRAINT D_TLG_CD_NUMBER_FK FOREIGN KEY (CD_NUMBER) REFERENCES D_CDS (CD_NUMBER),
  CONSTRAINT D_TLG_SONG_ID_FK FOREIGN KEY (SONG_ID) REFERENCES D_SONGS (ID)
);

-- ----------------------------
-- Records of D_TRACK_LISTINGS
-- ----------------------------
BEGIN;
INSERT INTO D_TRACK_LISTINGS VALUES (45, 92, 1), (46, 93, 1), (47, 91, 2), (48, 95, 5), (49, 91, 3);
COMMIT;

-- ----------------------------
-- Table structure for D_TYPES
-- ----------------------------
DROP TABLE IF EXISTS D_TYPES;
CREATE TABLE D_TYPES  (
  CODE INTEGER NOT NULL,
  DESCRIPTION varchar(50) NOT NULL,
  PRIMARY KEY (CODE)
);

-- ----------------------------
-- Records of D_TYPES
-- ----------------------------
BEGIN;
INSERT INTO D_TYPES VALUES (1, 'Jazz'), (12, 'Pop'), (40, 'Reggae'), (88, 'Country'), (77, 'New Age');
COMMIT;

-- ----------------------------
-- Table structure for D_VENUES
-- ----------------------------
DROP TABLE IF EXISTS D_VENUES;
CREATE TABLE D_VENUES  (
  ID INTEGER NOT NULL,
  LOC_TYPE varchar(30) NOT NULL,
  ADDRESS varchar(100) NOT NULL,
  RENTAL_FEE varchar(50) NOT NULL,
  COMMENTS varchar(100) NULL,
  PRIMARY KEY (ID)
);

-- ----------------------------
-- Records of D_VENUES
-- ----------------------------
BEGIN;
INSERT INTO D_VENUES VALUES (100, 'Private Home', '52 West End Drive, Los Angeles, CA 90210', '0', 'Large kitchen, spacious lawn'), (105, 'Private Home', '123 Magnolia Road, Hudson, N.Y. 11220', '0', '3 level townhouse, speakers on all floors'), (101, 'Private Home', '4 Primrose Lane, Chevy Chase, MD 22127', '0', 'Gazebo, multi-level deck'), (95, 'School Hall', '4 Mahogany Drive, Boston, MA 10010', '75/hour', 'School closes at 10pm'), (99, 'National Park', '87 Park Avenue, San Diego, CA 28978', '400/flat fee', 'Bring generators'), (220, 'Hotel', '200 Pennsylvania Ave, Washington D.C. 09002', '300/per person', 'Classy affair, tight security, private entrance for vendors');
COMMIT;

-- ----------------------------
-- Table structure for A_EMPLOYEES
-- ----------------------------
DROP TABLE IF EXISTS A_EMPLOYEES;
CREATE TABLE A_EMPLOYEES  (
  EMPLOYEE_ID INTEGER NOT NULL,
  FIRST_NAME varchar(20) NULL,
  LAST_NAME varchar(25) NOT NULL,
  EMAIL varchar(25) NOT NULL,
  PHONE_NUMBER varchar(20) NULL,
  HIRE_DATE datetime NOT NULL,
  JOB_ID varchar(10) NOT NULL,
  SALARY decimal(8, 2) NULL,
  COMMISSION_PCT decimal(2, 2) NULL,
  MANAGER_ID INTEGER NULL,
  DEPARTMENT_ID INTEGER NULL,
  BONUS varchar(5) NULL,
  PRIMARY KEY (EMPLOYEE_ID),
  INDEX EMP_DEPARTMENT_IX(DEPARTMENT_ID ASC),
  INDEX EMP_JOB_IX(JOB_ID ASC),
  INDEX EMP_MANAGER_IX(MANAGER_ID ASC),
  INDEX EMP_NAME_IX(LAST_NAME ASC, FIRST_NAME ASC),
  CONSTRAINT EMP_DEPT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES A_DEPARTMENTS (DEPARTMENT_ID),
  CONSTRAINT EMP_JOB_FK FOREIGN KEY (JOB_ID) REFERENCES A_JOBS (JOB_ID),
  CONSTRAINT EMP_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES A_EMPLOYEES (EMPLOYEE_ID)
);

-- ----------------------------
-- Records of A_EMPLOYEES
-- ----------------------------
BEGIN;
INSERT INTO A_EMPLOYEES VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17 00:00:00', 'AD_PRES', 24000, NULL, NULL, 90, NULL), (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21 00:00:00', 'AD_VP', 17000, NULL, 100, 90, NULL), (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1993-01-13 00:00:00', 'AD_VP', 17000, NULL, 100, 90, NULL), (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-17 00:00:00', 'AD_ASST', 4400, NULL, 101, 10, NULL), (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1994-06-07 00:00:00', 'AC_MGR', 12000, NULL, 101, 110, NULL), (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1994-06-07 00:00:00', 'AC_ACCOUNT', 8300, NULL, 205, 110, NULL), (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '2000-01-29 00:00:00', 'SA_MAN', 10500, 0.2, 100, 80, '1500'), (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1996-05-11 00:00:00', 'SA_REP', 11000, 0.3, 149, 80, '1700'), (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1998-03-24 00:00:00', 'SA_REP', 8600, 0.2, 149, 80, '1250'), (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1999-05-24 00:00:00', 'SA_REP', 7000, 0.15, 149, NULL, NULL), (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1999-11-16 00:00:00', 'ST_MAN', 5800, NULL, 100, 50, NULL), (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1995-10-17 00:00:00', 'ST_CLERK', 3500, NULL, 124, 50, NULL), (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1997-01-29 00:00:00', 'ST_CLERK', 3100, NULL, 124, 50, NULL), (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1998-03-15 00:00:00', 'ST_CLERK', 2600, NULL, 124, 50, NULL), (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1998-07-09 00:00:00', 'ST_CLERK', 2500, NULL, 124, 50, NULL), (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1990-01-03 00:00:00', 'IT_PROG', 9000, NULL, 102, 60, NULL), (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1991-05-21 00:00:00', 'IT_PROG', 6000, NULL, 103, 60, NULL), (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1999-02-07 00:00:00', 'IT_PROG', 4200, NULL, 103, 60, NULL), (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1996-02-17 00:00:00', 'MK_MAN', 13000, NULL, 100, 20, NULL), (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', '1997-08-17 00:00:00', 'MK_REP', 6000, NULL, 201, 20, NULL);
COMMIT;

-- ----------------------------
-- Table structure for F_CUSTOMERS
-- ----------------------------
DROP TABLE IF EXISTS F_CUSTOMERS;
CREATE TABLE F_CUSTOMERS  (
  ID INTEGER NOT NULL,
  FIRST_NAME varchar(25) NOT NULL,
  LAST_NAME varchar(35) NOT NULL,
  ADDRESS varchar(50) NOT NULL,
  CITY varchar(30) NOT NULL,
  STATE varchar(20) NOT NULL,
  ZIP INTEGER NOT NULL,
  PHONE_NUMBER varchar(10) NOT NULL,
  PRIMARY KEY (ID)
);

-- ----------------------------
-- Records of F_CUSTOMERS
-- ----------------------------
BEGIN;
INSERT INTO F_CUSTOMERS VALUES (123, 'Cole', 'Bee', '123 Main Street', 'Orlando', 'FL', 32838, '4075558234'), (456, 'Zoe', 'Twee', '1009 Oliver Avenue', 'Boston', 'MA', 12889, '7098675309');
COMMIT;

-- ----------------------------
-- Table structure for F_FOOD_ITEMS
-- ----------------------------
DROP TABLE IF EXISTS F_FOOD_ITEMS;
CREATE TABLE F_FOOD_ITEMS  (
  FOOD_ITEM_NUMBER INTEGER NOT NULL,
  DESCRIPTION varchar(100) NOT NULL,
  PRICE decimal(8, 2) NOT NULL,
  REGULAR_CODE varchar(3) NULL,
  PROMO_CODE varchar(3) NULL,
  PRIMARY KEY (FOOD_ITEM_NUMBER),
  CONSTRAINT F_FIM_PROMO_CODE_FK FOREIGN KEY (PROMO_CODE) REFERENCES F_PROMOTIONAL_MENUS (CODE),
  CONSTRAINT F_FIM_REGULAR_CODE_FK FOREIGN KEY (REGULAR_CODE) REFERENCES F_REGULAR_MENUS (CODE)
);

-- ----------------------------
-- Records of F_FOOD_ITEMS
-- ----------------------------
BEGIN;
INSERT INTO F_FOOD_ITEMS VALUES (90, 'Fries', 1.09, '20', NULL), (93, 'Strawberry Shake', 3.59, NULL, '110');
COMMIT;

-- ----------------------------
-- Table structure for F_ORDER_LINES
-- ----------------------------
DROP TABLE IF EXISTS F_ORDER_LINES;
CREATE TABLE F_ORDER_LINES  (
  ORDER_NUMBER INTEGER NOT NULL,
  FOOD_ITEM_NUMBER INTEGER NOT NULL,
  QUANTITY INTEGER NOT NULL,
  PRIMARY KEY (ORDER_NUMBER, FOOD_ITEM_NUMBER),
  CONSTRAINT F_OLE_FOOD_ITEM_NUMBER_FK FOREIGN KEY (FOOD_ITEM_NUMBER) REFERENCES F_FOOD_ITEMS (FOOD_ITEM_NUMBER),
  CONSTRAINT F_OLE_ORDER_NUMBER_FK FOREIGN KEY (ORDER_NUMBER) REFERENCES F_ORDERS (ORDER_NUMBER)
);

-- ----------------------------
-- Records of F_ORDER_LINES
-- ----------------------------
BEGIN;
INSERT INTO F_ORDER_LINES VALUES (5678, 90, 2);
COMMIT;

-- ----------------------------
-- Table structure for F_ORDERS
-- ----------------------------
DROP TABLE IF EXISTS F_ORDERS;
CREATE TABLE F_ORDERS  (
  ORDER_NUMBER INTEGER NOT NULL,
  ORDER_DATE datetime NOT NULL,
  ORDER_TOTAL decimal(8, 2) NULL,
  CUST_ID INTEGER NOT NULL,
  STAFF_ID INTEGER NOT NULL,
  PRIMARY KEY (ORDER_NUMBER),
  CONSTRAINT F_ODR_CUST_ID_FK FOREIGN KEY (CUST_ID) REFERENCES F_CUSTOMERS (ID),
  CONSTRAINT F_ODR_STAFF_ID_FK FOREIGN KEY (STAFF_ID) REFERENCES F_STAFFS (ID)
);

-- ----------------------------
-- Records of F_ORDERS
-- ----------------------------
BEGIN;
INSERT INTO F_ORDERS VALUES (5678, '2002-12-10 00:00:00', 103.02, 123, 12);
COMMIT;

-- ----------------------------
-- Table structure for F_PROMOTIONAL_MENUS
-- ----------------------------
DROP TABLE IF EXISTS F_PROMOTIONAL_MENUS;
CREATE TABLE F_PROMOTIONAL_MENUS  (
  CODE varchar(3) NOT NULL,
  NAME varchar(30) NOT NULL,
  START_DATE datetime NOT NULL,
  END_DATE datetime NULL,
  GIVE_AWAY varchar(80) NULL,
  PRIMARY KEY (CODE)
);

-- ----------------------------
-- Records of F_PROMOTIONAL_MENUS
-- ----------------------------
BEGIN;
INSERT INTO F_PROMOTIONAL_MENUS VALUES ('100', 'Back to School', '2004-09-01 00:00:00', '2004-09-30 00:00:00', 'ballpen and highlighter'), ('110', 'Valentines Special', '2004-02-10 00:00:00', '2004-02-15 00:00:00', 'small box of chocolates');
COMMIT;

-- ----------------------------
-- Table structure for F_REGULAR_MENUS
-- ----------------------------
DROP TABLE IF EXISTS F_REGULAR_MENUS;
CREATE TABLE F_REGULAR_MENUS  (
  CODE varchar(3) NOT NULL,
  TYPE varchar(30) NOT NULL,
  HOURS_SERVED varchar(30) NOT NULL,
  PRIMARY KEY (CODE)
);

-- ----------------------------
-- Records of F_REGULAR_MENUS
-- ----------------------------
BEGIN;
INSERT INTO F_REGULAR_MENUS VALUES ('10', 'Breakfast', '6-11am'), ('20', 'Lunch/Dinner', '11-9pm');
COMMIT;

-- ----------------------------
-- Table structure for F_SHIFT_ASSIGNMENTS
-- ----------------------------
DROP TABLE IF EXISTS F_SHIFT_ASSIGNMENTS;
CREATE TABLE F_SHIFT_ASSIGNMENTS  (
  CODE INTEGER NOT NULL,
  ID INTEGER NOT NULL,
  SHIFT_ASSIGN_DATE datetime NOT NULL,
  PRIMARY KEY (CODE, ID),
  CONSTRAINT F_SAT_CODE_FK FOREIGN KEY (CODE) REFERENCES F_SHIFTS (CODE),
  CONSTRAINT F_SAT_ID_FK FOREIGN KEY (ID) REFERENCES F_STAFFS (ID)
);

-- ----------------------------
-- Records of F_SHIFT_ASSIGNMENTS
-- ----------------------------
BEGIN;
INSERT INTO F_SHIFT_ASSIGNMENTS VALUES (1, 12, '2004-05-06 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for F_SHIFTS
-- ----------------------------
DROP TABLE IF EXISTS F_SHIFTS;
CREATE TABLE F_SHIFTS  (
  CODE INTEGER NOT NULL,
  DESCRIPTION varchar(100) NOT NULL,
  PRIMARY KEY (CODE)
);

-- ----------------------------
-- Records of F_SHIFTS
-- ----------------------------
BEGIN;
INSERT INTO F_SHIFTS VALUES (1, '8am to 12pm'), (2, '6pm to 10pm');
COMMIT;

-- ----------------------------
-- Table structure for F_STAFFS
-- ----------------------------
DROP TABLE IF EXISTS F_STAFFS;
CREATE TABLE F_STAFFS  (
  ID INTEGER NOT NULL,
  FIRST_NAME varchar(25) NOT NULL,
  LAST_NAME varchar(35) NOT NULL,
  BIRTHDATE datetime NOT NULL,
  SALARY decimal(8, 2) NOT NULL,
  OVERTIME_RATE decimal(5, 2) NULL,
  TRAINING varchar(50) NULL,
  STAFF_TYPE varchar(20) NOT NULL,
  MANAGER_ID INTEGER NULL,
  MANAGER_BUDGET decimal(8, 2) NULL,
  MANAGER_TARGET decimal(8, 2) NULL,
  PRIMARY KEY (ID)
);

-- ----------------------------
-- Records of F_STAFFS
-- ----------------------------
BEGIN;
INSERT INTO F_STAFFS VALUES (12, 'Sue', 'Doe', '1980-07-01 00:00:00', 6.75, 10.25, NULL, 'Order Taker', 19, NULL, NULL), (9, 'Bob', 'Miller', '1979-03-19 00:00:00', 10, NULL, 'Grill', 'Cook', 19, NULL, NULL), (19, 'Monique', 'Tuttle', '1969-03-30 00:00:00', 60, NULL, NULL, 'Manager', NULL, 50000, 70000);
COMMIT;

-- ----------------------------
-- Table structure for A_JOB_GRADES
-- ----------------------------
DROP TABLE IF EXISTS A_JOB_GRADES;
CREATE TABLE A_JOB_GRADES  (
  GRADE_LEVEL varchar(3) NULL,
  LOWEST_SAL INTEGER NULL,
  HIGHEST_SAL INTEGER NULL
);

-- ----------------------------
-- Records of A_JOB_GRADES
-- ----------------------------
BEGIN;
INSERT INTO A_JOB_GRADES VALUES ('A', 1000, 2999), ('B', 3000, 5999), ('C', 6000, 9999), ('D', 10000, 14999), ('E', 15000, 24999), ('F', 25000, 40000);
COMMIT;

-- ----------------------------
-- Table structure for A_JOB_HISTORY
-- ----------------------------
DROP TABLE IF EXISTS A_JOB_HISTORY;
CREATE TABLE A_JOB_HISTORY  (
  EMPLOYEE_ID INTEGER NOT NULL,
  START_DATE datetime NOT NULL,
  END_DATE datetime NOT NULL,
  JOB_ID varchar(10) NOT NULL,
  DEPARTMENT_ID INTEGER NULL,
  PRIMARY KEY (EMPLOYEE_ID, START_DATE),
  INDEX JHIST_DEPARTMENT_IX(DEPARTMENT_ID ASC),
  INDEX JHIST_EMPLOYEE_IX(EMPLOYEE_ID ASC),
  INDEX JHIST_JOB_IX(JOB_ID ASC),
  CONSTRAINT JHIST_DEPT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES A_DEPARTMENTS (DEPARTMENT_ID),
  CONSTRAINT JHIST_EMP_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES A_EMPLOYEES (EMPLOYEE_ID),
  CONSTRAINT JHIST_JOB_FK FOREIGN KEY (JOB_ID) REFERENCES A_JOBS (JOB_ID)
);

-- ----------------------------
-- Records of A_JOB_HISTORY
-- ----------------------------
BEGIN;
INSERT INTO A_JOB_HISTORY VALUES (200, '1987-09-17 00:00:00', '1993-06-17 00:00:00', 'AD_ASST', 90), (101, '1993-10-28 00:00:00', '1997-03-15 00:00:00', 'AC_MGR', 110), (200, '1994-07-01 00:00:00', '1998-12-31 00:00:00', 'AC_ACCOUNT', 90), (101, '1989-09-21 00:00:00', '1993-10-27 00:00:00', 'AC_ACCOUNT', 110), (176, '1999-01-01 00:00:00', '1999-12-31 00:00:00', 'SA_MAN', 80), (176, '1998-03-24 00:00:00', '1998-12-31 00:00:00', 'SA_REP', 80), (122, '1999-01-01 00:00:00', '1999-12-31 00:00:00', 'ST_CLERK', 50), (114, '1998-03-24 00:00:00', '1999-12-31 00:00:00', 'ST_CLERK', 50), (102, '1993-01-13 00:00:00', '1998-07-24 00:00:00', 'IT_PROG', 60), (201, '1996-02-17 00:00:00', '1999-12-19 00:00:00', 'MK_REP', 20);
COMMIT;

-- ----------------------------
-- Table structure for A_JOBS
-- ----------------------------
DROP TABLE IF EXISTS A_JOBS;
CREATE TABLE A_JOBS  (
  JOB_ID varchar(10) NOT NULL,
  JOB_TITLE varchar(35) NOT NULL,
  MIN_SALARY INTEGER NULL,
  MAX_SALARY INTEGER NULL,
  PRIMARY KEY (JOB_ID)
);

-- ----------------------------
-- Records of A_JOBS
-- ----------------------------
BEGIN;
INSERT INTO A_JOBS VALUES ('AD_PRES', 'President', 20000, 40000), ('AD_VP', 'Administration Vice President', 15000, 30000), ('AD_ASST', 'Administration Assistant', 3000, 6000), ('AC_MGR', 'Accounting Manager', 8200, 16000), ('AC_ACCOUNT', 'Public Accountant', 4200, 9000), ('SA_MAN', 'Sales Manager', 10000, 20000), ('SA_REP', 'Sales Representative', 6000, 12000), ('ST_MAN', 'Stock Manager', 5500, 8500), ('ST_CLERK', 'Stock Clerk', 2000, 5000), ('IT_PROG', 'Programmer', 4000, 10000), ('MK_MAN', 'Marketing Manager', 9000, 15000), ('MK_REP', 'Marketing Representative', 4000, 9000);
COMMIT;

-- ----------------------------
-- Table structure for A_LOCATIONS
-- ----------------------------
DROP TABLE IF EXISTS A_LOCATIONS;
CREATE TABLE A_LOCATIONS  (
  LOCATION_ID INTEGER NOT NULL,
  STREET_ADDRESS varchar(40) NULL,
  POSTAL_CODE varchar(12) NULL,
  CITY varchar(30) NOT NULL,
  STATE_PROVINCE varchar(25) NULL,
  COUNTRY_ID char(2) NULL,
  PRIMARY KEY (LOCATION_ID),
  INDEX LOC_CITY_IX(CITY ASC),
  INDEX LOC_COUNTRY_IX(COUNTRY_ID ASC),
  INDEX LOC_STATE_PROVINCE_IX(STATE_PROVINCE ASC),
  CONSTRAINT LOC_C_ID_FK FOREIGN KEY (COUNTRY_ID) REFERENCES A_COUNTRIES (COUNTRY_ID)
);

-- ----------------------------
-- Records of A_LOCATIONS
-- ----------------------------
BEGIN;
INSERT INTO A_LOCATIONS VALUES (1800, '460 Bloor St. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA'), (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'), (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'), (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'), (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
COMMIT;

-- ----------------------------
-- Table structure for A_REGIONS
-- ----------------------------
DROP TABLE IF EXISTS A_REGIONS;
CREATE TABLE A_REGIONS  (
  REGION_ID INTEGER NOT NULL,
  REGION_NAME varchar(25) NULL,
  PRIMARY KEY (REGION_ID)
);

-- ----------------------------
-- Records of A_REGIONS
-- ----------------------------
BEGIN;
INSERT INTO A_REGIONS VALUES (1, 'Europe'), (2, 'Americas'), (3, 'Asia'), (4, 'Middle East and Africa');
COMMIT;

-- ----------------------------
-- Table structure for WF_COUNTRIES
-- ----------------------------
DROP TABLE IF EXISTS WF_COUNTRIES;
CREATE TABLE WF_COUNTRIES  (
  COUNTRY_ID INTEGER NOT NULL,
  REGION_ID INTEGER NOT NULL,
  COUNTRY_NAME varchar(70) NOT NULL,
  COUNTRY_TRANSLATED_NAME varchar(40) NULL,
  LOCATION varchar(90) NULL,
  CAPITOL varchar(50) NULL,
  AREA decimal(15, 0) NULL,
  COASTLINE INTEGER NULL,
  LOWEST_ELEVATION INTEGER NULL,
  LOWEST_ELEV_NAME varchar(70) NULL,
  HIGHEST_ELEVATION INTEGER NULL,
  HIGHEST_ELEV_NAME varchar(50) NULL,
  DATE_OF_INDEPENDENCE varchar(30) NULL,
  NATIONAL_HOLIDAY_NAME varchar(200) NULL,
  NATIONAL_HOLIDAY_DATE varchar(30) NULL,
  POPULATION decimal(12, 0) NULL,
  POPULATION_GROWTH_RATE varchar(10) NULL,
  LIFE_EXPECT_AT_BIRTH decimal(6, 2) NULL,
  MEDIAN_AGE decimal(6, 2) NULL,
  AIRPORTS INTEGER NULL,
  CLIMATE text NULL,
  FIPS_ID char(2) NULL,
  INTERNET_EXTENSION varchar(3) NULL,
  FLAG longblob NULL,
  CURRENCY_CODE varchar(7) NOT NULL,
  PRIMARY KEY (COUNTRY_ID),
  INDEX WF_CTRY_CURR_IDX(CURRENCY_CODE ASC),
  INDEX WF_CTRY_REG_IDX(REGION_ID ASC),
  CONSTRAINT WF_CURR_ID_FK2 FOREIGN KEY (CURRENCY_CODE) REFERENCES WF_CURRENCIES (CURRENCY_CODE),
  CONSTRAINT WF_REGION_ID_FK1 FOREIGN KEY (REGION_ID) REFERENCES WF_WORLD_REGIONS (REGION_ID)
);

-- ----------------------------
-- Records of WF_COUNTRIES
-- ----------------------------
BEGIN;
INSERT INTO WF_COUNTRIES VALUES (206, 9, 'Pitcairn, Henderson, Ducie, and Oeno Islands', 'Pitcairn Islands', 'Oceania', 'Adamstown', 47, 51, 0, 'Pacific Ocean', 347, 'Pawala Valley Ridge', NULL, 'Birthday of Queen ELIZABETH II', 'second Saturday in June', 45, '-.01', NULL, NULL, 0, 'tropical; hot and humid; modified by southeast trade winds; rainy season (November to March)', 'PC', '.pn', NULL, 'NZD'), (64, 9, 'New Zealand', NULL, 'Oceania', 'Wellington', 268680, 15134, 0, 'Pacific Ocean', 3754, 'Aoraki-Mount Cook', '26-Sep-1907', 'Waitangi Day', '6-Feb', 4076140, '.99', 78.81, 33.9, 117, 'temperate with sharp regional contrasts', 'NZ', '.nz', NULL, 'NZD'), (51, 5, 'Republic of Peru', 'Peru', 'Western South America', 'Lima', 1285220, 2414, 0, 'Pacific Ocean', 6768, 'Nevado Huascaran', '28-Jul-1821', 'Independence Day', '28-Jul', 28302603, '1.32', 69.84, 25.3, 246, 'varies from tropical in east to dry desert in west; temperate to frigid in Andes', 'PE', '.pe', NULL, 'PEN'), (675, 9, 'Independent State of Papua New Guinea', 'Papua New Guinea', 'Oceania', 'Port Moresby', 462840, 5152, 0, 'Pacific Ocean', 4509, 'Mount Wilhelm', '16-Sep-1975', 'Independence Day', '16-Sep', 5670544, '2.21', 65.28, 21.2, 572, 'tropical; northwest monsoon (December to March), southeast monsoon (May to October); slight seasonal temperature variation', 'PP', '.pg', NULL, 'PGK'), (595, 5, 'Republic of Paraguay', 'Paraguay', 'Central South America', 'Asuncion', 406750, 0, 46, 'junction of Rio Paraguay and Rio Parana', 842, 'Cerro Pero', '14-May-1811', 'Independence Day', '15-May', 6506464, '2.45', 75.1, 21.3, 880, 'subtropical to temperate; substantial rainfall in the eastern portions, becoming semiarid in the far west', 'PA', '.py', NULL, 'PYG'), (966, 145, 'Kingdom of Saudi Arabia', 'Saudi Arabia', 'Middle East', 'Riyadh', 1960582, 2640, 0, 'Persian Gulf', 3133, 'Jabal Sawda', '23-Sep-1932', 'Unification of the Kingdom', '23-Sep', 27019731, '2.18', 75.67, 21.4, 202, 'harsh, dry desert with great temperature extremes', 'SA', '.sa', NULL, 'SAR'), (677, 9, 'Solomon Islands', NULL, 'Oceania', 'Honiara', 28450, 5313, 0, 'Pacific Ocean', 2447, 'Mount Makarakomburu', '7-Jul-1978', 'Independence Day', '7-Jul', 552438, '2.61', 72.91, 18.9, 34, 'tropical monsoon; few extremes of temperature and weather', 'BP', '.sb', NULL, 'SBD'), (248, 9, 'Republic of Seychelles', 'Seychelles', 'Oceania', 'Victoria', 455, 491, 0, 'Indian Ocean', 905, 'Morne Seychellois', '29-Jun-1976', 'Constitution Day', '18-Jun', 81541, '.43', 72.08, 28.1, 15, 'tropical marine; humid; cooler season during southeast monsoon (late May to September); warmer season during northwest monsoon (March to May)', 'SE', '.sc', NULL, 'SCR'), (290, 11, 'Saint Helena', NULL, 'islands in the South Atlantic Ocean', 'Jamestown', 413, 60, 0, 'Atlantic Ocean', 818, 'Mount Actaeon', NULL, 'Birthday of Queen ELIZABETH II', 'second Saturday in June', 7502, '.56', 77.93, 36, 1, 'tropical marine; mild, tempered by trade winds', 'SH', '.sh', NULL, 'SHP'), (3, 143, 'Republic of Kazakhstan', 'Kazakhstan', 'Central Asia', 'Astana', 2717300, 0, -132, 'Vpadina Kaundy', 6995, 'Khan Tangiri Shyngy', '16-Dec-1991', 'Independence Day', '16-Dec', 15233244, '.33', 66.89, 28.8, 160, 'continental, cold winters and hot summers, arid and semiarid', 'KZ', '.kz', NULL, 'KZT'), (94, 34, 'Democratic Socialist Republic of Sri Lanka', 'Sri Lanka', 'Southern Asia', 'Colombo', 65610, 1340, 0, 'Indian Ocean', 2524, 'Pidurutalagala', '4-Feb-1948', 'Independence Day', '4-Feb', 20222240, '.78', 73.41, 29.8, 16, 'tropical monsoon; northeast monsoon (December to March); southwest monsoon (June to October)', 'CE', '.lk', NULL, 'LKR'), (995, 145, 'Georgia', NULL, 'Southwestern Asia', 'Tbilisi', 69700, 310, 0, 'Black Sea', 5201, 'Mt a Shkhara', '9-Apr-1991', 'Independence Day', '9-Apr', 4661473, '-.34', 76.09, 37.7, 25, 'warm and pleasant; Mediterranean-like on Black Sea coast', 'GG', '.ge', NULL, 'GEL'), (266, 18, 'Kingdom of Lesotho', 'Lesotho', 'Southern Africa', 'Maseru', 30355, 0, 1400, 'junction of the Orange and Makhaleng Rivers', 3482, 'Thabana Ntlenyana', '4-Oct-1966', 'Independence Day', '4-Oct', 2022331, '-.46', 34.4, 20.3, 28, 'temperate; cool to cold, dry winters; hot, wet summers', 'LT', '.ls', NULL, 'LSL'), (283, 15, 'Western Sahara', NULL, 'Northern Africa', NULL, 266000, 1110, -55, 'Sebjet Tah', 463, 'unnamed location', NULL, NULL, NULL, 273008, NULL, NULL, NULL, 11, 'hot, dry desert; rain is rare; cold offshore air currents produce fog and heavy dew', 'WI', '.eh', NULL, 'MAD'), (373, 151, 'Republic of Moldova', 'Moldova', 'Eastern Europe', 'Chisinau', 33843, 0, 2, 'Dniester River', 430, 'Dealul Balanesti', '27-Aug-1991', 'Independence Day', '27-Aug', 4466706, '.28', 65.65, 32.3, 15, 'moderate winters, warm summers', 'MD', '.md', NULL, 'MDL'), (389, 39, 'Republic of Macedonia', 'Macedonia', 'Southeastern Europe', 'Skopje', 25333, 0, 50, 'Vardar River', 2764, 'Golem Korab', '8-Sep-1991', 'Uprising Day', '2-Aug', 2050554, '.26', 73.97, 34.1, 17, 'warm, dry summers and autumns; relatively cold winters with heavy snowfall', 'MK', '.mk', NULL, 'MKD'), (2001, 35, 'Union of Burma', 'Burma', 'Southeastern Asia', 'Rangoon', 678500, 1930, 0, 'Andaman Sea', 5881, 'Hkakabo Razi', '4-Jan-1948', 'Independence Day', '4-Jan', 47382633, '.81', 60.97, 27, 84, 'tropical monsoon; cloudy, rainy, hot, humid summers (southwest monsoon, June to September; less cloudy, scant rainfall, mild temperatures, lower humidity during winter (northeast monsoon, December to April)', NULL, '.mm', NULL, 'MMK'), (976, 30, 'Mongolia', NULL, 'Northern Asia', 'Ulaanbaatar', 1564116, 0, 518, 'Hoh Nuur', 4374, 'Nayramadlin Orgil', '11-Jul-1921', 'Independence Day', '11-Jul', 2832224, '1.46', 64.89, 24.6, 48, 'desert; continental (large daily and seasonal temperature ranges)', 'MG', '.mn', NULL, 'MNT'), (853, 30, 'Macau Special Administrative Region', 'Macau', 'Eastern Asia', NULL, 28, 41, 0, 'South China Sea', 172, 'Coloane Alto', NULL, 'National Day', '1-Oct', 453125, '.86', 82.19, 36.1, 1, 'subtropical; marine with cool winters, warm summers', 'MC', '.mo', NULL, 'MOP'), (356, 39, 'Republic of Malta', 'Malta', 'Southern Europe', 'Valletta', 316, 197, 0, 'Mediterranean Sea', 253, 'Ta Dmejrek', '21-Sep-1964', 'Independence Day', '21-Sep', 400214, '.42', 79.01, 38.7, 1, 'Mediterranean; mild, rainy winters; hot, dry summers', 'MT', '.mt', NULL, 'MTL'), (265, 18, 'Republic of Malawi', 'Malawi', 'Southern Africa', 'Lilongwe', 118480, 0, 37, 'junction of the Shire River and international boundary with Mozambique', 3002, 'Sapitwa', '6-Jul-1964', 'Independence Day', '6-Jul', 13013926, '2.38', 41.7, 16.5, 42, 'sub-tropical; rainy season (November to May); dry season (May to November)', 'MI', '.mw', NULL, 'MWK'), (52, 13, 'United Mexican States', 'Mexico', 'Middle America', 'Mexico', 1972550, 9330, -10, 'Laguna Salada', 5700, 'Volcan Pico de Orizaba', '16-Sep-1810', 'Independence Day', '16-Sep', 107449525, '1.16', 75.41, 25.3, 1832, 'varies from tropical to desert', 'MX', '.mx', NULL, 'MXN'), (60, 35, 'Malaysia', NULL, 'Southeastern Asia', 'Kuala Lumpur', 329750, 4675, 0, 'Indian Ocean', 4100, 'Gunung Kinabalu', '31-Aug-1957', 'Independence Day', '31-Aug', 24385858, '1.78', 72.5, 24.1, 117, 'tropical; annual southwest (April to October) and northeast (October to February) monsoons', 'MY', '.my', NULL, 'MYR'), (961, 145, 'Lebanese Republic', 'Lebanon', 'Middle East', 'Beirut', 10400, 225, 0, 'Mediterranean Sea', 3088, 'Qurnat as Sawda', '22-Nov-1943', 'Independence Day', '22-Nov', 3874050, '1.23', 72.88, 27.8, 7, 'Mediterranean; mild to cool, wet winters with hot, dry summers; Lebanon mountains experience heavy winter snows', 'LE', '.lb', NULL, 'LBP'), (258, 18, 'Republic of Mozambique', 'Mozambique', 'Southeastern Africa', 'Maputo', 801590, 2470, 0, 'Indian Ocean', 2436, 'Monte Binga', '25-Jun-1975', 'Independence Day', '25-Jun', 19686505, '1.38', 39.82, 18.3, 158, 'tropical to subtropical', 'MZ', '.mz', NULL, 'MZM'), (681, 9, 'Territory of the Wallis and Futuna Islands', 'Wallis and Futuna', 'Oceania', 'Mata-Utu', 274, 129, 0, 'Pacific Ocean', 765, 'Mont Singavi', NULL, 'Bastille Day', '14-Jul', 16025, NULL, NULL, NULL, 2, 'tropical; hot, rainy season (November to April); cool, dry season (May to October); rains 2,500-3,000 mm per year (80% humidity); average temperature 26.6 degrees C', 'WF', '.wf', NULL, 'XPF'), (689, 9, 'Overseas Lands of French Polynesia', 'French Polynesia', 'Oceania', 'Papeete', 4167, 2525, 0, 'Pacific Ocean', 2241, 'Mont Orohena', NULL, 'Bastille Day', '14-Jul', 274578, '1.48', 76.1, 27.9, 50, 'tropical, but moderate', 'FP', '.pf', NULL, 'XPF'), (27, 18, 'Republic of South Africa', 'South Africa', 'Southern Africa', 'Pretoria', 1219912, 2798, 0, 'Atlantic Ocean', 3408, 'Njesuthi', '31-May-1910', 'Freedom Day', '27-Apr', 44187637, '-.4', 42.73, 24.1, 728, 'mostly semiarid; subtropical along east coast; sunny days, cool nights', 'SF', '.za', NULL, 'ZAR'), (260, 18, 'Republic of Zambia', 'Zambia', 'Southern Africa', 'Lusaka', 752614, 0, 329, 'Zambezi river', 2301, 'unnamed location in Mafinga Hills', '24-Oct-1964', 'Independence Day', '24-Oct', 11502010, '2.11', 40.03, 16.5, 109, 'tropical; modified by altitude; rainy season (October to April)', 'ZA', '.zm', NULL, 'ZMK'), (263, 18, 'Republic of Zimbabwe', 'Zimbabwe', 'Southern Africa', 'Harare', 390580, 0, 162, 'junction of the Runde and Save rivers', 2592, 'Inyangani', '18-Apr-1980', 'Independence Day', '18-Apr', 12236805, '.62', 39.29, 19.9, 404, 'tropical; moderated by altitude; rainy season (November to March)', 'ZI', '.zw', NULL, 'ZWD'), (505, 13, 'Republic of Nicaragua', 'Nicaragua', 'Central America', 'Managua', 129494, 910, 0, 'Pacific Ocean', 2438, 'Mogoton', '15-Sep-1821', 'Independence Day', '15-Sep', 5570129, '1.89', 70.63, 20.9, 176, 'tropical in lowlands, cooler in highlands', 'NU', '.ni', NULL, 'NIO'), (977, 34, 'Kingdom of Nepal', 'Nepal', 'Southern Asia', 'Kathmandu', 147181, 0, 70, 'Kanchan Kalan', 8850, 'Mount Everest', '2-Nov-1904', 'Birthday of King GYANENDRA', '7-Jul', 28287147, '2.17', 60.18, 20.3, 48, 'varies from cool summers and severe winters in north to subtropical summers and mild winters in south', 'NP', '.np', NULL, 'NPR'), (690, 9, 'Tokelau', NULL, 'Oceania', NULL, 10, 101, 0, 'Pacific Ocean', 5, 'unnamed location', NULL, 'Waitangi Day', '6-Feb', 1392, '-.01', NULL, NULL, 0, 'tropical; moderated by trade winds (April to November)', 'TL', '.tk', NULL, 'NZD'), (1, 21, 'United States of America', 'United States', 'North America', 'Washington, DC', 9631420, 19924, -86, 'Death Valley', 6194, 'Mount McKinley', '4-Jul-1776', 'Independence Day', '4-Jul', 298444215, '.91', 77.85, 36.5, 14893, 'mostly temperate, but tropical in Hawaii and Florida, arctic in Alaska, semiarid in the great plains west of the Mississippi River, and arid in the Great Basin of the southwest; low winter temperatures in the northwest are ameliorated occasionally in January and February by warm chinook winds from the eastern slopes of the Rocky Mountains', 'US', '.us', NULL, 'USD'), (852, 30, 'Hong Kong Special Administrative Region', 'Hong Kong', 'Eastern Asia', NULL, 1092, 733, 0, 'South China Sea', 958, 'Tai Mo Shan', NULL, 'National Day', '1-Oct', 6940432, '.59', 81.59, 40.7, 3, 'subtropical monsoon; cool and humid in winter, hot and rainy from spring through summer, warm and sunny in fall', 'HK', '.hk', NULL, 'HKD'), (15, 18, 'Europa Island', NULL, 'Southern Africa', NULL, 28, 22, 0, 'Indian Ocean', 24, 'unnamed location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'tropical', 'EU', NULL, NULL, 'NONE'), (92, 34, 'Islamic Republic of Pakistan', 'Pakistan', 'Southern Asia', 'Islamabad', 803940, 1046, 0, 'Indian Ocean', 8611, 'K2', '14-Aug-1947', 'Republic Day', '23-Mar', 165803560, '2.09', 63.39, 19.8, 134, 'mostly hot, dry desert; temperate in northwest; arctic in north', 'PK', '.pk', NULL, 'PKR'), (20, 15, 'Arab Republic of Egypt', 'Egypt', 'Northern Africa', 'Cairo', 1001450, 2450, -133, 'Qattara Depression', 2629, 'Mount Catherine', '28-Feb-1922', 'Revolution Day', '23-Jul', 78887007, '1.75', 71.29, 24, 87, 'desert; hot, dry summers with moderate winters', 'EG', '.eg', NULL, 'EGP'), (385, 39, 'Republic of Croatia', 'Croatia', 'Southeastern Europe', 'Zagreb', 56542, 5835, 0, 'Adriatic Sea', 1830, 'Dinara', '25-Jun-1991', 'Independence Day', '8-Oct', 4494749, '-.03', 74.68, 40.3, 68, 'Mediterranean and continental; continental climate predominant with hot summers and cold winters; mild winters, dry summers along coast', 'HR', '.hr', NULL, 'HRK'), (509, 29, 'Republic of Haiti', 'Haiti', 'Caribbean', 'Port-au-Prince', 27750, 1771, 0, 'Caribbean Sea', 2680, 'Chaine de la Selle', '1-Jan-1804', 'Independence Day', '1-Jan', 8308504, '2.3', 53.23, 18.2, 12, 'tropical; semiarid where mountains in east cut off trade winds', 'HA', '.ht', NULL, 'HTG'), (91, 34, 'Republic of India', 'India', 'Southern Asia', 'New Delhi', 3287590, 7000, 0, 'Indian Ocean', 8598, 'Kanchenjunga', '15-Aug-1947', 'Republic Day', '26-Jan', 1095351995, '1.38', 64.71, 24.9, 334, 'varies from tropical monsoon in south to temperate in north', 'IN', '.in', NULL, 'INR'), (98, 34, 'Islamic Republic of Iran', 'Iran', 'Middle East', 'Tehran', 2, 2440, -28, 'Caspian Sea', 5671, 'Kuh-e Damavand', '1-Apr-1979', 'Republic Day', '1-Apr', 68688433, '1.1', 70.26, 24.8, 310, 'mostly arid or semiarid, subtropical along Caspian coast', 'IR', '.ir', NULL, 'IRR'), (1876, 29, 'Jamaica', NULL, 'Caribbean', 'Kingston', 10991, 1022, 0, 'Caribbean Sea', 2256, 'Blue Mountain Peak', '6-Aug-1962', 'Independence Day', '6-Aug', 2758124, '.8', 73.24, 23, 35, 'tropical; hot, humid; temperate interior', 'JM', '.jm', NULL, 'JMD'), (254, 14, 'Republic of Kenya', 'Kenya', 'Eastern Africa', 'Nairobi', 582650, 536, 0, 'Indian Ocean', 5199, 'Mount Kenya', '12-Dec-1963', 'Independence Day', '12-Dec', 34707817, '2.57', 48.93, 18.2, 224, 'varies from tropical along coast to arid in interior', 'KE', '.ke', NULL, 'KES'), (855, 35, 'Kingdom of Cambodia', 'Cambodia', 'Southeastern Asia', 'Phnom Penh', 181040, 443, 0, 'Gulf of Thailand', 1810, 'Phnum Aoral', '9-Nov-1953', 'Independence Day', '9-Nov', 13881427, '1.78', 59.29, 20.6, 20, 'tropical; rainy, monsoon season (May to November); dry season (December to April); little seasonal temperature variation', 'CB', '.kh', NULL, 'KHR'), (269, 18, 'Union of the Comoros', 'Comoros', 'Southern Africa', 'Moroni', 2170, 340, 0, 'Indian Ocean', 2360, 'Le Kartala', '6-Jul-1975', 'Independence Day', '6-Jul', 690948, '2.87', 62.33, 18.6, 4, 'tropical marine; rainy season (November to May)', 'CN', '.km', NULL, 'KMF'), (82, 30, 'Republic of Korea', 'South Korea', 'Eastern Asia', 'Seoul', 98480, 2413, 0, 'Sea of Japan', 1950, 'Halla-san', '15-Aug-1945', 'Liberation Day', '15-Aug', 48846823, '.42', 77.04, 35.2, 108, 'temperate, with rainfall heavier in summer than winter', 'KS', '.kr', NULL, 'KRW'), (1345, 29, 'Cayman Islands', NULL, 'Caribbean', 'George Town', 262, 160, 0, 'Caribbean Sea', 43, 'The Bluff', NULL, 'Constitution Day', 'first Monday in July', 45436, '2.56', 80.07, 37.2, 3, 'tropical marine; warm, rainy summers (May to October) and cool, relatively dry winters (November to April)', 'CJ', '.ky', NULL, 'KYD'), (850, 30, 'Democratic Peoples Republic of Korea', 'North Korea', 'Eastern Asia', 'Pyongyang', 120540, 2495, 0, 'Sea of Japan', 2744, 'Paektu-san', '15-Aug-1945', 'Founding of the Democratic Peoples Republic of Korea', '9-Sep', 23113019, '.84', 71.65, 32, 79, 'temperate with rainfall concentrated in summer', 'KN', '.kp', NULL, 'KPW'), (964, 145, 'Republic of Iraq', 'Iraq', 'Middle East', 'Baghdad', 437072, 58, 0, 'Persian Gulf', 3611, 'unnamed peak', '28-Jun-2004', NULL, NULL, 26783383, '2.66', 69.01, 19.7, 111, 'mostly desert; mild to cool winters with dry, hot, cloudless summers; northern mountainous regions along Iranian and Turkish borders experience cold winters with occasionally heavy snows that melt in early spring, sometimes causing extensive flooding in central and southern Iraq', 'IZ', '.iq', NULL, 'NID'), (508, 21, 'Territorial Collectivity of Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Northern North America', 'Saint-Pierre', 242, 120, 0, 'Atlantic Ocean', 240, 'Morne de la Grande Montagne', NULL, 'Bastille Day', '14-Jul', 7026, '.17', 78.61, 34.1, 2, 'cold and wet, with much mist and fog; spring and autumn are windy', 'SB', '.pm', NULL, 'EUR'), (262, 18, 'Department of Reunion', 'Reunion', 'Southern Africa', 'Saint-Denis', 2517, 207, 0, 'Indian Ocean', 3069, 'Piton des Neiges', NULL, 'Bastille Day', '14-Jul', 787584, '1.34', 74.18, 26.9, 2, 'tropical, but temperature moderates with elevation; cool and dry (May to November), hot and rainy (November to April)', 'RE', '.re', NULL, 'EUR'), (590, 29, 'Department of Guadeloupe', 'Guadeloupe', 'Caribbean', 'Basse-Terre', 1780, 306, 0, 'Caribbean Sea', 1484, 'Soufriere', NULL, 'Bastille Day', '14-Jul', 452776, '.88', 78.06, 32.2, 9, 'subtropical tempered by trade winds; moderately high humidity', 'GP', '.gp', NULL, 'EUR'), (376, 39, 'Principality of Andorra', 'Andorra', 'Southwestern Europe', 'Andorra la Vella', 468, 0, 840, 'Riu Runer', 2946, 'Coma Pedrosa', '1-Jul-1903', 'Our Lady of Meritxell Day', '8-Sep', 71201, '.89', 83.51, 40.9, 0, 'temperate; snowy, cold winters and warm, dry summers', 'AN', '.ad', NULL, 'EUR'), (351, 39, 'Portuguese Republic', 'Portugal', 'Southwestern Europe', 'Lisbon', 92391, 1793, 0, 'Atlantic Ocean', 2351, 'Ponta do Pico', '5-Oct-1910', 'Portugal Day', '10-Jun', 10605870, '.36', 77.7, 38.5, 66, 'maritime temperate; cool and rainy in north, warmer and drier in south', 'PO', '.pt', NULL, 'EUR'), (381, 39, 'Republic of Montenegro', 'Montenegro', 'Southeastern Europe', 'Cetinje', 14026, 294, 0, 'Adriatic Sea', 2522, 'Bobotov Kuk', '3-Jun-2006', 'National Day', '13-Jul', 630548, '3.5', NULL, NULL, 5, 'Mediterranean climate, hot dry summers and autumns and relatively cold winters with heavy snowfalls inland', 'MJ', NULL, NULL, 'EUR'), (270, 18, 'Territorial Collectivity of Mayotte', 'Mayotte', 'Southern Africa', 'Mamoutzou', 374, 185, 0, 'Indian Ocean', 660, 'Benara', NULL, 'Bastille Day', '14-Jul', 201234, '3.77', 61.76, 17, 1, 'tropical; marine; hot, humid, rainy season during northeastern monsoon (November to May); dry season is cooler (May to November)', 'MF', '.yt', NULL, 'EUR'), (596, 29, 'Department of Martinique', 'Martinique', 'Caribbean', 'Fort-de-France', 1100, 350, 0, 'Caribbean Sea', 1397, 'Montagne Pelee', NULL, 'Bastille Day', '14-Jul', 436131, '.72', 79.18, 34.1, 2, 'tropical; moderated by trade winds; rainy season (June to October); vulnerable to devastating cyclones (hurricanes) every eight years on average; average temperature 17.3 degrees C; humid', 'MB', '.mq', NULL, 'EUR'), (679, 9, 'Republic of the Fiji Islands', 'Fiji', 'Oceania', 'Suva', 18270, 1129, 0, 'Pacific Ocean', 1324, 'Tomanivi', '10-Oct-1970', 'Independence Day', 'second Monday of October', 905949, '1.4', 69.82, 24.6, 28, 'tropical marine; only slight seasonal temperature variation', 'FJ', '.fj', NULL, 'FJD'), (213, 15, 'Peoples Democratic Republic of Algeria', 'Algeria', 'Northern Africa', 'Algiers', 2381740, 998, -40, 'Chott Melrhir', 3003, 'Tahat', '5-Jul-1962', 'Revolution Day', '1-Nov', 32930091, '1.22', 73.26, 24.9, 137, 'arid to semiarid', 'AG', '.dz', NULL, 'DZD'), (245, 11, 'Republic of Guinea-Bissau', 'Guinea-Bissau', 'Western Africa', 'Bissau', 36120, 350, 0, 'Atlantic Ocean', 300, 'unnamed location', '24-Sep-1973', 'Independence Day', '24-Sep', 1442029, '2.07', 46.87, 19, 28, 'tropical; generally hot and humid; monsoonal-type rainy season (June to November) with southwesterly winds; dry season (December to May) with northeasterly harmattan winds', 'PU', '.gw', NULL, 'XOF'), (676, 9, 'Kingdom of Tonga', 'Tonga', 'Oceania', 'Nuku alofa', 748, 419, 0, 'Pacific Ocean', 1033, 'unnamed location on Kao Island', '4-Jun-1970', 'Emancipation Day', '4-Jun', 114689, '2.01', 69.82, 20.7, 6, 'tropical; modified by trade winds; warm season (December to May), cool season (May to December)', 'TN', '.to', NULL, 'TOP'), (240, 11, 'Republic of Equatorial Guinea', 'Equatorial Guinea', 'Western Africa', 'Malabo', 28051, 296, 0, 'Atlantic Ocean', 3008, 'Pico Basile', '12-Oct-1968', 'Independence Day', '12-Oct', 540109, '2.05', 49.54, 18.8, 4, 'tropical; always hot, humid', 'EK', '.gq', NULL, 'XAF'), (1784, 29, 'Saint Vincent and the Grenadines', NULL, 'Caribbean', 'Kingstown', 389, 84, 0, 'Caribbean Sea', 1234, 'La Soufriere', '27-Oct-1979', 'Independence Day', '27-Oct', 117848, '.26', 73.85, 26.9, 6, 'tropical; little seasonal temperature variation; rainy season (May to November)', 'VC', '.vc', NULL, 'XCD'), (1869, 29, 'Federation of Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Caribbean', 'Basseterre', 261, 135, 0, 'Caribbean Sea', 1156, 'Mount Liamuiga', '19-Sep-1983', 'Independence Day', '19-Sep', 39129, '.5', 72.4, 27.8, 2, 'tropical, tempered by constant sea breezes; little seasonal temperature variation; rainy season (May to November)', 'SC', '.kn', NULL, 'XCD'), (236, 17, 'Central African Republic', NULL, 'Central Africa', 'Bangui', 622984, 0, 335, 'Oubangui River', 1420, 'Mont Ngaoui', '13-Aug-1960', 'Republic Day', '1-Dec', 4303356, '1.53', 43.54, 18.4, 50, 'tropical; hot, dry winters; mild to hot, wet summers', 'CT', '.cf', NULL, 'XAF'), (1473, 29, 'Grenada', NULL, 'Caribbean', 'Saint Georges', 344, 121, 0, 'Caribbean Sea', 840, 'Mount Saint Catherine', '7-Feb-1974', 'Independence Day', '7-Feb', 89703, '.26', 64.87, 21.7, 3, 'tropical; tempered by northeast trade winds', 'GJ', '.gd', NULL, 'XCD'), (1767, 29, 'Commonwealth of Dominica', 'Dominica', 'Caribbean', 'Roseau', 754, 148, 0, 'Caribbean Sea', 1447, 'Morne Diablatins', '3-Nov-1978', 'Independence Day', '3-Nov', 68910, '-.08', 74.87, 30.1, 2, 'tropical; moderated by northeast trade winds; heavy rainfall', 'DO', '.dm', NULL, 'XCD'), (1264, 29, 'Anguilla', NULL, 'Caribbean', 'The Valley', 102, 61, 0, 'Caribbean Sea', 65, 'Crocus Hill', NULL, 'Anguilla Day', '30-May', 13477, '1.57', 77.28, 31.2, 3, 'tropical; moderated by northeast trade winds', 'AV', '.ai', NULL, 'XCD'), (1268, 29, 'Antigua and Barbuda', NULL, 'Caribbean', 'Saint Johns', 443, 153, 0, 'Caribbean Sea', 402, 'Boggy Peak', '1-Nov-1981', 'Independence Day (National Day)', '1-Nov', 69108, '.55', 72.16, 30, 3, 'tropical maritime', 'AC', '.ag', NULL, 'XCD'), (1664, 29, 'Montserrat', NULL, 'Caribbean', 'Plymouth', 102, 40, 0, 'Caribbean Sea', 930, 'lava dome in Englishs Crater', NULL, 'Birthday of Queen ELIZABETH II', 'second Saturday in June', 9439, '1.05', 78.85, 28.9, 1, 'tropical; little daily or seasonal temperature variation', 'MH', '.ms', NULL, 'XCD'), (255, 14, 'United Republic of Tanzania', 'Tanzania', 'Eastern Africa', 'Dar es Salaam', 945087, 1424, 0, 'Indian Ocean', 5895, 'Kilimanjaro', '26-Apr-1964', 'Union Day', '26-Apr', 37445392, '1.83', 45.64, 17.7, 123, 'varies from tropical along coast to temperate in highlands', 'TZ', '.tz', NULL, 'TZS'), (386, 39, 'Republic of Slovenia', 'Slovenia', 'Central Europe', 'Ljubljana', 20273, 47, 0, 'Adriatic Sea', 2864, 'Triglav', '25-Jun-1991', 'Independence Day', '25-Jun', 2010347, '-.05', 76.33, 40.6, 14, 'Mediterranean climate on the coast, continental climate with mild to hot summers and cold winters in the plateaus and valleys to the east', 'SI', '.si', NULL, 'SIT'), (268, 18, 'Kingdom of Swaziland', 'Swaziland', 'Southern Africa', 'Mbabane', 17363, 0, 21, 'Great Usutu River', 1862, 'Emlembe', '6-Sep-1968', 'Independence Day', '6-Sep', 1136334, '-.23', 32.62, 18.5, 18, 'varies from tropical to near temperate', 'WZ', '.sz', NULL, 'SZL'), (993, 143, 'Turkmenistan', NULL, 'Central Asia', 'Ashgabat', 488100, 0, -81, 'Vpadina Akchanaya', 3139, 'Gora Ayribaba', '27-Oct-1991', 'Independence Day', '27-Oct', 5042920, '1.83', 61.83, 21.8, 39, 'subtropical desert', 'TX', '.tm', NULL, 'TMM'), (256, 14, 'Republic of Uganda', 'Uganda', 'Eastern Africa', 'Kampala', 236040, 0, 621, 'Lake Albert', 5110, 'Margherita Peak on Mount Stanley', '9-Oct-1962', 'Independence Day', '9-Oct', 28195754, '3.37', 52.67, 15, 28, 'tropical; generally rainy with two dry seasons (December to February, June to August); semiarid in northeast', 'UG', '.ug', NULL, 'UGX'), (31, 155, 'Kingdom of the Netherlands', 'Netherlands', 'Western Europe', 'Amsterdam', 41526, 451, -7, 'Zuidplaspolder', 322, 'Vaalserberg', '23-Jan-1579', 'Queens Day', '30-Apr', 16491461, '.49', 78.96, 39.4, 27, 'temperate; marine; cool summers and mild winters', 'NL', '.nl', NULL, 'EUR'), (992, 143, 'Republic of Tajikistan', 'Tajikistan', 'Central Asia', 'Dushanbe', 143100, 0, 300, 'Syr Darya', 7495, 'Qullai Ismoili Somoni', '9-Sep-1991', 'Independence Day', '9-Sep', 7320815, '2.19', 64.94, 20, 45, 'midlatitude continental, hot summers, mild winters; semiarid to polar in Pamir Mountains', 'TI', '.tj', NULL, 'TJS'), (1340, 29, 'United States Virgin Islands', 'Virgin Islands', 'Caribbean', 'Charlotte Amalie', 1910, 188, 0, 'Caribbean Sea', 475, 'Crown Mountain', NULL, 'Transfer Day', '27-Mar', 108605, '-.12', 79.05, 37.1, 2, 'subtropical, tempered by easterly trade winds, relatively low humidity, little seasonal temperature variation; rainy season September to November', 'VQ', '.vi', NULL, 'USD'), (1284, 29, 'British Virgin Islands', NULL, 'Caribbean', 'Road Town', 153, 80, 0, 'Caribbean Sea', 521, 'Mount Sage', NULL, 'Territory Day', '1-Jul', 23098, '1.97', 76.68, 31.4, 3, 'subtropical; humid; temperatures moderated by trade winds', 'VI', '.vg', NULL, 'USD'), (244, 18, 'Republic of Angola', 'Angola', 'Southern Africa', 'Luanda', 1246700, 1600, 0, 'Atlantic Ocean', 2620, 'Morro de Moco', '11-Nov-1975', 'Independence Day', '11-Nov', 12127071, '2.45', 38.62, 18, 243, 'semiarid in south and along coast to Luanda; north has cool, dry season (May to October) and hot, rainy season (November to April)', 'AO', '.ao', NULL, 'AOA'), (1649, 29, 'Turks and Caicos Islands', NULL, 'Caribbean', 'Grand Turk', 430, 389, 0, 'Caribbean Sea', 49, 'Blue Hills', NULL, 'Constitution Day', '30-Aug', 21152, '2.82', 74.73, 27.5, 8, 'tropical; marine; moderated by trade winds; sunny and relatively dry', 'TK', '.tc', NULL, 'USD'), (692, 9, 'Republic of the Marshall Islands', 'Marshall Islands', 'Oceania', 'Majuro', 11854, 370, 0, 'Pacific Ocean', 10, 'unnamed location', '1-Oct-1986', 'Constitution Day', '1-May', 60422, '2.25', 70.31, 20.3, 15, 'tropical; hot and humid; wet season May to November; islands border typhoon belt', 'RM', '.mh', NULL, 'USD'), (2, 21, 'Canada', NULL, 'Northern North America', 'Ottawa', 9984670, 202080, 0, 'Atlantic Ocean', 5959, 'Mount Logan', '1-Jul-1867', 'Canada Day', '1-Jul', 33098932, '.88', 80.22, 38.9, 1331, 'varies from temperate in south to subarctic and arctic in north', 'CA', '.ca', NULL, 'CAD'), (506, 13, 'Republic of Costa Rica', 'Costa Rica', 'Central America', 'San Jose', 51100, 1290, 0, 'Pacific Ocean', 3810, 'Cerro Chirripo', '15-Sep-1821', 'Independence Day', '15-Sep', 4075261, '1.45', 77.02, 26.4, 156, 'tropical and subtropical; dry season (December to April); rainy season (May to November); cooler in highlands', 'CS', '.cr', NULL, 'CRC'), (238, 11, 'Republic of Cape Verde', 'Cape Verde', 'Western Africa', 'Praia', 4033, 965, 0, 'Atlantic Ocean', 2829, 'Mt. Fogo', '5-Jul-1975', 'Independence Day', '5-Jul', 420979, '.64', 70.73, 19.8, 7, 'temperate; warm, dry summer; precipitation meager and very erratic', 'CV', '.cv', NULL, 'CVE'), (299, 21, 'Greenland', NULL, 'Northern North America', 'Nuuk', 2166086, 44087, 0, 'Atlantic Ocean', 3700, 'Gunnbjorn', NULL, 'Longest Day', '21-Jun', 56361, '-.03', 69.94, 34, 14, 'arctic to subarctic; cool summers, cold winters', 'GL', '.gl', NULL, 'DKK'), (1809, 29, 'Dominican Republic', 'The Dominican', 'Caribbean', 'Santo Domingo', 48730, 1288, -46, 'Lago Enriquillo', 3175, 'Pico Duarte', '27-Feb-1844', 'Independence Day', '27-Feb', 9183984, '1.47', 71.73, 24.1, 32, 'tropical maritime; little seasonal temperature variation; seasonal variation in rainfall', 'DR', '.do', NULL, 'DOP'), (291, 14, 'State of Eritrea', 'Eritrea', 'Eastern Africa', 'Asmara', 121320, 2234, -75, 'near Kulul within the Denakil depression', 3018, 'Soira', '24-May-1993', 'Independence Day', '24-May', 4786994, '2.47', 59.03, 17.8, 17, 'hot, dry desert strip along Red Sea coast; cooler and wetter in the central highlands (up to 61 cm of rainfall annually, heaviest June to September); semiarid in western hills and lowlands', 'ER', '.er', NULL, 'ERN'), (251, 14, 'Federal Democratic Republic of Ethiopia', 'Ethiopia', 'Eastern Africa', 'Addis Ababa', 1127127, 0, -125, 'Denakil Depression', 4620, 'Ras Dejen', NULL, 'National Day', '28-May', 74777981, '2.31', 49.03, 17.8, 82, 'tropical monsoon with wide topographic-induced variation', 'ET', '.et', NULL, 'ETB'), (38, 39, 'The Holy See (State of the Vatican City)', 'Holy See (Vatican City)', 'Southern Europe', 'Vatican City', 0, 0, 19, 'unnamed location', 75, 'unnamed location', '11-Feb-1929', 'Coronation Day of Pope BENEDICT XVI', '24-Apr', 932, '.01', NULL, NULL, 0, 'temperate; mild, rainy winters (September to May) with hot, dry summers (May to September)', 'VT', '.va', NULL, 'EUR'), (34, 39, 'Kingdom of Spain', 'Spain', 'Southwestern Europe', 'Madrid', 504782, 4964, 0, 'Atlantic Ocean', 3718, 'Pico de Teide', NULL, 'National Day', '12-Oct', 40397842, '.13', 79.65, 39.9, 157, 'temperate; clear, hot summers in interior, more moderate and cloudy along coast; cloudy, cold winters in interior, partly cloudy and cool along coast', 'SP', '.es', NULL, 'EUR'), (378, 39, 'Republic of San Marino', 'San Marino', 'Southern Europe', 'San Marino', 61, 0, 55, 'Torrente Ausa', 755, 'Monte Titano', '3 September A.D. 301', 'Founding of the Republic', '3-Sep', 29251, '1.26', 81.71, 40.6, 0, 'Mediterranean; mild to cool winters; warm, sunny summers', 'SM', '.sm', NULL, 'EUR'), (994, 145, 'Republic of Azerbaijan', 'Azerbaijan', 'Southwestern Asia', 'Baku', 86600, 0, -28, 'Caspian Sea', 4485, 'Bazarduzu Dagi', '30-Aug-1991', 'Founding of the Democratic Republic of Azerbaijan', '28-May', 7961619, '.66', 63.85, 27.7, 45, 'dry, semiarid steppe', 'AJ', '.az', NULL, 'AZM'), (423, 155, 'Principality of Liechtenstein', 'Liechtenstein', 'Central Europe', 'Vaduz', 160, 0, 430, 'Ruggeller Riet', 2599, 'Vorder-Grauspitz', '12-Jul-1806', 'Assumption Day', '15-Aug', 33987, '.78', 79.68, 39.6, 0, 'continental; cold, cloudy winters with frequent snow or rain; cool to moderately warm, cloudy, humid summers', 'LS', '.li', NULL, 'CHF'), (93, 34, 'Islamic Republic of Afghanistan', 'Afghanistan', 'Southern Asia', 'Kabul', 647500, 0, 258, 'Amu Darya', 7485, 'Nowshak', '19-Aug-1919', 'Independence Day', '19-Aug', 31056997, '2.67', 43.34, 17.6, 46, 'arid to semiarid; cold winters and hot summers', 'AF', '.af', NULL, 'AFA'), (355, 39, 'Republic of Albania', 'Albania', 'Southeastern Europe', 'Tirana', 28748, 362, 0, 'Adriatic Sea', 2764, 'Maja e Korabit (Golem Korab)', '28-Nov-1912', 'Independence Day', '28-Nov', 3581655, '.52', 77.43, 28.9, 11, 'mild temperate; cool, cloudy, wet winters; hot, clear, dry summers; interior is cooler and wetter', 'AL', '.al', NULL, 'ALL'), (599, 29, 'Netherlands Antilles', NULL, 'Caribbean', 'Willemstad', 960, 364, 0, 'Caribbean Sea', 862, 'Mount Scenery', NULL, 'Queens Day', '30-Apr', 221736, '.79', 76.03, 32.8, 5, 'tropical; ameliorated by northeast trade winds', 'NT', '.an', NULL, 'ANG'), (54, 5, 'Argentine Republic', 'Argentina', 'Southern South America', 'Buenos Aires', 2766890, 4989, -105, 'Laguna del Carbon', 6960, 'Cerro Aconcagua', '9-Jul-1816', 'Revolution Day', '25-May', 39921833, '.96', 76.12, 29.7, 1333, 'mostly temperate; arid in southeast; subantarctic in southwest', 'AR', '.ar', NULL, 'ARS'), (688, 9, 'Tuvalu', NULL, 'Oceania', 'Funafuti', 26, 24, 0, 'Pacific Ocean', 5, 'unnamed location', '1-Oct-1978', 'Independence Day', '1-Oct', 11810, '1.51', 68.32, 24.6, 1, 'tropical; moderated by easterly trade winds (March to November); westerly gales and heavy rain (November to March)', 'TV', '.tv', NULL, 'AUD'), (67, 35, 'Territory of Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'Southeastern Asia', 'West Island', 14, 26, 0, 'Indian Ocean', 5, 'unnamed location', NULL, 'Australia Day', '26-Jan', 574, '0', NULL, NULL, 1, 'tropical with high humidity, moderated by the southeast trade winds for about nine months of the year', 'CK', '.cc', NULL, 'AUD'), (61, 9, 'Commonwealth of Australia', 'Australia', 'Oceania', 'Canberra', 7686850, 25760, -15, 'Lake Eyre', 2229, 'Mount Kosciuszko', '1-Jan-1901', 'Australia Day', '26-Jan', 20264082, '.85', 80.5, 36.9, 450, 'generally arid to semiarid; temperate in south and east; tropical in north', 'AS', '.au', NULL, 'AUD'), (671, 9, 'Territory of Norfolk Island', 'Norfolk Island', 'Oceania', 'Kingston', 35, 32, 0, 'Pacific Ocean', 319, 'Mount Bates', NULL, 'Bounty Day', '8-Jun', 1828, '-.01', NULL, NULL, 1, 'subtropical; mild, little seasonal temperature variation', 'NF', '.nf', NULL, 'AUD'), (618, 35, 'Territory of Christmas Island', 'Christmas Island', 'Southeastern Asia', 'The Settlement', 135, 139, 0, 'Indian Ocean', 361, 'Murray Hill', NULL, 'Australia Day', '26-Jan', 1493, '0', NULL, NULL, 1, 'tropical with a wet and dry season; heat and humidity moderated by trade winds; wet season (December to April)', 'KT', '.cx', NULL, 'AUD'), (686, 9, 'Republic of Kiribati', 'Kiribati', 'Oceania', 'Tarawa', 811, 1143, 0, 'Pacific Ocean', 81, 'unnamed location', '12-Jul-1979', 'Independence Day', '12-Jul', 105432, '2.24', 62.08, 20.2, 19, 'tropical; marine, hot and humid, moderated by trade winds', 'KR', '.ki', NULL, 'AUD'), (357, 145, 'Republic of Cyprus', 'Cyprus', 'Middle East', 'Nicosia', 9250, 648, 0, 'Mediterranean Sea', 1951, 'Mount Olympus', '16-Aug-1960', 'Independence Day', '1-Oct', 784301, '.53', 77.82, 34.9, 16, 'temperate; Mediterranean with hot, dry summers and cool winters', 'CY', '.cy', NULL, 'CYP'), (297, 29, 'Aruba', NULL, 'Caribbean', 'Oranjestad', 193, 69, 0, 'Caribbean Sea', 188, 'Mount Jamanota', NULL, 'Flag Day', '18-Mar', 71891, '.44', 79.28, 38.5, 1, 'tropical marine', 'AA', '.aw', NULL, 'AWG'), (387, 39, 'Bosnia and Herzegovina', NULL, 'Southeastern Europe', 'Sarajevo', 51129, 20, 0, 'Adriatic Sea', 2386, 'Maglic', '1-Mar-1992', 'National Day', '25-Nov', 4498976, '1.35', 78, 38.4, 27, 'hot summers and cold winters; areas of high elevation have short, cool summers and long, severe winters; mild, rainy winters along coast', 'BK', '.ba', NULL, 'BAM'), (257, 17, 'Republic of Burundi', 'Burundi', 'Central Africa', 'Bujumbura', 27830, 0, 772, 'Lake Tanganyika', 2670, 'Heha', '1-Jul-1962', 'Independence Day', '1-Jul', 8090068, '3.7', 50.81, 16.6, 8, 'equatorial; high plateau with considerable altitude variation', 'BY', '.bi', NULL, 'BIF'), (1441, 21, 'Bermuda', NULL, 'North America', 'Hamilton', 53, 103, 0, 'Atlantic Ocean', 76, 'Town Hill', NULL, 'Bermuda Day', '24-May', 65773, '.61', 77.96, 40.2, 1, 'subtropical; mild, humid; gales, strong winds common in winter', 'BD', '.bm', NULL, 'BMD'), (673, 35, 'Negara Brunei Darussalam', 'Brunei', 'Southeastern Asia, bordering the South China Sea and Malaysia', 'Bandar Seri Begawan', 5770, 161, 0, 'South China Sea', 1850, 'Bukit Pagon', '1-Jan-1984', 'National Day', '23-Feb', 379444, '1.87', 75.01, 27.4, 2, 'tropical; hot, humid, rainy', 'BX', '.bn', NULL, 'BND'), (591, 5, 'Republic of Bolivia', 'Bolivia', 'South America', 'La Paz', 1098580, 0, 90, 'Rio Paraguay', 6542, 'Nevado Sajama', '6-Aug-1825', 'Independence Day', '6-Aug', 8989046, '1.45', 65.84, 21.8, 1067, 'varies with altitude; humid and tropical to cold and semiarid', 'BL', '.bo', NULL, 'BOB'), (55, 5, 'Federative Republic of Brazil', 'Brazil', 'Eastern South America', 'Brasilia', 8511965, 7491, 0, 'Atlantic Ocean', 3014, 'Pico da Neblina', '7-Sep-1822', 'Independence Day', '7-Sep', 188078227, '1.04', 71.97, 28.2, 4223, 'mostly tropical, but temperate in south', 'BR', '.br', NULL, 'BRL'), (975, 34, 'Kingdom of Bhutan', 'Bhutan', 'Southern Asia', 'Thimphu', 47000, 0, 97, 'Drangme Chhu', 7553, 'Kula Kangri', '8-Aug-1949', 'National Day', '17-Dec', 2279723, '2.1', 54.78, 20.4, 2, 'varies; tropical in southern plains; cool winters and hot summers in central valleys; severe winters and cool summers in Himalayas', 'BT', '.bt', NULL, 'BTN'), (375, 151, 'Republic of Belarus', 'Belarus', 'Eastern Europe', 'Minsk', 207600, 0, 90, 'Nyoman River', 346, 'Dzyarzhynskaya Hara', '25-Aug-1991', 'Independence Day', '3-Jul', 10293011, '-.06', 69.08, 37.2, 101, 'cold winters, cool and moist summers; transitional between continental and maritime', 'BO', '.by', NULL, 'BYB'), (501, 13, 'Belize', NULL, 'Central America', 'Belmopan', 22966, 386, 0, 'Caribbean Sea', 1160, 'Victoria Peak', '21-Sep-1981', 'Independence Day', '21-Sep', 287730, '2.31', 68.3, 19.6, 43, 'tropical; very hot and humid; rainy season (May to November); dry season (February to May)', 'BH', '.bz', NULL, 'BZD'), (1246, 29, 'Barbados', NULL, 'Caribbean', 'Bridgetown', 431, 97, 0, 'Atlantic Ocean', 336, 'Mount Hillaby', '30-Nov-1966', 'Independence Day', '30-Nov', 279912, '.37', 72.79, 34.6, 1, 'tropical; rainy season (June to October)', 'BB', '.bb', NULL, 'BBD'), (243, 17, 'Democratic Republic of the Congo', NULL, 'Central Africa', 'Kinshasa', 2345410, 37, 0, 'Atlantic Ocean', 5110, 'Pic Marguerite on Mont Ngaliema', '30-Jun-1960', 'Independence Day', '30-Jun', 62660551, '3.07', 51.46, 16.2, 232, 'tropical; hot and humid in equatorial river basin; cooler and drier in southern highlands', 'CG', '.cd', NULL, 'CDF'), (264, 18, 'Republic of Namibia', 'Namibia', 'Southern Africa', 'Windhoek', 825418, 1572, 0, 'Atlantic Ocean', 2606, 'Konigstein', '21-Mar-1990', 'Independence Day', '21-Mar', 2044147, '.59', 43.39, 20, 136, 'desert; hot, dry; rainfall sparse and erratic', 'WA', '.na', NULL, 'NAD'), (280, 5, 'South Georgia and the South Sandwich Islands', NULL, 'Southern South America', NULL, 3903, NULL, 0, 'Atlantic Ocean', 2934, 'Mount Paget', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'variable, with mostly westerly winds throughout the year interspersed with periods of calm; nearly all precipitation falls as snow', 'SX', '.gs', NULL, 'NONE'), (12, 9, 'Coral Sea Islands Territory', 'Coral Sea Islands', 'Oceania', NULL, 3, 3095, 0, 'Pacific Ocean', 6, 'unnamed location on Cato Island', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tropical', 'CR', NULL, NULL, 'NONE'), (300, 29, 'Navassa Island', NULL, 'Caribbean', NULL, 5, 8, 0, 'Caribbean Sea', 77, 'unnamed location on southwest side', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'marine, tropical', 'BQ', NULL, NULL, 'NONE'), (672, 9, 'Antarctica', NULL, 'continent mostly south of the Antarctic Circle', NULL, 14000000000, 17968, -2555, 'Bentley Subglacial Trench', 4897, 'Vinson Massif', NULL, NULL, NULL, 0, NULL, NULL, NULL, 28, 'severe low temperatures vary with latitude, elevation, and distance from the ocean; East Antarctica is colder than West Antarctica because of its higher elevation; Antarctic Peninsula has the most moderate climate; higher temperatures occur in January along the coast and average slightly below freezing', 'AY', '.aq', NULL, 'NONE'), (2000, 35, 'Territory of Ashmore and Cartier Islands', 'Ashmore and Cartier Islands', 'Southeastern Asia', NULL, 5, 74, 0, 'Indian Ocean', 3, 'unnamed location', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'tropical', 'AT', NULL, NULL, 'NONE'), (208, 35, 'Spratly Islands', NULL, 'Southeastern Asia', NULL, 5, 926, 0, 'South China Sea', 4, 'unnamed location on Southwest Cay', NULL, NULL, NULL, 0, NULL, NULL, NULL, 3, 'tropical', 'PG', NULL, NULL, 'NONE'), (207, 35, 'Paracel Islands', NULL, 'Southeastern Asia', NULL, NULL, 518, 0, 'South China Sea', 14, 'unnamed location', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'tropical', 'PF', NULL, NULL, 'NONE'), (996, 143, 'Kyrgyz Republic', 'Kyrgyzstan', 'Central Asia', 'Bishkek', 198500, 0, 132, 'Kara-Daryya', 7439, 'Jengish Chokusu', '31-Aug-1991', 'Independence Day', '31-Aug', 5213898, '1.32', 68.49, 23.6, 37, 'dry continental to polar in high Tien Shan; subtropical in southwest (Fergana Valley); temperate in northern foothill zone', 'KG', '.kg', NULL, 'NONE'), (204, 154, 'Jan Mayen', NULL, 'Northern Europe', NULL, 373, 124, 0, 'Norwegian Sea', 2277, 'Haakon VII Toppen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'arctic maritime with frequent storms and persistent fog', 'JN', NULL, NULL, 'NONE'), (500, 5, 'Falkland Islands', NULL, 'Falkland Islands', 'Stanley', 12173, 1288, 0, 'Atlantic Ocean', 705, 'Mount Usborne', NULL, 'Liberation Day', '14-Jun', 2967, '2.44', NULL, NULL, 5, 'cold marine; strong westerly winds, cloudy, humid; rain occurs on more than half of days in year; average annual rainfall is 24 inches in Stanley; occasional snow all year, except in January and February, but does not accumulate', 'FK', '.fk', NULL, 'FKP'), (44, 155, 'United Kingdom of Great Britain and Northern Ireland', 'United Kingdom', 'Western Europe', 'London', 244820, 12429, -4, 'The Fens', 1343, 'Ben Nevis', '10th century', NULL, NULL, 60609153, '.28', 78.54, 39.3, 471, 'temperate; moderated by prevailing southwest winds over the North Atlantic Current; more than one-half of the days are overcast', 'UK', '.uk', NULL, 'GBP'), (203, 155, 'Bailiwick of Jersey', 'Jersey', 'Western Europe', 'Saint Helier', 116, 70, 0, 'Atlantic Ocean', 143, 'unnamed location', NULL, 'Liberation Day', '9-May', 91084, '.28', 79.38, 41.4, 1, 'temperate; mild winters and cool summers', 'JE', '.je', NULL, 'GBP'), (202, 155, 'Isle of Man', NULL, 'Western Europe', 'Douglas', 572, 160, 0, 'Irish Sea', 621, 'Snaefell', NULL, 'Tynwald Day', '5-Jul', 75441, '.52', 78.49, 39.6, 1, 'temperate; cool summers and mild winters; overcast about one-third of the time', 'IM', '.im', NULL, 'GBP'), (350, 39, 'Gibraltar', NULL, 'Southwestern Europe', 'Gibraltar', 7, 12, 0, 'Mediterranean Sea', 426, 'Rock of Gibraltar', NULL, 'National Day', '10-Sep', 27928, '.14', 79.8, 39.8, 1, 'Mediterranean with mild winters and warm summers', 'GI', '.gi', NULL, 'GIP'), (502, 13, 'Republic of Guatemala', 'Guatemala', 'Central America', 'Guatemala', 108890, 400, 0, 'Pacific Ocean', 4211, 'Volcan Tajumulco', '15-Sep-1821', 'Independence Day', '15-Sep', 12293545, '2.27', 69.38, 18.9, 449, 'tropical; hot, humid in lowlands; cooler in highlands', 'GT', '.gt', NULL, 'GTQ'), (592, 5, 'Co-operative Republic of Guyana', 'Guyana', 'Northern South America', 'Georgetown', 214970, 459, 0, 'Atlantic Ocean', 2835, 'Mount Roraima', '26-May-1966', 'Republic Day', '23-Feb', 767245, '.25', 65.86, 27.4, 69, 'tropical; hot, humid, moderated by northeast trade winds; two rainy seasons (May to August, November to January)', 'GY', '.gy', NULL, 'GYD'), (968, 145, 'Sultanate of Oman', 'Oman', 'Middle East', 'Muscat', 212460, 2092, 0, 'Arabian Sea', 2980, 'Jabal Shams', '7-Jul-1904', 'Birthday of Sultan QABOOS', '18-Nov', 3102229, '3.28', 73.37, 19, 137, 'dry desert; hot, humid along coast; hot, dry interior; strong southwest summer monsoon (May to September) in far south', 'MU', '.om', NULL, 'OMR'), (63, 35, 'Republic of the Philippines', 'Philippines', 'Southeastern Asia', 'Manila', 300000, 36289, 0, 'Philippine Sea', 2954, 'Mount Apo', '12-Jun-1898', 'Independence Day', '4-Jul', 89468677, '1.8', 70.21, 22.5, 256, 'tropical marine; northeast monsoon (November to April); southwest monsoon (May to October)', 'RP', '.ph', NULL, 'PHP'), (250, 17, 'Republic of Rwanda', 'Rwanda', 'Central Africa', 'Kigali', 26338, 0, 950, 'Rusizi River', 4519, 'Volcan Karisimbi', '1-Jul-1962', 'Independence Day', '1-Jul', 8648248, '2.43', 47.3, 18.6, 9, 'temperate; two rainy seasons (February to April, November to January); mild in mountains with frost and snow possible', 'RW', '.rw', NULL, 'RWF'), (13, 9, 'Cook Islands', NULL, 'Oceania', 'Avarua', 240, 120, 0, 'Pacific Ocean', 652, 'Te Manga', NULL, 'Constitution Day', 'first Monday in August', 21388, NULL, NULL, NULL, 9, 'tropical; moderated by trade winds', 'CW', '.ck', NULL, 'NZD'), (683, 9, 'Niue', NULL, 'Oceania', 'Alofi', 260, 64, 0, 'Pacific Ocean', 68, 'unnamed location', '19-Oct-1974', 'Waitangi Day', '6-Feb', 2166, '.01', NULL, NULL, 1, 'tropical; modified by southeast trade winds', 'NE', '.nu', NULL, 'NZD'), (1671, 9, 'Territory of Guam', 'Guam', 'Oceania', 'Hagatna', 541, 126, 0, 'Pacific Ocean', 406, 'Mount Lamlam', NULL, 'Discovery Day', 'first Monday in March', 171019, '1.43', 78.58, 28.6, 5, 'tropical marine; generally warm and humid, moderated by northeast trade winds; dry season (January to June), rainy season (July to December); little seasonal temperature variation', 'GQ', '.gu', NULL, 'USD'), (691, 9, 'Federated States of Micronesia', NULL, 'Oceania', 'Palikir', 702, 6112, 0, 'Pacific Ocean', 791, 'Dolohmwar', '3-Nov-1986', 'Constitution Day', '10-May', 108004, '-.11', 70.05, 20.9, 6, 'tropical; heavy year-round rainfall, especially in the eastern islands; located on southern edge of the typhoon belt with occasionally severe damage', 'FM', '.fm', NULL, 'USD'), (503, 13, 'Republic of El Salvador', 'El Salvador', 'Central America', 'San Salvador', 21040, 307, 0, 'Pacific Ocean', 2730, 'Cerro El Pital', '15-Sep-1821', 'Independence Day', '15-Sep', 6822378, '1.72', 71.49, 21.8, 76, 'tropical; rainy season (May to October); dry season (November to April); tropical on coast; temperate in uplands', 'ES', '.sv', NULL, 'USD'), (593, 5, 'Republic of Ecuador', 'Ecuador', 'Western South America', 'Quito', 283560, 2237, 0, 'Pacific Ocean', 6267, 'Chimborazo', '24 May 1822', 'Independence Day', '10-Aug', 13547510, '1.5', 76.42, 23.6, 285, 'tropical along coast, becoming cooler inland at higher elevations; tropical in Amazonian jungle lowlands', 'EC', '.ec', NULL, 'USD'), (1670, 9, 'Commonwealth of the Northern Mariana Islands', 'Northern Mariana Islands', 'Oceania', 'Saipan', 477, 1482, 0, 'Pacific Ocean', 965, 'unnamed location on Agrihan', NULL, 'Commonwealth Day', '8-Jan', 82459, '2.54', 76.09, 29.5, 5, 'tropical marine; moderated by northeast trade winds, little seasonal temperature variation; dry season December to June, rainy season July to October', 'CQ', '.mp', NULL, 'USD'), (684, 9, 'Territory of American Samoa', 'American Samoa', 'Oceania', 'Pago Pago', 199, 116, 0, 'Pacific Ocean', 964, 'Lata Mountain', NULL, 'Flag Day', '17-Apr', 57794, '-.19', 76.05, 23.2, 3, 'tropical marine, moderated by southeast trade winds; annual rainfall averages about 3 m; rainy season (November to April), dry season (May to October); little seasonal temperature variation', 'AQ', '.as', NULL, 'USD'), (239, 11, 'Democratic Republic of Sao Tome and Principe', 'Sao Tome and Principe', 'Western Africa', 'Sao Tome', 1001, 209, 0, 'Atlantic Ocean', 2024, 'Pico de Sao Tome', '12-Jul-1975', 'Independence Day', '12-Jul', 193413, '3.15', 67.31, 16.2, 2, 'tropical; hot, humid; one rainy season (October to May)', 'TP', '.st', NULL, 'STD'), (598, 5, 'Oriental Republic of Uruguay', 'Uruguay', 'Southern South America', 'Montevideo', 176220, 660, 0, 'Atlantic Ocean', 514, 'Cerro Catedral', '25-Aug-1825', 'Independence Day', '25-Aug', 3431932, '.46', 76.33, 32.7, 64, 'warm temperate; freezing temperatures almost unknown', 'UY', '.uy', NULL, 'UYU'), (998, 143, 'Republic of Uzbekistan', 'Uzbekistan', 'Central Asia', 'Tashkent', 447400, 0, -12, 'Sariqarnish Kuli', 4301, 'Adelunga Toghi', '1-Sep-1991', 'Independence Day', '1-Sep', 27307134, '1.7', 64.58, 22.7, 79, 'mostly midlatitude desert, long, hot summers, mild winters; semiarid grassland in east', 'UZ', '.uz', NULL, 'UZS'), (58, 5, 'Bolivarian Republic of Venezuela', 'Venezuela', 'Northern South America', 'Caracas', 912050, 2800, 0, 'Caribbean Sea', 5007, 'Pico Bolivar', '5-Jul-1811', 'Independence Day', '5-Jul', 25730435, '1.38', 74.54, 26, 370, 'tropical; hot, humid; more moderate in highlands', 'VE', '.ve', NULL, 'VEB'), (678, 9, 'Republic of Vanuatu', 'Vanuatu', 'Oceania', 'Port-Vila', 12200, 2528, 0, 'Pacific Ocean', 1877, 'Tabwemasana', '30-Jul-1980', 'Independence Day', '30-Jul', 208869, '1.49', 62.85, 23, 31, 'tropical; moderated by southeast trade winds from May to October; moderate rainfall from November to April; may be affected by cyclones from December to April', 'NH', '.vu', NULL, 'VUV'), (48, 151, 'Republic of Poland', 'Poland', 'Central Europe', 'Warsaw', 312685, 491, -2, 'near Raczki Elblaskie', 2499, 'Rysy', '11-Nov-1918', 'Constitution Day', '3-May', 38536869, '-.05', 74.97, 37, 123, 'temperate with cold, cloudy, moderately severe winters with frequent precipitation; mild summers with frequent showers and thundershowers', 'PL', '.pl', NULL, 'PLN'), (670, 35, 'Democratic Republic of Timor-Leste', 'East Timor', 'Southeastern Asia', 'Dili', 15007, 706, 0, 'Timor Sea', 2963, 'Foho Tatamailau', '28-Nov-1975', 'Independence Day', '28-Nov', 1062777, '2.08', 66.26, 20.8, 8, 'tropical; hot, humid; distinct rainy and dry seasons', 'TT', '.tl', NULL, 'USD'), (46, 154, 'Kingdom of Sweden', 'Sweden', 'Northern Europe', 'Stockholm', 449964, 3218, -2, 'reclaimed bay of Lake Hammarsjon', 2111, 'Kebnekaise', '6-Jun-1523', 'Flag Day', '6-Jun', 9016596, '.16', 80.51, 40.9, 255, 'temperate in south with cold, cloudy winters and cool, partly cloudy summers; subarctic in north', 'SW', '.se', NULL, 'SEK'), (421, 151, 'Slovak Republic', 'Slovakia', 'Central Europe', 'Bratislava', 48845, 0, 94, 'Bodrok River', 2655, 'Gerlachovsky Stit', '1-Jan-1993', 'Constitution Day', '1-Sep', 5439448, '.15', 74.73, 35.8, 34, 'temperate; cool summers; cold, cloudy, humid winters', 'LO', '.sk', NULL, 'SKK'), (1758, 29, 'Saint Lucia', NULL, 'Caribbean', 'Castries', 616, 158, 0, 'Caribbean Sea', 950, 'Mount Gimie', '22-Feb-1979', 'Independence Day', '22-Feb', 168458, '1.29', 73.84, 25.2, 2, 'tropical, moderated by northeast trade winds; dry season January to April, rainy season May to August', 'ST', '.lc', NULL, 'XCD'), (205, 18, 'Juan de Nova Island', NULL, 'Southern Africa', NULL, 4, 24, 0, 'Indian Ocean', 10, 'unnamed location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'tropical', 'JU', NULL, NULL, 'NONE'), (230, 18, 'Republic of Mauritius', 'Mauritius', 'Southern Africa', 'Port Louis', 2040, 177, 0, 'Indian Ocean', 828, 'Mont Piton', '12-Mar-1968', 'Independence Day', '12-Mar', 1240827, '.82', 72.63, 30.8, 6, 'tropical, modified by southeast trade winds; warm, dry winter (May to November); hot, wet, humid summer (November to May)', 'MP', '.mu', NULL, 'MUR'), (47, 154, 'Kingdom of Norway', 'Norway', 'Northern Europe', 'Oslo', 324220, 25148, 0, 'Norwegian Sea', 2469, 'Galdhopiggen', '7-Jun-1905', 'Constitution Day', '17-May', 4610820, '.38', 79.54, 38.4, 100, 'temperate along coast, modified by North Atlantic Current; colder interior with increased precipitation and colder summers; rainy year-round on west coast', 'NO', '.no', NULL, 'NOK'), (53, 29, 'Republic of Cuba', 'Cuba', 'Caribbean', 'Havana', 110860, 3735, 0, 'Caribbean Sea', 2005, 'Pico Turquino', '20-May-1902', 'Independence Day', '20-May', 11382820, '.31', 77.41, 35.9, 170, 'tropical; moderated by trade winds; dry season (November to April); rainy season (May to October)', 'CU', '.cu', NULL, 'CUP'), (56, 5, 'Republic of Chile', 'Chile', 'Southern South America', 'Santiago', 756950, 6435, 0, 'Pacific Ocean', 6880, 'Nevado Ojos del Salado', '18-Sep-1810', 'Independence Day', '18-Sep', 16134219, '.94', 76.77, 30.4, 363, 'temperate; desert in north; Mediterranean in central region; cool and damp in south', 'CI', '.cl', NULL, 'CLP'), (57, 5, 'Republic of Colombia', 'Colombia', 'Northern South America', 'Bogota', 1138910, 3208, 0, 'Pacific Ocean', 5775, 'Pico Cristobal Colon', '20-Jul-1810', 'Independence Day', '20-Jul', 43593035, '1.46', 71.99, 26.3, 981, 'tropical along coast and eastern plains; cooler in highlands', 'CO', '.co', NULL, 'COP'), (62, 35, 'Republic of Indonesia', 'Indonesia', 'Southeastern Asia', 'Jakarta', 1919440, 54716, 0, 'Indian Ocean', 5030, 'Puncak Jaya', '17-Aug-1945', 'Independence Day', '17-Aug', 245452739, '1.41', 69.87, 26.8, 668, 'tropical; hot, humid; more moderate in highlands', 'ID', '.id', NULL, 'IDR'), (65, 35, 'Republic of Singapore', 'Singapore', 'Southeastern Asia', 'Singapore', 693, 193, 0, 'Singapore Strait', 166, 'Bukit Timah', '9-Aug-1965', 'National Day', '9-Aug', 4492150, '1.42', 81.71, 37.3, 9, 'tropical; hot, humid, rainy; two distinct monsoon seasons - Northeastern monsoon (December to March) and Southwestern monsoon (June to September); inter-monsoon - frequent afternoon and early evening thunderstorms', 'SN', '.sg', NULL, 'SGD'), (39, 39, 'Italian Republic', 'Italy', 'Southern Europe', 'Rome', 301230, 7600, 0, 'Mediterranean Sea', 4748, 'Mont Blanc', '17-Mar-1861', 'Republic Day', '2-Jun', 58133509, '.04', 79.81, 42.2, 135, 'predominantly Mediterranean; Alpine in far north; hot, dry in south', 'IT', '.it', NULL, 'EUR'), (49, 155, 'Federal Republic of Germany', 'Germany', 'Central Europe', 'Berlin', 357021, 2389, -4, 'Neuendorf bei Wilster', 2963, 'Zugspitze', '15-Mar-1991', 'Unity Day', '3-Oct', 82422299, '-.02', 78.8, 42.6, 552, 'temperate and marine; cool, cloudy, wet winters and summers; occasional warm mountain (foehn) wind', 'GM', '.de', NULL, 'EUR'), (36, 151, 'Republic of Hungary', 'Hungary', 'Central Europe', 'Budapest', 93030, 0, 78, 'Tisza River', 1014, 'Kekes', '27-Sep-1902', 'Saint Stephens Day', '20-Aug', 9981334, '-.25', 72.66, 38.7, 44, 'temperate; cold, cloudy, humid winters; warm summers', 'HU', '.hu', NULL, 'HUF'), (32, 155, 'Kingdom of Belgium', 'Belgium', 'Western Europe', 'Brussels', 30528, 67, 0, 'North Sea', 694, 'Signal de Botrange', '4-Oct-1830', NULL, '21-Jul', 10379067, '.13', 78.77, 40.9, 43, 'temperate; mild winters, cool summers; rainy, humid, cloudy', 'BE', '.be', NULL, 'EUR'), (33, 155, 'French Republic', 'France', 'Western Europe', 'Paris', 547030, 3427, -2, 'Rhone River delta', 4807, 'Mont Blanc', NULL, 'Bastille Day', '14-Jul', 60876136, '.35', 79.73, 39.1, 479, 'generally cool winters and mild summers, but mild winters and hot summers along the Mediterranean; occasional strong, cold, dry, north-to-northwesterly wind known as mistral', 'FR', '.fr', NULL, 'EUR'), (7, 151, 'Russian Federation', 'Russia', 'Northern Asia', 'Moscow', 17075200, 37653, -28, 'Caspian Sea', 5633, 'Gora El brus', '24-Aug-1991', 'Russia Day', '12-Jun', 142893540, '-.37', 67.08, 38.4, 1730, 'ranges from steppes in the south through humid continental in much of European Russia; subarctic in Siberia to tundra climate in the polar north; winters vary from cool along Black Sea coast to frigid in Siberia; summers vary from warm in the steppes to cool along Arctic coast', 'RS', '.ru', NULL, 'RUR'), (45, 154, 'Kingdom of Denmark', 'Denmark', 'Northern Europe', 'Copenhagen', 43094, 7314, -7, 'Lammefjord', 173, 'Yding Skovhoej', NULL, 'Constitution Day', '5-Jun', 5450661, '.33', 77.79, 39.8, 97, 'temperate; humid and overcast; mild, windy winters and cool summers', 'DA', '.dk', NULL, 'DKK'), (41, 155, 'Swiss Confederation', 'Switzerland', 'Central Europe', 'Bern', 41290, 0, 195, 'Lake Maggiore', 4634, 'Dufourspitze', '1-Aug-1291', 'Founding of the Swiss Confederation', '1-Aug', 7523934, '.43', 80.51, 40.1, 65, 'temperate, but varies with altitude; cold, cloudy, rainy/snowy winters; cool to warm, cloudy, humid summers with occasional showers', 'SZ', '.ch', NULL, 'CHF'), (43, 155, 'Republic of Austria', 'Austria', 'Central Europe', 'Vienna', 83870, 0, 115, 'Neusiedler See', 3798, 'Grossglockner', '17-Sep-1156', 'National Day', '26-Oct', 8192880, '.09', 79.07, 40.9, 55, 'temperate; continental, cloudy; cold winters with frequent rain and some snow in lowlands and snow in mountains; moderate summers with occasional showers', 'AU', '.at', NULL, 'EUR'), (209, 154, 'Svalbard', NULL, 'Northern Europe', 'Longyearbyen', 62049, 3587, 0, 'Arctic Ocean', 1717, 'Newtontoppen', NULL, NULL, NULL, 2701, '-.02', NULL, NULL, 4, 'arctic, tempered by warm North Atlantic Current; cool summers, cold winters; North Atlantic Current flows along west and north coasts of Spitsbergen, keeping water open and navigable most of the year', 'SV', '.sj', NULL, 'NOK'), (81, 30, 'Japan', NULL, 'Eastern Asia', 'Tokyo', 377835, 29751, -4, 'Hachiro-gata', 3776, 'Mount Fuji', '660 B.C.', 'Birthday of Emperor AKIHITO', '23-Dec', 127463611, '.02', 81.25, 42.9, 173, 'varies from tropical in south to cool temperate in north', 'JA', '.jp', NULL, 'JPY'), (84, 35, 'Socialist Republic of Vietnam', 'Vietnam', 'Southeastern Asia', 'Hanoi', 329560, 3444, 0, 'South China Sea', 3144, 'Fan Si Pan', '2-Sep-1945', 'Independence Day', '2-Sep', 84402966, '1.02', 70.85, 25.9, 28, 'tropical in south; monsoonal in north with hot, rainy season (May to September) and warm, dry season (October to March)', 'VM', '.vn', NULL, 'VND'), (86, 30, 'Peoples Republic of China', 'China', 'Eastern Asia', 'Beijing', 9596960, 14500, -154, 'Turpan Pendi', 8850, 'Mount Everest', '1-Oct-1949', 'Anniversary of the Founding of the Peoples Republic of China', '1-Oct', 1313973713, '.59', 72.58, 32.7, 489, 'extremely diverse; tropical in south to subarctic in north', 'CH', '.cn', NULL, 'CNY'), (90, 151, 'Republic of Turkey', 'Turkey', 'Southeastern Europe', 'Ankara', 780580, 7200, 0, 'Mediterranean Sea', 5166, 'Mount Ararat', '29-Oct-1923', 'Republic Day', '29-Oct', 70413958, '1.06', 72.62, 28.1, 120, 'temperate; hot, dry summers with mild, wet winters; harsher in interior', 'TU', '.tr', NULL, 'YTL'), (298, 154, 'Faroe Islands', NULL, 'Northern Europe', 'Torshavn', 1399, 1117, 0, 'Atlantic Ocean', 882, 'Slaettaratindur', NULL, 'Olaifest', '29-Jul', 47246, '.58', 79.35, 35, 1, 'mild winters, cool summers; usually overcast; foggy, windy', 'FO', '.fo', NULL, 'DKK'), (22, 155, 'Bailiwick of Guernsey', 'Guernsey', 'Western Europe', 'Saint Peter Port', 78, 50, 0, 'Atlantic Ocean', 114, 'unnamed location', NULL, 'Liberation Day', '9-May', 65409, '.26', 80.42, 41.3, 2, 'temperate with mild winters and cool summers; about 50% of days are overcast', 'GK', '.gg', NULL, 'GBP'), (30, 39, 'Hellenic Republic', 'Greece', 'Southern Europe', 'Athens', 131940, 13676, 0, 'Mediterranean Sea', 2917, 'Mount Olympus', '2-Jan-1905', 'Independence Day', '25-Mar', 10688058, '.18', 79.24, 40.8, 82, 'temperate; mild, wet winters; hot, dry summers', 'GR', '.gr', NULL, 'EUR'), (228, 11, 'Togolese Republic', 'Togo', 'Western Africa', 'Lome', 56785, 56, 0, 'Atlantic Ocean', 986, 'Mont Agou', '27-Apr-1960', 'Independence Day', '27-Apr', 5548702, '2.72', 57.42, 18.3, 9, 'tropical; hot, humid in south; semiarid in north', 'TO', '.tg', NULL, 'XOF'), (229, 11, 'Republic of Benin', 'Benin', 'Western Africa', 'Porto-Novo', 112620, 121, 0, 'Atlantic Ocean', 658, 'Mont Sokbaro', '1-Aug-1960', 'National Day', '1-Aug', 7862944, '2.73', 53.04, 17.6, 5, 'tropical; hot, humid in south; semiarid in north', 'BN', '.bj', NULL, 'XOF'), (267, 18, 'Republic of Botswana', 'Botswana', 'Southern Africa', 'Gaborone', 600370, 0, 513, 'junction of the Limpopo and Shashe Rivers', 1489, 'Tsodilo Hills', '30-Sep-1966', 'Independence Day', '30-Sep', 1639833, '-.04', 33.74, 19.4, 85, 'semiarid; warm winters and hot summers', 'BC', '.bw', NULL, 'BWP'), (66, 35, 'Kingdom of Thailand', 'Thailand', 'Southeastern Asia', 'Bangkok', 514000, 3219, 0, 'Gulf of Thailand', 2576, 'Doi Inthanon', '22-May-1903', 'Birthday of King PHUMIPHON', '5-Dec', 64631595, '.68', 72.25, 31.9, 108, 'tropical; rainy, warm, cloudy southwest monsoon (mid-May to September); dry, cool northeast monsoon (November to mid-March); southern isthmus always hot and humid', 'TH', '.th', NULL, 'THB'), (253, 14, 'Republic of Djibouti', 'Djibouti', 'Eastern Africa', 'Djibouti', 23000, 314, -155, 'Lac Assal', 2028, 'Moussa Ali', '27-Jun-1977', 'Independence Day', '27-Jun', 486530, '2.02', 43.17, 18.2, 13, 'desert; torrid, dry', 'DJ', '.dj', NULL, 'DJF'), (218, 15, 'Great Socialist Peoples Libyan Arab Jamahiriya', 'Libya', 'Northern Africa', 'Tripoli', 1759540, 1770, -47, 'Sabkhat Ghuzayyil', 2267, 'Bikku Bitti', '24-Dec-1951', 'Revolution Day', '1-Sep', 5900754, '2.3', 76.69, 23, 139, 'Mediterranean along coast; dry, extreme desert interior', 'LY', '.ly', NULL, 'LYD'), (40, 151, 'Romania', NULL, 'Southeastern Europe', 'Bucharest', 237500, 225, 0, 'Black Sea', 2544, 'Moldoveanu', '30-Dec-1947', 'Unification Day', '1-Dec', 22303552, '-.12', 71.63, 36.6, 61, 'temperate; cold, cloudy winters with frequent snow and fog; sunny summers with frequent showers and thunderstorms', 'RO', '.ro', NULL, 'RON'), (222, 15, 'Islamic Republic of Mauritania', 'Mauritania', 'Northern Africa', 'Nouakchott', 1030700, 754, -5, 'Sebkhet Te-n-Dghamcha', 915, 'Kediet Ijill', '28-Nov-1960', 'Independence Day', '28-Nov', 3177388, '2.88', 53.12, 17, 24, 'desert; constantly hot, dry, dusty', 'MR', '.mr', NULL, 'MRO'), (226, 11, 'Burkina Faso', NULL, 'Western Africa', 'Ouagadougou', 274200, 0, 200, 'Mouhoun River', 749, 'Tena Kourou', '5-Aug-1960', 'Republic Day', '11-Dec', 13902972, '3', 48.85, 16.5, 33, 'tropical; warm, dry winters; hot, wet summers', 'UV', '.bf', NULL, 'XOF'), (261, 18, 'Republic of Madagascar', 'Madagascar', 'Southern Africa', 'Antananarivo', 587040, 4828, 0, 'Indian Ocean', 2876, 'Maromokotro', '26-Jun-1960', 'Independence Day', '26-Jun', 18595469, '3.03', 57.34, 17.5, 116, 'tropical along coast, temperate inland, arid in south', 'MA', '.mg', NULL, 'MGA'), (224, 11, 'Republic of Guinea', 'Guinea', 'Western Africa', 'Conakry', 245857, 320, 0, 'Atlantic Ocean', 1752, 'Mont Nimba', '2-Oct-1958', 'Independence Day', '2-Oct', 9690222, '2.63', 49.5, 17.7, 16, 'generally hot and humid; monsoonal-type rainy season (June to November) with southwesterly winds; dry season (December to May) with northeasterly harmattan winds', 'GV', '.gn', NULL, 'GNF'), (234, 11, 'Federal Republic of Nigeria', 'Nigeria', 'Western Africa', 'Abuja', 923768, 853, 0, 'Atlantic Ocean', 2419, 'Chappal Waddi', '1-Oct-1960', 'Independence Day', '1-Oct', 131859731, '2.38', 47.08, 18.7, 70, 'varies; equatorial in south, tropical in center, arid in north', 'NI', '.ng', NULL, 'NGN'), (231, 11, 'Republic of Liberia', 'Liberia', 'Western Africa', 'Monrovia', 111370, 579, 0, 'Atlantic Ocean', 1380, 'Mount Wuteve', '26-Jul-1847', 'Independence Day', '26-Jul', 3042004, '4.91', 39.65, 18.1, 53, 'tropical; hot, humid; dry winters with hot days and cool to cold nights; wet, cloudy summers with frequent heavy showers', 'LI', '.lr', NULL, 'LRD'), (377, 155, 'Principality of Monaco', 'Monaco', 'Western Europe', 'Monaco', 2, 4, 0, 'Mediterranean Sea', 140, 'Mont Agel', '19-Nov-1903', 'National Day', '19-Nov', 32543, '.4', 79.69, 45.4, 0, 'Mediterranean with mild, wet winters and hot, dry summers', 'MN', '.mc', NULL, 'EUR'), (212, 15, 'Kingdom of Morocco', 'Morocco', 'Northern Africa', 'Rabat', 446550, 1835, -55, 'Sebkha Tah', 4165, 'Jebel Toubkal', '2-Mar-1956', 'Throne Day', '30-Jul', 33241259, '1.55', 70.94, 23.9, 60, 'Mediterranean, becoming more extreme in the interior', 'MO', '.ma', NULL, 'MAD'), (216, 15, 'Tunisian Republic', 'Tunisia', 'Northern Africa', 'Tunis', 163610, 1148, -17, 'Shatt al Gharsah', 1544, 'Jebel ech Chambi', '20-Mar-1956', 'Independence Day', '20-Mar', 10175014, '.99', 75.12, 27.8, 30, 'temperate in north with mild, rainy winters and hot, dry summers; desert in south', 'TS', '.tn', NULL, 'TND'), (232, 11, 'Republic of Sierra Leone', 'Sierra Leone', 'Western Africa', 'Freetown', 71740, 402, 0, 'Atlantic Ocean', 1948, 'Loma Mansa', '27-Apr-1961', 'Independence Day', '27-Apr', 6005250, '2.3', 40.22, 17.4, 10, 'tropical; hot, humid; summer rainy season (May to December); winter dry season (December to April)', 'SL', '.sl', NULL, 'SLL'), (233, 11, 'Republic of Ghana', 'Ghana', 'Western Africa', 'Accra', 239460, 539, 0, 'Atlantic Ocean', 880, 'Mount Afadjato', '6-Mar-1957', 'Independence Day', '6-Mar', 22409572, '2.07', 58.87, 19.9, 12, 'tropical; warm and comparatively dry along southeast coast; hot and humid in southwest; hot and dry in north', 'GH', NULL, NULL, 'GHC'), (235, 17, 'Republic of Chad', 'Chad', 'Central Africa', 'N Djamena', 1284000000, 0, 160, 'Djourab Depression', 3415, 'Emi Koussi', '11-Aug-1960', 'Independence Day', '11-Aug', 9944201, '2.93', 47.52, 16, 51, 'tropical in south, desert in north', 'CD', '.td', NULL, 'XAF'), (353, 155, 'Republic of Ireland', 'Ireland', 'Western Europe', 'Dublin', 70280, 1448, 0, 'Atlantic Ocean', 1041, 'Carrauntoohil', '6-Dec-1921', 'Saint Patricks Day', '17-Mar', 4062235, '1.15', 77.73, 34, 36, 'temperate maritime; modified by North Atlantic Current; mild winters, cool summers; consistently humid; overcast about half the time', 'EI', '.ie', NULL, 'EUR'), (220, 11, 'Republic of The Gambia', 'The Gambia', 'Western Africa', 'Banjul', 11300, 80, 0, 'Atlantic Ocean', 53, 'unnamed location', '18-Feb-1965', 'Independence Day', '18-Feb', 1641564, '2.84', 54.14, 17.7, 1, 'tropical; hot, rainy season (June to November); cooler, dry season (November to May)', 'GA', '.gm', NULL, 'GMD'), (221, 11, 'Republic of Senegal', 'Senegal', 'Western Africa', 'Dakar', 196190, 531, 0, 'Atlantic Ocean', 581, 'unnamed feature near Nepen Diakha', '4-Apr-1960', 'Independence Day', '4-Apr', 11987121, '2.34', 59.25, 19.1, 20, 'tropical; hot, humid; rainy season (May to November) has strong southeast winds; dry season (December to April) dominated by hot, dry, harmattan wind', 'SG', '.sn', NULL, 'XOF'), (225, 11, 'Republic of Cote d Ivoire', 'Cote d Ivoire', 'Western Africa', 'Yamoussoukro', 322460, 515, 0, 'Gulf of Guinea', 1752, 'Mont Nimba', '7-Aug-1960', 'Independence Day', '7-Aug', 17654843, '2.03', 48.82, 19.2, 35, 'tropical along coast, semiarid in far north; three seasons - warm and dry (November to March), hot and dry (March to May), hot and wet (June to October)', 'IV', '.ci', NULL, 'XOF');
INSERT INTO WF_COUNTRIES VALUES (358, 154, 'Republic of Finland', 'Finland', 'Northern Europe', 'Helsinki', 338145, 1250, 0, 'Baltic Sea', 1328, 'Haltiatunturi', '6-Dec-1917', 'Independence Day', '6-Dec', 5231372, '.14', 78.5, 41.3, 148, 'cold temperate; potentially subarctic but comparatively mild because of moderating influence of the North Atlantic Current, Baltic Sea, and more than 60,000 lakes', 'FI', '.fi', NULL, 'EUR'), (223, 11, 'Republic of Mali', 'Mali', 'Western Africa', 'Bamako', 1240000000, 0, 23, 'Senegal River', 1155, 'Hombori Tondo', '22-Sep-2001', 'Independence Day', '22-Sep', 11716829, '2.63', 49, 15.8, 28, 'subtropical to arid; hot and dry (February to June); rainy, humid, and mild (June to November); cool and dry (November to February)', 'ML', '.ml', NULL, 'XOF'), (374, 145, 'Republic of Armenia', 'Armenia', 'Southwestern Asia', 'Yerevan', 29800, 0, 400, 'Debed River', 4090, 'Aragats Lerrnagagat', '21-Sep-1991', 'Independence Day', '21-Sep', 2976372, '-.19', 71.84, 30.4, 16, 'highland continental, hot summers, cold winters', 'AM', '.am', NULL, 'AMD'), (227, 11, 'Republic of Niger', 'Niger', 'Western Africa', 'Niamey', 1267000000, 0, 200, 'Niger River', 2022, 'Mont Bagzane', '3-Aug-1960', 'Republic Day', '18-Dec', 12525094, '2.92', 43.76, 16.5, 27, 'desert; mostly hot, dry, dusty; tropical in extreme south', 'NG', '.ne', NULL, 'XOF'), (249, 15, 'Republic of the Sudan', 'Sudan', 'Northern Africa', 'Khartoum', 2505810, 853, 0, 'Red Sea', 3187, 'Kinyeti', '1-Jan-1956', 'Independence Day', '1-Jan', 41236378, '2.55', 58.92, 18.3, 86, 'tropical in south; arid desert in north; rainy season varies by region (April to November)', 'SU', '.sd', NULL, 'SDD'), (352, 155, 'Grand Duchy of Luxembourg', 'Luxembourg', 'Western Europe', 'Luxembourg', 2586, 0, 133, 'Moselle River', 559, 'Buurgplaatz', '12-Jan-1905', 'National Day', '23-Jun', 474413, '1.23', 78.89, 38.7, 2, 'modified continental with mild winters, cool summers', 'LU', '.lu', NULL, 'EUR'), (252, 14, 'Somalia', NULL, 'Eastern Africa', 'Mogadishu', 637657, 3025, 0, 'Indian Ocean', 2416, 'Shimbiris', '1-Jul-1960', 'Foundation of the Somali Republic', '1-Jul', 8863338, '2.85', 48.47, 17.6, 64, 'principally desert; northeast monsoon (December to February), moderate temperatures in north and very hot in south; southwest monsoon (May to October), torrid in the north and hot in the south, irregular rainfall, hot and humid periods (tangambili) between monsoons', 'SO', '.so', NULL, 'SOS'), (507, 13, 'Republic of Panama', 'Panama', 'Central America', 'Panama', 78200, 2490, 0, 'Pacific Ocean', 3475, 'Volcan de Chiriqui', '3-Nov-1903', 'Independence Day', '3-Nov', 3191319, '1.6', 75.22, 26.1, 109, 'tropical maritime; hot, humid, cloudy; prolonged rainy season (May to January), short dry season (January to May)', 'PM', '.pa', NULL, 'PAB'), (597, 5, 'Republic of Suriname', 'Suriname', 'South America', 'Paramaribo', 163270, 386, -2, 'unnamed location', 1230, 'Juliana Top', '25-Nov-1975', 'Independence Day', '25-Nov', 439117, '.2', 69.01, 26.5, 47, 'tropical; moderated by trade winds', 'NS', '.sr', NULL, 'SRD'), (674, 9, 'Republic of Nauru', 'Nauru', 'Oceania', 'no official capital', 21, 30, 0, 'Pacific Ocean', 61, 'unnamed location', '31-Jan-1968', 'Independence Day', '31-Jan', 13287, '1.81', 63.08, 20.6, 1, 'tropical with a monsoonal pattern; rainy season (November to February)', 'NR', '.nr', NULL, 'AUD'), (242, 11, 'Republic of the Congo', 'Congo', 'Western Africa', 'Brazzaville', 342000, 169, 0, 'Atlantic Ocean', 903, 'Mount Berongou', '15-Aug-1960', 'Independence Day', '15-Aug', 3702314, '2.6', 52.8, 16.6, 32, 'tropical; rainy season (March to June); dry season (June to October); persistent high temperatures and humidity; particularly enervating climate astride the Equator', 'CF', '.cg', NULL, 'XAF'), (380, 151, 'Ukraine', NULL, 'Eastern Europe', 'Kiev', 603700, 2782, 0, 'Black Sea', 2061, 'Hora Hoverla', '24-Aug-1991', 'Independence Day', '24-Aug', 46710816, '-.6', 69.98, 39.2, 537, 'temperate continental; Mediterranean only on the southern Crimean coast; precipitation disproportionately distributed, highest in west and north, lesser in east and southeast; winters vary from cool along the Black Sea to cold farther inland; summers are warm across the greater part of the country, hot in the south', 'UP', '.ua', NULL, 'UAH'), (420, 151, 'Czech Republic', 'Czech Republic', 'Central Europe', 'Prague', 78866, 0, 115, 'Elbe River', 1602, 'Snezka', '1-Jan-1993', 'Czech Founding Day', '28-Oct', 10235455, '-.06', 76.22, 39.3, 121, 'temperate; cool summers; cold, cloudy, humid winters', 'EZ', '.cz', NULL, 'CZK'), (504, 13, 'Republic of Honduras', 'Honduras', 'Central America', 'Tegucigalpa', 112090, 820, 0, 'Caribbean Sea', 2870, 'Cerro Las Minas', '15-Sep-1821', 'Independence Day', '15-Sep', 7326496, '2.16', 69.33, 19.5, 116, 'subtropical in lowlands, temperate in mountains', 'HO', '.hn', NULL, 'HNL'), (963, 145, 'Syrian Arab Republic', 'Syria', 'Middle East', 'Damascus', 185180, 193, -200, 'unnamed location near Lake Tiberias', 2814, 'Mount Hermon', '17-Apr-1946', 'Independence Day', '17-Apr', 18881361, '2.3', 70.32, 20.7, 92, 'mostly desert; hot, dry, sunny summers (June to August) and mild, rainy winters (December to February) along coast; cold weather with snow or sleet periodically in Damascus', 'SY', '.sy', NULL, 'SYP'), (237, 11, 'Republic of Cameroon', 'Cameroon', 'Western Africa', 'Yaounde', 475440, 402, 0, 'Atlantic Ocean', 4095, 'Fako', '1-Jan-1960', 'Republic Day', '20-May', 17340702, '2.04', 51.16, 18.9, 47, 'varies with terrain, from tropical along coast to semiarid and hot in north', 'CM', '.cm', NULL, 'XAF'), (1242, 29, 'Commonwealth of The Bahamas', 'The Bahamas', 'Caribbean', 'Nassau', 13940, 3542, 0, 'Atlantic Ocean', 63, 'Mount Alvernia, on Cat Island', '10-Jul-1973', 'Independence Day', '10-Jul', 303770, '.64', 65.6, 27.8, 64, 'tropical marine; moderated by warm waters of Gulf Stream', 'BF', '.bs', NULL, 'BSD'), (1787, 29, 'Commonwealth of Puerto Rico', 'Puerto Rico', 'Caribbean', 'San Juan', 13790, 501, 0, 'Caribbean Sea', 1339, 'Cerro de Punta', NULL, 'US Independence Day', '4-Jul', 3927188, '.4', 78.4, 34.7, 30, 'tropical marine, mild; little seasonal temperature variation', 'RQ', '.pr', NULL, 'USD'), (886, 30, 'Taiwan', NULL, 'Eastern Asia', 'Taipei', 35980, 1566, 0, 'South China Sea', 3952, 'Yu Shan', NULL, 'Republic Day', '10-Oct', 23036087, '.61', 77.43, 34.6, 42, 'tropical; marine; rainy season during southwest monsoon (June to August); cloudiness is persistent and extensive all year', 'TW', '.tw', NULL, 'TWD'), (960, 34, 'Republic of Maldives', 'Maldives', 'Southern Asia', 'Male', 300, 644, 0, 'Indian Ocean', 2, 'unnamed location', '26-Jul-1965', 'Independence Day', '26-Jul', 359008, '2.78', 64.41, 17.9, 5, 'tropical; hot, humid; dry, northeast monsoon (November to March); rainy, southwest monsoon (June to August)', 'MV', '.mv', NULL, 'MVR'), (962, 145, 'Hashemite Kingdom of Jordan', 'Jordan', 'Middle East', 'Amman', 92300, 26, -408, 'Dead Sea', 1734, 'Jabal Ram', '25-May-1946', 'Independence Day', '25-May', 5906760, '2.49', 78.4, 23, 17, 'mostly arid desert; rainy season in west (November to April)', 'JO', '.jo', NULL, 'JOD'), (359, 39, 'Republic of Bulgaria', 'Bulgaria', 'Southeastern Europe', 'Sofia', 110910, 354, 0, 'Black Sea', 2925, 'Musala', '3-Mar-1878', 'Liberation Day', '3-Mar', 7385367, '-.86', 72.3, 40.8, 213, 'temperate; cold, damp winters; hot, dry summers', 'BU', '.bg', NULL, 'BGL'), (370, 151, 'Republic of Lithuania', 'Lithuania', 'Eastern Europe', 'Vilnius', 65200, 90, 0, 'Baltic Sea', 294, 'Juozapines Kalnas', '6-Sep-1991', 'Independence Day', '11-Mar', 3585906, '-.3', 74.2, 38.2, 95, 'transitional, between maritime and continental; wet, moderate winters and summers', 'LH', '.lt', NULL, 'LTL'), (371, 151, 'Republic of Latvia', 'Latvia', 'Eastern Europe', 'Riga', 64589, 531, 0, 'Baltic Sea', 312, 'Gaizinkalns', '21-Aug-1991', 'Independence Day', '18-Nov', 2274735, '-.67', 71.33, 39.4, 47, 'maritime; wet, moderate winters', 'LG', '.lv', NULL, 'LVL'), (1868, 29, 'Republic of Trinidad and Tobago', 'Trinidad and Tobago', 'Caribbean', 'Port-of-Spain', 5128, 362, 0, 'Caribbean Sea', 940, 'El Cerro del Aripo', '31-Aug-1962', 'Independence Day', '31-Aug', 1065842, '-.87', 66.76, 31.2, 6, 'tropical; rainy season (June to December)', 'TD', '.tt', NULL, 'TTD'), (685, 9, 'Independent State of Samoa', 'Samoa', 'Oceania', 'Apia', 2944, 403, 0, 'Pacific Ocean', 1857, 'Mauga Silisili', '1-Jan-1962', 'Independence Day Celebration', '1-Jun', 176908, '-.2', 71, 25.2, 4, 'tropical; rainy season (November to April), dry season (May to October)', 'WS', '.ws', NULL, 'SAT'), (594, 5, 'Department of Guiana', 'French Guiana', 'Northern South America', 'Cayenne', 91000, 378, 0, 'Atlantic Ocean', 851, 'Bellevue de lInini', NULL, 'Bastille Day', '14-Jul', 199509, '1.96', 77.27, 28.6, 11, 'tropical; hot, humid; little seasonal temperature variation', 'FG', '.gf', NULL, 'EUR'), (965, 145, 'State of Kuwait', 'Kuwait', 'Middle East', 'Kuwait', 17820, 499, 0, 'Persian Gulf', 306, 'unnamed location', '19-Jun-1961', 'National Day', '25-Feb', 2418393, '3.52', 77.2, 25.9, 7, 'dry desert; intensely hot summers; short, cool winters', 'KU', '.kw', NULL, 'KD'), (880, 34, 'Peoples Republic of Bangladesh', 'Bangladesh', 'Southern Asia', 'Dhaka', 144000, 580, 0, 'Indian Ocean', 1230, 'Keokradong', '16-Dec-1971', 'Independence Day', '26-Mar', 147365352, '2.09', 62.46, 22.2, 16, 'tropical; mild winter (October to March); hot, humid summer (March to June); humid, warm rainy monsoon (June to October)', 'BG', '.bd', NULL, 'BDT'), (354, 154, 'Republic of Iceland', 'Iceland', 'Northern Europe', 'Reykjavik', 103000, 4970, 0, 'Atlantic Ocean', 2110, 'Hvannadalshnukur', '1-Dec-1918', 'Independence Day', '17-Jun', 299388, '.87', 80.31, 34.2, 97, 'temperate; moderated by North Atlantic Current; mild, windy winters; damp, cool summers', 'IC', '.is', NULL, 'ISK'), (241, 11, 'Gabonese Republic', 'Gabon', 'Western Africa', 'Libreville', 267667, 885, 0, 'Atlantic Ocean', 1575, 'Mont Iboundji', '17-Aug-1960', 'Founding of the Gabonese Democratic Party', '12-Mar', 1424906, '2.13', 54.49, 18.6, 56, 'tropical; always hot, humid', 'GB', '.ga', NULL, 'XAF'), (687, 9, 'Territory of New Caledonia and Dependencies', 'New Caledonia', 'Oceania', 'Noumea', 19060, 2254, 0, 'Pacific Ocean', 1628, 'Mont Panie', NULL, 'Bastille Day', '14-Jul', 219246, '1.24', 74.27, 27.8, 25, 'tropical; modified by southeast trade winds; hot, humid', 'NC', '.nc', NULL, 'XPF'), (974, 145, 'State of Qatar', 'Qatar', 'Middle East', 'Doha', 11437, 563, 0, 'Persian Gulf', 103, 'Qurayn Abu al Bawl', '3-Sep-1971', 'Independence Day', '3-Sep', 885359, '2.5', 73.9, 31.7, 5, 'arid; mild, pleasant winters; very hot, humid summers', 'QA', '.qa', NULL, 'QAR'), (971, 145, 'United Arab Emirates', 'Al Imarat al Arabiyah al Muttahidah', 'Middle East', 'Abu Dhabi', 82880, 1318, 0, 'Persian Gulf', 1527, 'Jabal Yibir', '2-Dec-1971', 'Independence Day', '2-Dec', 2602713, '1.52', 75.44, 28.1, 35, 'desert', 'AE', '.ae', NULL, 'AED'), (972, 145, 'State of Israel', 'Israel', 'Middle East', 'Jerusalem', 20770, 273, -408, 'Dead Sea', 1208, 'Har Meron', '14-May-1948', 'Independence Day', '14-May', 6352117, '1.18', 79.46, 29.6, 51, 'temperate; hot and dry in southern and eastern desert areas', 'IS', '.il', NULL, 'ILS'), (973, 145, 'Kingdom of Bahrain', 'Bahrain', 'Middle East', 'Manama', 665, 161, 0, 'Persian Gulf', 122, 'Jabal ad Dukhan', '15-Aug-1971', 'National Day', '16-Dec', 698585, '1.45', 74.45, 29.4, 3, 'arid; mild, pleasant winters; very hot, humid summers', 'BA', '.bh', NULL, 'BHD'), (372, 151, 'Republic of Estonia', 'Estonia', 'Eastern Europe', 'Tallinn', 45226, 3794, 0, 'Baltic Sea', 318, 'Suur Munamagi', '20-Aug-1991', 'Independence Day', '20-Aug', 1324333, '-.64', 72.04, 39.3, 26, 'maritime, wet, moderate winters, cool summers', 'EN', '.ee', NULL, 'EEK'), (856, 35, 'Lao Peoples Democratic Republic', 'Laos', 'Southeastern Asia', 'Vientiane', 236800, 0, 70, 'Mekong River', 2817, 'Phou Bia', '19-Jul-1949', 'Republic Day', '2-Dec', 6368481, '2.39', 55.49, 18.9, 44, 'tropical monsoon; rainy season (May to November); dry season (December to April)', 'LA', '.la', NULL, 'LAK'), (680, 9, 'Republic of Palau', 'Palau', 'Oceania', 'Koror', 458, 1519, 0, 'Pacific Ocean', 242, 'Mount Ngerchelchuus', '1-Oct-1994', 'Constitution Day', '9-Jul', 20579, '1.31', 70.42, 31.7, 3, 'tropical; hot and humid; wet season May to November', 'PS', '.pw', NULL, 'USD'), (967, 145, 'Republic of Yemen', 'Yemen', 'Middle East', 'Sanaa', 527970, 1906, 0, 'Arabian Sea', 3760, 'Jabal an Nabi Shu ayb', '22-May-1990', 'Unification Day', '22-May', 21456188, '3.46', 62.12, 16.6, 45, 'mostly desert; hot and humid along west coast; temperate in western mountains affected by seasonal monsoon; extraordinarily hot, dry, harsh desert in east', 'YM', '.ye', NULL, 'YER');
COMMIT;

-- ----------------------------
-- Table structure for WF_CURRENCIES
-- ----------------------------
DROP TABLE IF EXISTS WF_CURRENCIES;
CREATE TABLE WF_CURRENCIES  (
  CURRENCY_CODE varchar(7) NOT NULL,
  CURRENCY_NAME varchar(40) NOT NULL,
  COMMENTS varchar(150) NULL,
  PRIMARY KEY (CURRENCY_CODE)
);

-- ----------------------------
-- Records of WF_CURRENCIES
-- ----------------------------
BEGIN;
INSERT INTO WF_CURRENCIES VALUES ('AED', 'Emirati dirham', NULL), ('AFA', 'Afghani', NULL), ('ALL', 'Lek', NULL), ('AMD', 'Dram', NULL), ('ANG', 'Netherlands Antillean guilder', NULL), ('AOA', 'Kwanza', NULL), ('ARS', 'Argentine peso', NULL), ('AUD', 'Australian dollar', NULL), ('AWG', 'Aruban guilder', NULL), ('AZM', 'Azerbaijani Manat', NULL), ('BAM', 'Marka', NULL), ('BBD', 'Barbadian dollar', NULL), ('BDT', 'Taka', NULL), ('BGL', 'Lev', NULL), ('BIF', 'Burundi franc', NULL), ('BMD', 'Bermudian dollar', NULL), ('BND', 'Bruneian dollar', NULL), ('BOB', 'Boliviano', NULL), ('BRL', 'Real', NULL), ('BSD', 'Bahamian dollar', NULL), ('BTN', 'Ngultrum', NULL), ('BWP', 'Pula', NULL), ('BYB', 'Belarusian ruble', NULL), ('BZD', 'Belizean dollar', NULL), ('CAD', 'Canadian dollar', NULL), ('CDF', 'Congolese franc', NULL), ('CHF', 'Swiss franc', NULL), ('CLP', 'Chilean peso', NULL), ('CNY', 'yuan', NULL), ('COP', 'Colombian peso', NULL), ('CRC', 'Costa Rican colon', NULL), ('CUC', 'Convertible peso', NULL), ('CUP', 'Cuban peso', NULL), ('CVE', 'Cape Verdean escudo', NULL), ('CYP', 'Cypriot pound', NULL), ('CZK', 'Czech koruna', NULL), ('DJF', 'Djiboutian franc', NULL), ('DKK', 'Danish krone', NULL), ('DOP', 'Dominican peso', NULL), ('DZD', 'Algerian dinar', NULL), ('EEK', 'Estonian kroon', NULL), ('EGP', 'Egyptian pound', NULL), ('ERN', 'nakfa', NULL), ('ETB', 'birr', NULL), ('EUR', 'Euro', NULL), ('FJD', 'Fijian dollar', NULL), ('FKP', 'Falkland pound', NULL), ('GBP', 'British pound', NULL), ('GEL', 'lari', NULL), ('GHC', 'cedi', NULL), ('GIP', 'Gibraltar pound', NULL), ('GMD', 'dalasi', NULL), ('GNF', 'Guinean franc', NULL), ('GTQ', 'quetzal', NULL), ('GYD', 'Guyanese dollar', NULL), ('HKD', 'Hong Kong dollar', NULL), ('HNL', 'lempira', NULL), ('HRK', 'kuna', NULL), ('HTG', 'gourde', NULL), ('HUF', 'forint', NULL), ('IDR', 'Indonesian rupiah', NULL), ('ILS', 'new Israeli shekel', NULL), ('INR', 'Indian rupee', NULL), ('IRR', 'Iranian rial', NULL), ('ISK', 'Icelandic krona', NULL), ('JMD', 'Jamaican dollar', NULL), ('JOD', 'Jordanian dollar', NULL), ('JPY', 'yen', NULL), ('KD', 'Kuwaiti dinar', NULL), ('KES', 'Kenyan shilling', NULL), ('KHR', 'riel', NULL), ('KMF', 'Comoran franc', NULL), ('KPW', 'North Korean won', NULL), ('KRW', 'South Korean won', NULL), ('KYD', 'Caymanian dollar', NULL), ('KZT', 'tenge', NULL), ('LAK', 'kip', NULL), ('LBP', 'Lebanese pound', NULL), ('LKR', 'Sri Lankan rupee', NULL), ('LRD', 'Liberian dollar', NULL), ('LSL', 'loti', NULL), ('LTL', 'litas', NULL), ('LVL', 'Latvian lat', NULL), ('LYD', 'Libyan dinar', NULL), ('MAD', 'Moroccan dirham', NULL), ('MDL', 'Moldovan leu', NULL), ('MGA', 'Madagascar ariary', NULL), ('MKD', 'Macedonian denar', NULL), ('MMK', 'Kyat', NULL), ('MNT', 'togrog/tugrik', NULL), ('MOP', 'pataca', NULL), ('MRO', 'ouguiya', NULL), ('MTL', 'Maltese lira', NULL), ('MUR', 'Mauritian rupee', NULL), ('MVR', 'rufiyaa', NULL), ('MWK', 'Malawian kwacha', NULL), ('MXN', 'Mexican peso', NULL), ('MYR', 'ringgit', NULL), ('MZM', 'metical', NULL), ('NAD', 'Namibian dollar', NULL), ('NGN', 'naira', NULL), ('NID', 'New Iraqi dinar', NULL), ('NOK', 'Norwegian krone', NULL), ('NONE', 'No currency used', NULL), ('NPR', 'Nepalese rupee', NULL), ('NZD', 'New Zealand dollar', NULL), ('PAB', 'balboa', NULL), ('PEN', 'nuevo sol', NULL), ('PGK', 'kina', NULL), ('PKR', 'Pakistani rupee', NULL), ('PLN', 'zloty', NULL), ('PYG', 'guarani', NULL), ('QAR', 'Qatari rial', NULL), ('RMB', 'Renminbi', NULL), ('RUR', 'Russian ruble', NULL), ('SAR', 'Saudi riyal', NULL), ('SAT', 'tala', NULL), ('SBD', 'Solomon Islands dollar', NULL), ('SCR', 'Seychelles rupee', NULL), ('SEK', 'Swedish krona', NULL), ('SGD', 'Singapore dollar', NULL), ('SHP', 'Saint Helenian pound', NULL), ('SIT', 'tolar', NULL), ('SLL', 'leone', NULL), ('SOS', 'Somali shilling', NULL), ('SRD', 'Surinam dollar', NULL), ('STD', 'dobra', NULL), ('SZL', 'lilangeni', NULL), ('THB', 'baht', NULL), ('TMM', 'Turkmen manat', NULL), ('TND', 'Tunisian dinar', NULL), ('TTD', 'Trinidad and Tobago dollar', NULL), ('TWD', 'new Taiwan dollar', NULL), ('UAH', 'hryvnia', NULL), ('UGX', 'Ugandan shilling', NULL), ('USD', 'US Dollar', NULL), ('UYU', 'Uruguayan peso', NULL), ('UZS', 'Uzbekistani soum', NULL), ('VEB', 'bolivar', NULL), ('VND', 'dong', NULL), ('VUV', 'vatu', NULL), ('XAF', 'Communaute Financiere Africaine franc', NULL), ('XCD', 'East Caribbean dollar', NULL), ('XOF', 'Communaute Financiere Africaine franc', NULL), ('XPF', 'Comptoirs Francais du Pacifique franc', NULL), ('YER', 'Yemeni rial', NULL), ('YTL', 'Turkish lira', NULL), ('ZAR', 'South African rand', NULL), ('ZMK', 'Zambian kwacha', NULL), ('ZWD', 'Zimbabwean dollar', NULL), ('NIO', 'gold cordoba', NULL), ('OMR', 'Omani rial', NULL), ('PHP', 'Philippine peso', NULL), ('RON', 'leu', NULL), ('RWF', 'Rwandan franc', NULL), ('SDD', 'Sudanese dinar', NULL), ('SKK', 'Slovak koruna', NULL), ('SYP', 'Syrian pound', NULL), ('TOP', 'paanga', NULL), ('TZS', 'Tanzanian shilling', NULL), ('TJS', 'Tajikistani somoni', NULL), ('BHD', 'Bahraini Dinar', NULL);
COMMIT;

-- ----------------------------
-- Table structure for WF_LANGUAGES
-- ----------------------------
DROP TABLE IF EXISTS WF_LANGUAGES;
CREATE TABLE WF_LANGUAGES  (
  LANGUAGE_ID INTEGER NOT NULL,
  LANGUAGE_NAME varchar(50) NOT NULL,
  PRIMARY KEY (LANGUAGE_ID)
);

-- ----------------------------
-- Records of WF_LANGUAGES
-- ----------------------------
BEGIN;
INSERT INTO WF_LANGUAGES VALUES (0, 'N/A'), (20, 'Afar'), (30, 'Afrikaans'), (40, 'Albanian'), (50, 'Amerindian'), (60, 'Amharic'), (70, 'Angaur'), (80, 'Arabic'), (90, 'Armenian'), (100, 'Assyrian'), (101, 'Aymara'), (102, 'Azen'), (103, 'Azerbaijani'), (104, 'Bahasa Indonesia'), (105, 'Bahasa Melayu'), (106, 'Balochi'), (107, 'Bambara'), (108, 'Bandjabi'), (109, 'Bangla'), (110, 'Bantu'), (120, 'Bapounou'), (130, 'Belarusian'), (140, 'Bhojpuri'), (150, 'Bislama'), (160, 'Bokmal Norwegian'), (170, 'Bosnian'), (180, 'Bulgarian'), (190, 'Burmese'), (200, 'Cantonese'), (210, 'Castilian'), (220, 'Castilian Spanish'), (230, 'Catalan'), (240, 'Chamorro'), (250, 'Chichwea'), (260, 'Chilomwe'), (270, 'Chinese'), (280, 'Chinyanja'), (290, 'Chisena'), (300, 'Chitonga'), (310, 'Chitumbuka'), (320, 'Chiyao'), (330, 'Cisena'), (340, 'Creole'), (350, 'Crioulo'), (360, 'Croatian'), (370, 'Czech'), (380, 'Dagomba'), (390, 'Danish'), (400, 'Djerma'), (410, 'Dutch'), (420, 'Dzongkha'), (430, 'Echuwabo'), (440, 'Elomwe'), (450, 'Emakhuwa'), (460, 'English'), (470, 'Estonian'), (480, 'Ewe'), (490, 'Fang'), (500, 'Faroese'), (510, 'Farsi'), (520, 'Fijian'), (530, 'Filipino'), (540, 'Finnish'), (550, 'Fon and Yoruba'), (560, 'French'), (570, 'Frisian'), (580, 'Fula'), (590, 'Futunian'), (600, 'Fuzhou'), (610, 'Gagauz'), (620, 'Galician'), (630, 'Gan'), (640, 'Garifuna'), (650, 'Georgian'), (660, 'German'), (670, 'Greek'), (680, 'Greenlandic'), (690, 'Guaragigna'), (700, 'Guavani'), (710, 'Hassaniya'), (720, 'Hausa'), (730, 'Hebrew'), (740, 'Hindi'), (750, 'Hindustani'), (760, 'Hokkien'), (770, 'Hungarian'), (780, 'Icelandic'), (790, 'Igbo'), (800, 'I-Kiribati'), (810, 'Indonesian'), (820, 'Irish'), (830, 'IsiXhosa'), (840, 'IsiZulu'), (850, 'Italian'), (860, 'Japanese'), (870, 'Jola'), (880, 'Kabye'), (890, 'Kalanga'), (900, 'Kazakh'), (910, 'Khalkha Mongol'), (920, 'Khmer'), (930, 'Kikongo'), (940, 'kingwana'), (950, 'Kinyarwanda'), (960, 'Kirundi'), (970, 'Kiswahili'), (980, 'Korean'), (990, 'Kunama'), (1000, 'Kurdish'), (1100, 'Kyrgyz'), (1110, 'Lao'), (1120, 'Latin'), (1130, 'Latvian'), (1140, 'Lingala'), (1150, 'Lithuanian'), (1160, 'Luri'), (1170, 'Luxembourgish'), (1180, 'Macedonian'), (1190, 'Magar'), (1200, 'Mahorian'), (1210, 'Maithali'), (1220, 'Malagasy'), (1230, 'Malay'), (1240, 'Malayalam'), (1250, 'Maldivian'), (1260, 'Maltese'), (1270, 'Mandarin'), (1280, 'Mandarin Chinese'), (1290, 'Mandinka'), (1300, 'Manx Gaelic'), (1310, 'Maori'), (1320, 'Marshallese'), (1330, 'Mayan'), (1340, 'Melanesian'), (1350, 'Mina'), (1360, 'Minnan'), (1370, 'Mirandese'), (1390, 'Monegasque'), (1400, 'Motu'), (1420, 'Nahua'), (1440, 'Nepali'), (1450, 'Newar'), (1470, 'Nubian'), (1480, 'Nynorsk Norwegian'), (1500, 'Oromigna'), (1520, 'Panjabi'), (1530, 'Papiamento'), (1540, 'Pashtu'), (1560, 'Polish'), (1570, 'Polynesian'), (1590, 'Pulaar'), (1600, 'Punjabi'), (1610, 'Quechua'), (1630, 'Romani'), (1650, 'Russian'), (1660, 'Samoan'), (1680, 'Sara'), (1690, 'Sekgalagadi'), (1710, 'Serbian'), (1730, 'Setswana'), (1740, 'Shanghaiese'), (1760, 'Sindhi'), (1770, 'Sinhala'), (1780, 'Siswati'), (1800, 'Slovak'), (1820, 'Slovenian'), (1830, 'Somali'), (1850, 'Spanish'), (1860, 'Swahili'), (1880, 'Taiwanese'), (1890, 'Tajik'), (1910, 'Tamil'), (1920, 'Telugu'), (1940, 'Tetum'), (1950, 'Thai'), (1970, 'Tigre'), (1990, 'Tobi'), (2000, 'Tokelauan'), (2150, 'Tshiluba'), (2200, 'Turkic'), (2300, 'Turkmen'), (2350, 'Ukrainian'), (2400, 'Urdu'), (2450, 'Uzbek'), (2500, 'Vietnamese'), (2550, 'Wallisian'), (2600, 'Welsh'), (2650, 'Wolof'), (2700, 'Xhosa'), (2750, 'Xiang'), (2800, 'Xichangana'), (2850, 'Yezidi'), (2900, 'Yoruba'), (3000, 'Zulu'), (1380, 'Moldovan'), (1410, 'Myene'), (1430, 'Nauruan'), (1460, 'Niuean'), (1490, 'Nzebi'), (1510, 'Palauian'), (1550, 'Persian'), (1580, 'Portuguese'), (1620, 'Roma'), (1640, 'Romanian'), (1670, 'Sangho'), (1700, 'Sepedi'), (1720, 'Sesotho'), (1750, 'Shikomoro'), (1790, 'Slavic'), (1810, 'Slovene'), (1840, 'Soninke'), (1870, 'Swedish'), (1900, 'Tamang'), (1930, 'Teochew'), (1960, 'Tharu'), (1980, 'Tigrinya'), (2100, 'Tongan'), (2250, 'Turkish');
COMMIT;

-- ----------------------------
-- Table structure for WF_SPOKEN_LANGUAGES
-- ----------------------------
DROP TABLE IF EXISTS WF_SPOKEN_LANGUAGES;
CREATE TABLE WF_SPOKEN_LANGUAGES  (
  COUNTRY_ID INTEGER NOT NULL,
  LANGUAGE_ID INTEGER NOT NULL,
  OFFICIAL varchar(2) NULL,
  COMMENTS text NULL,
  PRIMARY KEY (COUNTRY_ID, LANGUAGE_ID),
  CONSTRAINT WF_CTRY_NUM_FK1 FOREIGN KEY (COUNTRY_ID) REFERENCES WF_COUNTRIES (COUNTRY_ID),
  CONSTRAINT WF_LANG_ID_FK FOREIGN KEY (LANGUAGE_ID) REFERENCES WF_LANGUAGES (LANGUAGE_ID)
);

-- ----------------------------
-- Records of WF_SPOKEN_LANGUAGES
-- ----------------------------
BEGIN;
INSERT INTO WF_SPOKEN_LANGUAGES VALUES (39, 1810, 'N', 'Slovene-speaking minority in the Trieste-Gorizia area'), (225, 560, 'Y', NULL), (964, 80, 'N', NULL), (964, 1000, 'QY', 'official in Kurdish regions'), (964, 100, 'N', NULL), (964, 90, 'N', NULL), (81, 860, 'Y', NULL), (203, 460, 'Y', NULL), (203, 1580, 'N', NULL), (204, 0, 'N', NULL), (962, 80, 'Y', NULL), (205, 0, 'N', NULL), (254, 460, 'Y', NULL), (254, 970, 'Y', NULL), (996, 1100, 'Y', NULL), (996, 1650, 'Y', NULL), (850, 980, 'Y', NULL), (686, 800, 'N', NULL), (686, 460, 'Y', NULL), (82, 980, 'Y', NULL), (82, 460, 'N', 'English widely taught in junior high and high school'), (618, 460, 'Y', NULL), (618, 270, 'N', NULL), (618, 1230, 'N', NULL), (965, 80, 'Y', NULL), (965, 460, 'N', NULL), (3, 900, 'QY', 'Qazaq, state language'), (3, 1650, 'Y', NULL), (856, 1110, 'Y', NULL), (856, 560, 'N', NULL), (856, 460, 'N', NULL), (961, 80, 'Y', NULL), (961, 560, 'N', NULL), (961, 460, 'N', NULL), (961, 90, 'N', NULL), (371, 1130, 'Y', NULL), (371, 1650, 'N', NULL), (371, 1150, 'N', NULL), (370, 1150, 'Y', NULL), (370, 1650, 'N', NULL), (370, 1560, 'N', NULL), (231, 460, 'Y', NULL), (421, 1800, 'Y', NULL), (421, 770, 'N', NULL), (421, 1620, 'N', NULL), (421, 2350, 'N', NULL), (423, 660, 'Y', NULL), (266, 1720, 'N', NULL), (266, 460, 'Y', NULL), (266, 3000, 'N', NULL), (266, 2700, 'N', NULL), (352, 1170, 'Y', NULL), (352, 660, 'QY', 'administrative language'), (352, 560, 'QY', 'administrative language'), (218, 80, 'N', NULL), (218, 850, 'N', NULL), (218, 460, 'N', NULL), (261, 560, 'Y', NULL), (261, 1220, 'Y', NULL), (596, 560, 'N', NULL), (596, 340, 'N', NULL), (853, 200, 'N', NULL), (853, 1270, 'N', NULL), (853, 760, 'N', NULL), (373, 1380, 'Y', 'virtually the same as the Romanian language'), (373, 1650, 'N', NULL), (373, 610, 'N', NULL), (270, 1200, 'N', NULL), (270, 560, 'Y', NULL), (976, 910, 'N', NULL), (976, 220, 'N', NULL), (976, 1650, 'N', NULL), (1664, 460, 'Y', NULL), (265, 250, 'Y', NULL), (265, 280, 'N', NULL), (265, 320, 'N', NULL), (265, 310, 'N', NULL), (265, 290, 'N', NULL), (265, 260, 'N', NULL), (265, 300, 'N', NULL), (381, 1710, 'Y', NULL), (389, 1180, 'N', NULL), (389, 40, 'N', NULL), (389, 2250, 'N', NULL), (389, 1620, 'N', NULL), (389, 1710, 'Y', NULL), (223, 560, 'Y', NULL), (223, 107, 'N', NULL), (377, 560, 'Y', NULL), (377, 460, 'N', NULL), (377, 850, 'N', NULL), (377, 1390, 'N', NULL), (212, 80, 'Y', NULL), (212, 560, 'QY', 'French often the language of business, government, and diplomacy'), (230, 340, 'N', NULL), (230, 140, 'N', NULL), (230, 560, 'N', NULL), (230, 460, 'Y', 'official; spoken by less than 1% of the population'), (222, 80, 'Y', NULL), (222, 1590, 'N', NULL), (222, 1840, 'N', NULL), (222, 560, 'N', NULL), (222, 710, 'N', NULL), (222, 2650, 'N', NULL), (356, 1260, 'Y', NULL), (356, 460, 'Y', NULL), (968, 80, 'Y', NULL), (968, 460, 'N', NULL), (968, 106, 'N', NULL), (968, 2400, 'N', NULL), (960, 1250, 'Y', NULL), (960, 460, 'QY', 'English spoken by most government officials'), (52, 1850, 'N', NULL), (60, 105, 'Y', NULL), (60, 460, 'N', NULL), (60, 270, 'N', NULL), (60, 1910, 'N', NULL), (60, 1250, 'N', NULL), (60, 1520, 'N', NULL), (258, 450, 'N', NULL), (258, 1580, 'Y', NULL), (258, 440, 'N', NULL), (258, 430, 'N', NULL), (687, 560, 'Y', NULL), (683, 460, 'N', NULL), (671, 460, 'Y', NULL), (227, 560, 'Y', NULL), (227, 720, 'N', NULL), (227, 400, 'N', NULL), (678, 460, 'N', 'local languages (more than 100)'), (678, 560, 'N', NULL), (234, 460, 'Y', NULL), (234, 720, 'N', NULL), (234, 2900, 'N', NULL), (234, 790, 'N', NULL), (31, 410, 'Y', NULL), (31, 570, 'Y', NULL), (47, 160, 'Y', NULL), (47, 1480, 'Y', NULL), (977, 1440, 'N', NULL), (977, 1210, 'N', NULL), (977, 1960, 'N', NULL), (977, 1900, 'N', NULL), (977, 1190, 'N', NULL), (977, 460, 'N', 'note: many in government and business also speak English'), (674, 460, 'QY', 'English widely understood, spoken, and used for most government and commercial purposes'), (597, 410, 'Y', NULL), (597, 460, 'QY', NULL), (599, 460, 'N', NULL), (599, 410, 'Y', NULL), (599, 340, 'N', NULL), (505, 1850, 'Y', NULL), (64, 1310, 'Y', NULL), (595, 700, 'Y', NULL), (206, 460, 'Y', NULL), (51, 1610, 'Y', NULL), (51, 101, 'N', NULL), (208, 0, 'N', NULL), (92, 1600, 'N', NULL), (92, 1760, 'N', NULL), (92, 1540, 'N', NULL), (92, 2400, 'Y', NULL), (92, 106, 'N', NULL), (92, 460, 'Y', 'official and lingua franca of Pakistani elite and most government ministries'), (48, 1560, 'Y', NULL), (507, 1850, 'Y', NULL), (507, 460, 'N', NULL), (351, 1580, 'Y', NULL), (351, 1370, 'Y', NULL), (675, 1340, 'N', NULL), (675, 460, 'N', NULL), (680, 1510, 'QY', 'Palauan 64.7 percent official in all islands except Sonsoral - Sonsoralese and English are official, Tobi - Tobi and English are official, and Angaur- Angaur, Japanese, and English are official'), (680, 530, 'N', NULL), (680, 460, 'N', NULL), (680, 270, 'N', NULL), (680, 860, 'N', NULL), (245, 1580, 'Y', NULL), (245, 350, 'N', NULL), (974, 80, 'Y', NULL), (974, 460, 'QY', 'English commonly used as a second language'), (262, 560, 'Y', NULL), (262, 340, 'QY', 'Creole widely used'), (692, 1320, 'Y', NULL), (692, 460, 'Y', NULL), (40, 1640, 'Y', NULL), (40, 770, 'N', NULL), (40, 660, 'N', NULL), (63, 530, 'Y', NULL), (63, 460, 'Y', NULL), (1787, 1850, 'N', NULL), (1787, 460, 'N', NULL), (7, 1650, 'Y', NULL), (250, 950, 'Y', NULL), (250, 560, 'Y', NULL), (250, 460, 'Y', NULL), (250, 970, 'N', NULL), (966, 80, 'Y', NULL), (508, 560, 'Y', NULL), (1869, 460, 'N', NULL), (248, 340, 'N', NULL), (248, 460, 'Y', NULL), (27, 840, 'N', NULL), (27, 830, 'N', NULL), (27, 30, 'N', NULL), (27, 1700, 'N', NULL), (27, 460, 'N', NULL), (27, 1730, 'N', NULL), (27, 1720, 'N', NULL), (221, 560, 'Y', NULL), (221, 2650, 'N', NULL), (221, 1590, 'N', NULL), (221, 870, 'N', NULL), (221, 1290, 'N', NULL), (290, 460, 'N', NULL), (386, 1820, 'N', NULL), (232, 460, 'Y', NULL), (378, 850, 'N', NULL), (65, 1270, 'N', NULL), (65, 460, 'N', NULL), (65, 1230, 'N', NULL), (65, 760, 'N', NULL), (65, 200, 'N', NULL), (65, 1930, 'N', NULL), (65, 1910, 'N', NULL), (252, 1830, 'Y', NULL), (252, 80, 'N', NULL), (252, 850, 'N', NULL), (252, 460, 'N', NULL), (34, 220, 'Y', NULL), (34, 230, 'QY', 'Castilian is the official language nationwide; the other languages are official regionally'), (34, 620, 'QY', 'Castilian is the official language nationwide; the other languages are official regionally'), (1758, 460, 'Y', NULL), (1758, 560, 'N', NULL), (249, 80, 'Y', NULL), (249, 1470, 'N', NULL), (249, 460, 'N', NULL), (209, 1480, 'N', NULL), (209, 1650, 'N', NULL), (46, 1870, 'N', NULL), (280, 0, 'N', NULL), (963, 80, 'Y', NULL), (963, 1000, 'N', NULL), (963, 90, 'N', NULL), (963, 560, 'N', NULL), (963, 460, 'N', NULL), (41, 660, 'Y', NULL), (41, 560, 'Y', NULL), (41, 850, 'Y', NULL), (41, 40, 'N', NULL), (41, 1580, 'N', NULL), (41, 460, 'N', NULL), (1868, 460, 'Y', NULL), (1868, 740, 'N', NULL), (1868, 560, 'N', NULL), (1868, 1850, 'N', NULL), (1868, 270, 'N', NULL), (66, 1950, 'N', NULL), (66, 460, 'N', NULL), (992, 1890, 'N', NULL), (992, 1650, 'N', NULL), (1649, 460, 'Y', NULL), (690, 460, 'N', NULL), (676, 460, 'N', NULL), (228, 480, 'QY', 'the two major African languages in the south'), (228, 1350, 'QY', 'the two major African languages in the south'), (228, 380, 'QY', 'major African languages in the north'), (239, 1580, 'Y', NULL), (297, 410, 'Y', NULL), (297, 1530, 'N', '(a Spanish, Portuguese, Dutch, English dialect)'), (297, 460, 'N', NULL), (297, 1850, 'N', NULL), (1268, 460, 'Y', NULL), (971, 80, 'Y', NULL), (971, 1550, 'N', NULL), (971, 460, 'N', NULL), (971, 740, 'N', NULL), (971, 2400, 'N', NULL), (93, 1550, 'Y', NULL), (93, 1540, 'Y', NULL), (93, 2450, 'N', NULL), (93, 2300, 'N', NULL), (213, 80, 'Y', NULL), (213, 560, 'N', NULL), (994, 103, 'Y', NULL), (994, 1650, 'N', NULL), (994, 90, 'N', NULL), (355, 40, 'Y', NULL), (355, 670, 'N', NULL), (355, 1630, 'N', NULL), (355, 1790, 'N', NULL), (374, 90, 'Y', NULL), (374, 2850, 'N', NULL), (374, 1650, 'N', NULL), (376, 230, 'Y', NULL), (376, 560, 'N', NULL), (376, 210, 'N', NULL), (376, 1580, 'N', NULL), (244, 1580, 'Y', NULL), (244, 110, 'N', NULL), (684, 1660, 'Y', '(closely related to Hawaiian and other Polynesian languages) note: most people are bilingual'), (684, 460, 'Y', NULL), (684, 2100, 'N', NULL), (54, 1850, 'Y', NULL), (54, 460, 'N', NULL), (54, 850, 'N', NULL), (54, 660, 'N', NULL), (54, 560, 'N', NULL), (61, 460, 'Y', NULL), (61, 270, 'N', NULL), (61, 850, 'N', NULL), (2000, 0, 'N', NULL), (43, 660, 'Y', NULL), (43, 1810, 'QY', 'official in Carinthia'), (43, 360, 'QY', 'official in Burgenland'), (43, 770, 'QY', 'official in Burgenland'), (1264, 460, 'Y', NULL), (672, 0, 'N', NULL), (973, 80, 'Y', NULL), (973, 460, 'N', NULL), (973, 510, 'N', NULL), (973, 2400, 'N', NULL), (1246, 460, 'Y', NULL), (267, 1730, 'Y', NULL), (267, 890, 'N', NULL), (267, 1690, 'N', NULL), (267, 460, 'N', NULL), (1441, 460, 'Y', NULL), (1441, 1580, 'N', NULL), (32, 410, 'Y', NULL), (32, 560, 'Y', NULL), (32, 660, 'Y', NULL), (1242, 460, 'Y', NULL), (1242, 340, 'QY', 'among Haitian immigrants'), (880, 109, 'Y', NULL), (880, 460, 'N', NULL), (501, 460, 'Y', NULL), (501, 1850, 'N', NULL), (501, 1330, 'N', NULL), (501, 640, 'N', NULL), (501, 340, 'N', NULL), (387, 170, 'N', NULL), (387, 360, 'N', NULL), (387, 1710, 'N', NULL), (591, 1850, 'Y', NULL), (591, 1610, 'Y', NULL), (591, 101, 'Y', NULL), (2001, 190, 'N', 'minority ethnic groups have their own languages'), (229, 560, 'Y', NULL), (229, 550, 'N', 'most common vernaculars in south'), (375, 130, 'N', NULL), (375, 1650, 'N', NULL), (677, 460, 'Y', 'English is official but spoken by only 1%-2% of the population  Note: 120 indigenous languages'), (677, 1340, 'N', NULL), (300, 0, 'N', NULL), (55, 1580, 'Y', NULL), (55, 1850, 'N', NULL), (55, 460, 'N', NULL), (55, 560, 'N', NULL), (975, 420, 'Y', NULL), (359, 180, 'N', NULL), (359, 2250, 'N', NULL), (359, 1620, 'N', NULL), (673, 1230, 'Y', NULL), (673, 460, 'N', NULL), (673, 270, 'N', NULL), (257, 960, 'Y', NULL), (257, 560, 'Y', NULL), (257, 1860, 'N', '(along Lake Tanganyika and in the Bujumbura area)'), (2, 460, 'Y', NULL), (2, 560, 'Y', NULL), (855, 920, 'Y', NULL), (855, 560, 'N', NULL), (855, 460, 'N', NULL), (235, 1680, 'N', 'in south'), (235, 80, 'Y', NULL), (94, 1910, 'N', NULL), (94, 460, 'N', NULL), (242, 560, 'Y', NULL), (242, 1140, 'N', NULL), (242, 930, 'N', NULL), (243, 560, 'Y', NULL), (243, 1140, 'N', NULL), (243, 940, 'N', NULL), (243, 930, 'N', NULL), (243, 2150, 'N', NULL), (86, 270, 'N', NULL), (86, 1270, 'N', NULL), (86, 200, 'N', NULL), (86, 1740, 'N', NULL), (86, 1360, 'N', NULL), (86, 2750, 'N', NULL), (86, 630, 'N', NULL), (56, 1850, 'Y', NULL), (1345, 460, 'Y', NULL), (67, 1230, 'N', NULL), (67, 460, 'N', NULL), (237, 460, 'Y', NULL), (237, 560, 'Y', NULL), (269, 80, 'Y', NULL), (269, 560, 'Y', NULL), (269, 1750, 'N', '(a blend of Swahili and Arabic)'), (57, 1850, 'Y', NULL), (1670, 530, 'N', NULL), (1670, 240, 'N', NULL), (1670, 460, 'N', NULL), (506, 1850, 'Y', NULL), (236, 560, 'Y', NULL), (236, 1670, 'N', NULL), (238, 1580, 'N', NULL), (238, 350, 'N', '(a blend of Portuguese and West African words)'), (13, 1310, 'N', NULL), (357, 670, 'N', NULL), (357, 460, 'N', NULL), (45, 390, 'N', 'note: English is the predominant second language'), (45, 680, 'N', NULL), (253, 560, 'Y', NULL), (253, 80, 'Y', NULL), (253, 1830, 'N', NULL), (253, 20, 'N', NULL), (1767, 460, 'N', NULL), (1767, 560, 'N', NULL), (1809, 1850, 'Y', NULL), (593, 1850, 'Y', NULL), (593, 1610, 'N', NULL), (593, 50, 'N', NULL), (20, 80, 'Y', NULL), (20, 460, 'N', 'English and French widely understood by educated classes'), (20, 560, 'N', 'English and French widely understood by educated classes'), (353, 460, 'Y', NULL), (353, 820, 'Y', NULL), (240, 1850, 'Y', NULL), (240, 560, 'Y', NULL), (240, 460, 'Y', NULL), (240, 490, 'N', NULL), (372, 470, 'Y', NULL), (372, 1650, 'N', NULL), (291, 20, 'N', NULL), (291, 80, 'N', NULL), (291, 1970, 'N', NULL), (291, 990, 'N', NULL), (291, 1980, 'N', NULL), (503, 1850, 'N', NULL), (503, 1420, 'N', NULL), (251, 60, 'N', NULL), (251, 1980, 'N', NULL), (251, 1500, 'N', NULL), (251, 690, 'N', NULL), (251, 1830, 'N', NULL), (251, 80, 'N', NULL), (251, 460, 'N', '(major foreign language taught in schools)'), (15, 0, 'N', NULL), (420, 370, 'Y', NULL), (594, 560, 'Y', NULL), (358, 540, 'Y', NULL), (358, 1870, 'Y', NULL), (679, 460, 'Y', NULL), (679, 520, 'N', NULL), (679, 750, 'N', NULL), (500, 460, 'Y', NULL), (691, 460, 'Y', NULL), (298, 500, 'N', NULL), (298, 390, 'N', NULL), (689, 560, 'Y', NULL), (689, 1570, 'Y', NULL), (33, 560, 'Y', NULL), (220, 460, 'Y', NULL), (220, 1290, 'N', NULL), (220, 2650, 'N', NULL), (220, 580, 'N', NULL), (241, 560, 'Y', NULL), (241, 490, 'N', NULL), (241, 1410, 'N', NULL), (241, 1490, 'N', NULL), (241, 120, 'N', NULL), (241, 108, 'N', NULL), (995, 650, 'Y', NULL), (995, 1650, 'N', NULL), (995, 90, 'N', NULL), (233, 460, 'Y', NULL), (233, 480, 'N', NULL), (350, 460, 'N', 'used in schools and for official purposes'), (350, 1850, 'N', NULL), (350, 850, 'N', NULL), (350, 1580, 'N', NULL), (1473, 460, 'Y', NULL), (1473, 560, 'N', NULL), (22, 460, 'N', NULL), (22, 560, 'N', NULL), (299, 680, 'N', NULL), (299, 390, 'N', NULL), (299, 460, 'N', NULL), (49, 660, 'Y', NULL), (590, 560, 'Y', NULL), (590, 340, 'N', NULL), (1671, 460, 'N', NULL), (1671, 240, 'N', NULL), (1671, 530, 'N', NULL), (30, 670, 'Y', NULL), (30, 460, 'N', NULL), (30, 560, 'N', NULL), (502, 1850, 'N', NULL), (502, 50, 'N', '(23 officially recognized Amerindian languages, including Quiche, Cakchiquel, Kekchi, Mam, Garifuna, and Xinca)'), (224, 560, 'Y', 'note - each ethnic group has its own language'), (592, 460, 'N', NULL), (592, 50, 'N', NULL), (592, 340, 'N', NULL), (592, 740, 'N', NULL), (592, 2400, 'N', NULL), (509, 560, 'Y', NULL), (509, 340, 'Y', NULL), (852, 270, 'Y', NULL), (852, 460, 'Y', NULL), (504, 1850, 'N', NULL), (504, 50, 'N', NULL), (385, 360, 'N', NULL), (385, 1710, 'N', NULL), (385, 850, 'N', NULL), (385, 370, 'N', NULL), (385, 1800, 'N', NULL), (36, 770, 'Y', NULL), (354, 780, 'N', NULL), (354, 660, 'N', NULL), (62, 104, 'N', NULL), (62, 410, 'N', NULL), (202, 1300, 'N', NULL), (91, 460, 'N', 'English enjoys associate status but is the most important language for national, political, and commercial communication'), (91, 740, 'Y', 'Hindi is the national language and primary tongue of 30% of the people'), (98, 2200, 'N', NULL), (98, 1000, 'N', NULL), (98, 106, 'N', NULL), (98, 2250, 'N', NULL), (972, 730, 'Y', NULL), (972, 460, 'N', NULL), (39, 850, 'Y', NULL), (39, 660, 'N', 'parts of Trentino-Alto Adige region are predominantly German speaking'), (39, 560, 'N', 'small French-speaking minority in Valle d Aosta region'), (216, 80, 'Y', NULL), (216, 560, 'QY', 'commerce'), (670, 1940, 'Y', NULL), (670, 1580, 'Y', NULL), (670, 810, 'N', NULL), (670, 460, 'N', NULL), (90, 2250, 'Y', NULL), (90, 1000, 'N', NULL), (688, 460, 'N', NULL), (688, 1660, 'N', NULL), (886, 1880, 'N', NULL), (993, 2300, 'N', NULL), (993, 2450, 'N', NULL), (255, 970, 'Y', NULL), (255, 460, 'QY', 'primary language of commerce, administration, and higher education'), (255, 80, 'N', NULL), (256, 1860, 'N', NULL), (44, 460, 'N', NULL), (380, 2350, 'Y', NULL), (1, 460, 'Y', NULL), (1, 1850, 'N', NULL), (598, 1850, 'N', NULL), (598, 990, 'N', NULL), (998, 1650, 'N', NULL), (998, 1890, 'N', NULL), (1784, 560, 'N', NULL), (58, 1850, 'Y', NULL), (84, 2500, 'Y', NULL), (84, 460, 'N', NULL), (84, 560, 'N', NULL), (84, 270, 'N', NULL), (84, 920, 'N', NULL), (1340, 460, 'N', NULL), (1340, 1850, 'N', NULL), (1340, 560, 'N', NULL), (38, 850, 'N', NULL), (38, 1120, 'N', NULL), (38, 560, 'N', NULL), (264, 460, 'Y', NULL), (264, 30, 'N', NULL), (264, 660, 'N', NULL), (681, 2550, 'N', NULL), (681, 590, 'N', NULL), (681, 560, 'N', NULL), (283, 710, 'N', NULL), (283, 80, 'N', NULL), (685, 1660, 'N', NULL), (685, 460, 'N', NULL), (268, 460, 'Y', NULL), (268, 1780, 'Y', NULL), (967, 80, 'N', NULL), (260, 460, 'Y', NULL), (263, 460, 'Y', NULL), (235, 560, 'Y', NULL), (94, 1770, 'Y', 'note: English is commonly used in government and is spoken competently by about 10% of the population'), (1670, 270, 'N', NULL), (12, 0, 'N', NULL), (506, 460, 'N', NULL), (53, 1850, 'Y', NULL), (13, 460, 'Y', NULL), (357, 2250, 'N', NULL), (45, 500, 'N', NULL), (45, 660, 'N', NULL), (385, 770, 'N', NULL), (385, 660, 'N', NULL), (354, 460, 'N', NULL), (62, 460, 'N', NULL), (202, 460, 'N', NULL), (98, 1550, 'N', NULL), (98, 1160, 'N', NULL), (98, 80, 'N', NULL), (972, 80, 'QY', 'Arabic used officially for Arab minority'), (1876, 460, 'Y', NULL), (962, 460, 'N', 'English widely understood among upper and middle classes'), (60, 1920, 'N', NULL), (60, 1950, 'N', NULL), (258, 2800, 'N', NULL), (258, 290, 'N', NULL), (683, 1460, 'Y', 'a Polynesian language closely related to Tongan and Samoan'), (977, 140, 'N', NULL), (977, 1450, 'N', NULL), (674, 1430, 'Y', NULL), (599, 1530, 'N', NULL), (599, 1850, 'N', NULL), (64, 460, 'Y', NULL), (595, 1850, 'Y', NULL), (51, 1850, 'Y', NULL), (207, 0, 'N', NULL), (690, 2000, 'N', NULL), (676, 2100, 'N', NULL), (228, 880, 'QY', 'major African languages in the north'), (886, 1280, 'Y', NULL), (993, 1650, 'N', NULL), (255, 1860, 'N', NULL), (256, 460, 'Y', NULL), (44, 2600, 'N', NULL), (380, 1650, 'N', NULL), (226, 560, 'Y', NULL), (998, 2450, 'N', NULL), (1784, 460, 'N', NULL), (1284, 460, 'Y', NULL);
COMMIT;

-- ----------------------------
-- Table structure for WF_WORLD_REGIONS
-- ----------------------------
DROP TABLE IF EXISTS WF_WORLD_REGIONS;
CREATE TABLE WF_WORLD_REGIONS  (
  REGION_ID INTEGER NOT NULL,
  REGION_NAME varchar(35) NOT NULL,
  PRIMARY KEY (REGION_ID)
);

-- ----------------------------
-- Records of WF_WORLD_REGIONS
-- ----------------------------
BEGIN;
INSERT INTO WF_WORLD_REGIONS VALUES (14, 'Eastern Africa'), (17, 'Middle Africa'), (15, 'Northern Africa'), (18, 'Southern Africa'), (11, 'Western Africa'), (29, 'Caribbean'), (13, 'Central America'), (5, 'South America'), (21, 'Northern America'), (143, 'Central Asia'), (30, 'Eastern Asia'), (34, 'Southern Asia'), (35, 'South-Eastern Asia'), (145, 'Western Asia'), (151, 'Eastern Europe'), (154, 'Northern Europe'), (39, 'Southern Europe'), (155, 'Western Europe'), (9, 'Oceania');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
