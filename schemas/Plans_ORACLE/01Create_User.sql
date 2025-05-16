alter session set "_ORACLE_SCRIPT"=true;

drop user plans cascade;

CREATE USER plans 
IDENTIFIED BY plans
default tablespace users
temporary tablespace temp
quota unlimited on users;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW
 TO plans;

grant create any index to plans;
GRANT EXECUTE any PROCEDURE TO plans; 


