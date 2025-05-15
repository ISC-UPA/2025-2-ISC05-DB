-- Las cuentas de usuarios son sensibles MEXICO != mexico
-- Las bases de datos   no son sensibles   


CREATE DATABASE IF NOT EXISTS MEXICO;

drop user if exists 'mexico'@'localhost';

CREATE USER 'mexico'@'localhost' IDENTIFIED BY 'mexico';

GRANT ALL PRIVILEGES ON MEXICO.* TO 'mexico'@'localhost';

-- GRANT select ON MEXICO.ciudades TO 'mexico'@'localhost';

