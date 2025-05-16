CREATE DATABASE IF NOT EXISTS CLINICA;

drop user if exists 'clinica'@'localhost';

CREATE USER 'clinica'@'localhost' IDENTIFIED BY 'clinica';

GRANT ALL PRIVILEGES ON CLINICA.* TO 'clinica'@'localhost';

-- GRANT select ON mexico.ciudades TO 'planos'@'localhost';


