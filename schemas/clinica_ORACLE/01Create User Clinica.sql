alter session set "_ORACLE_SCRIPT"=true;

drop user clinica cascade;

CREATE USER clinica 
IDENTIFIED BY clinica
default tablespace users
temporary tablespace temp
quota unlimited on users;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW
 TO clinica;

grant create any index to clinica;
GRANT EXECUTE any PROCEDURE TO clinica; 


-- Compartir tablas

-- usuario hr (A)
GRANT SELECT ON employees TO nw;

-- usuario nw (B)
SELECT * FROM hr.employees;
CREATE SYNONYM empleados FOR hr.employees;
SELECT * FROM employees;

