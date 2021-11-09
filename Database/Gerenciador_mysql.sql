
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
  u_id int(6) unsigned NOT NULL AUTO_INCREMENT,
  u_name varchar(40) DEFAULT NULL,
  u_cpf varchar(40) DEFAULT NULL,
  u_dataNascimento varchar(40) DEFAULT NULL,
  u_email varchar(40) DEFAULT NULL,
  u_status varchar(10) DEFAULT NULL,
  u_adm varchar(3) DEFAULT NULL,
  PRIMARY KEY (u_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

