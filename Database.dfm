object Connection: TConnection
  OldCreateOrder = False
  Height = 334
  Width = 654
  object tabelaUsuario: TDataSource
    DataSet = QueryMySQL
    Left = 120
    Top = 200
  end
  object conexaoBanco: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = ''
    Port = 3306
    Database = 'GerenciadorUsuario'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 'D:\0 - Sistema\Desktop\Gerenciamento-Usuario\Libs\libmySQL.dll'
    Left = 120
    Top = 64
  end
  object QueryMySQL: TZQuery
    Connection = conexaoBanco
    Active = True
    SQL.Strings = (
      
        'SELECT u_id as ID, u_name as Nome, u_cpf as CPF, u_dataNasciment' +
        'o as '#39'Data de Nascimento'#39', u_email as '#39'E-mail'#39',u_status as Statu' +
        's , u_adm as Adminstrador FROM usuario')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 119
    Top = 152
  end
  object exeSQL: TZSQLProcessor
    Params = <>
    Script.Strings = (
      'DROP TABLE IF EXISTS usuario; '
      
        'CREATE TABLE usuario (u_id INT(6) UNSIGNED AUTO_INCREMENT PRIMAR' +
        'Y KEY, u_name varchar(40) DEFAULT NULL, u_cpf varchar(40) DEFAUL' +
        'T NULL, u_dataNascimento varchar(40) DEFAULT NULL, u_email varch' +
        'ar(40) DEFAULT NULL, u_status tinyint(1) DEFAULT NULL, u_adm tin' +
        'yint(1) DEFAULT NULL); ')
    Connection = conexaoBanco
    Delimiter = ';'
    OnError = exeSQLError
    BeforeExecute = exeSQLBeforeExecute
    Left = 120
    Top = 120
  end
  object ZConnectionPG: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = ''
    Port = 5432
    Database = 'GerenciadorUsuario'
    User = 'postgres'
    Password = 'admin'
    Protocol = 'postgresql-9'
    LibraryLocation = 'C:\Program Files (x86)\PostgreSQL\9.6\bin\libpq.dll'
    Left = 264
    Top = 72
  end
  object ZQueryPG: TZQuery
    Connection = ZConnectionPG
    Active = True
    SQL.Strings = (
      
        'SELECT u_id as "ID", u_name as "Nome", u_cpf as "CPF", u_dataNas' +
        'cimento as "Data de Nascimento", u_email as "E-mail",u_status as' +
        ' "Status" , u_adm as "Adminstrador"  from public.usuario_gerenci' +
        'ador')
    Params = <>
    Left = 264
    Top = 128
  end
end
