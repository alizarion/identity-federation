create database keycloak;
use keycloak;

CREATE USER 'keycloak'@'%'IDENTIFIED BY 'keycloak';
GRANT ALL PRIVILEGES ON *.* TO 'keycloak'@'%' WITH GRANT OPTION;
