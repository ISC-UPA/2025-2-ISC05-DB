-- Las cuentas de usuarios son sensibles ESQUEMAS != esquemas
-- Las bases de datos   no son sensibles   


CREATE DATABASE IF NOT EXISTS ESQUEMAS;

drop user if exists 'esquemas'@'localhost';

CREATE USER 'esquemas'@'localhost' IDENTIFIED BY 'esquemas';

GRANT ALL PRIVILEGES ON ESQUEMAS.* TO 'esquemas'@'localhost';

-- GRANT select ON MEXICO.ciudades TO 'esquemas'@'localhost';

