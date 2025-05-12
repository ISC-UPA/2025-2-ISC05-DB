-- Los nombres de usuarios no son sensibles   esquemas = ESQUEMAS
-- En MariaDB si son sensibles

alter session set "_ORACLE_SCRIPT"=true;

drop user esquemas CASCADE;

CREATE USER esquemas 
IDENTIFIED BY esquemas
default tablespace users
temporary tablespace temp
quota unlimited on users;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW
 TO esquemas;

grant create any index to esquemas;
GRANT EXECUTE any PROCEDURE TO esquemas; 

