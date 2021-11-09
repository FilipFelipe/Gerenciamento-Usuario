-- gerenciadorusuario.usuario definition
DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario(
  u_id int NOT NULL primary key,
  u_name varchar(40) DEFAULT NULL,
  u_cpf varchar(40) DEFAULT NULL,
  u_dataNascimento varchar(10) DEFAULT NULL,
  u_email varchar(40) DEFAULT NULL,
  u_status varchar(10) DEFAULT NULL,
  u_adm varchar(3) DEFAULT NULL
) ;
create sequence u_id_seq; 



