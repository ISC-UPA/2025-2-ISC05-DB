CREATE TABLE job_grades (
  Grade_Level TEXT(3) NOT NULL,
  Lowest_Sal INTEGER,
  Highest_Sal INTEGER,
  PRIMARY KEY (Grade_Level)
);

CREATE TABLE jobs (
  JOB_ID TEXT(10) NOT NULL,
  JOB_TITLE TEXT(35) NOT NULL,
  MIN_SALARY CURRENCY,
  MAX_SALARY CURRENCY,
  PRIMARY KEY (JOB_ID)
);

CREATE TABLE regions (
  REGION_ID INTEGER NOT NULL,
  REGION_NAME TEXT(25),
  PRIMARY KEY (REGION_ID)
);

CREATE TABLE countries (
  COUNTRY_ID TEXT(2) NOT NULL,
  COUNTRY_NAME TEXT(40),
  REGION_ID INTEGER,
  PRIMARY KEY (COUNTRY_ID),
  FOREIGN KEY (REGION_ID) REFERENCES regions(REGION_ID)
);

CREATE TABLE locations (
  LOCATION_ID INTEGER NOT NULL,
  STREET_ADDRESS TEXT(40),
  POSTAL_CODE TEXT(12),
  CITY TEXT(30) NOT NULL,
  STATE_PROVINCE TEXT(25),
  COUNTRY_ID TEXT(2),
  PRIMARY KEY (LOCATION_ID),
  FOREIGN KEY (COUNTRY_ID) REFERENCES countries(COUNTRY_ID)
);

CREATE TABLE departments (
  DEPARTMENT_ID INTEGER NOT NULL,
  DEPARTMENT_NAME TEXT(30) NOT NULL,
  MANAGER_ID INTEGER,
  LOCATION_ID INTEGER,
  PRIMARY KEY (DEPARTMENT_ID),
  FOREIGN KEY (LOCATION_ID) REFERENCES locations(LOCATION_ID)
);

CREATE TABLE employees (
  EMPLOYEE_ID INTEGER NOT NULL,
  FIRST_NAME TEXT(20),
  LAST_NAME TEXT(25) NOT NULL,
  EMAIL TEXT(25) NOT NULL,
  PHONE_NUMBER TEXT(20),
  HIRE_DATE DATE NOT NULL,
  JOB_ID TEXT(10) NOT NULL,
  SALARY CURRENCY,
  COMMISSION_PCT DOUBLE,
  MANAGER_ID INTEGER,
  DEPARTMENT_ID INTEGER,
  PRIMARY KEY (EMPLOYEE_ID),
  FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
  FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
  FOREIGN KEY (MANAGER_ID) REFERENCES employees(EMPLOYEE_ID)
);

CREATE TABLE job_history (
  EMPLOYEE_ID INTEGER NOT NULL,
  START_DATE DATE NOT NULL,
  END_DATE DATE NOT NULL,
  JOB_ID TEXT(10) NOT NULL,
  DEPARTMENT_ID INTEGER,
  PRIMARY KEY (EMPLOYEE_ID, START_DATE),
  FOREIGN KEY (EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID),
  FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
  FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID)
);
