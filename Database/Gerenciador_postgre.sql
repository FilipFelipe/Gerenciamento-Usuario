-- gerenciadorusuario.usuario definitionDROP TABLE IF EXISTS usuario_gerenciador;
CREATE SEQUENCE u_id_seq_gerenciador;

CREATE TABLE public.usuario_gerenciador (
  u_id smallint NOT NULL DEFAULT NEXTVAL('u_id_seq_gerenciador') PRIMARY KEY,
  u_name varchar(40) DEFAULT NULL,
  u_cpf varchar(40) DEFAULT NULL,
  u_dataNascimento varchar(12) DEFAULT NULL,
  u_email varchar(40) DEFAULT NULL,
  u_status varchar(10) DEFAULT NULL,
  u_adm varchar(3) DEFAULT NULL
);