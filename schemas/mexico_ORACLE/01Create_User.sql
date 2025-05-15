-- Los nombres de usuarios no son sensibles   mexico = mexico
-- En MariaDB si son sensibles

alter session set "_ORACLE_SCRIPT"=true;

drop user mexico CASCADE;

CREATE USER mexico 
IDENTIFIED BY mexico
default tablespace users
temporary tablespace temp
quota unlimited on users;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW
 TO mexico;

grant create any index to mexico;
GRANT EXECUTE any PROCEDURE TO mexico; 

