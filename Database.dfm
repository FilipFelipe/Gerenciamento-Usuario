object Connection: TConnection
  OldCreateOrder = False
  Height = 204
  Width = 134
  object tabelaUsuario: TDataSource
    DataSet = Query
    Left = 24
    Top = 136
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
    Left = 24
    Top = 24
  end
  object Query: TZQuery
    Connection = conexaoBanco
    SQL.Strings = (
      
        'SELECT u_id as ID, u_name as Nome, u_cpf as CPF, u_dataNasciment' +
        'o as '#39'Data de Nascimento'#39', u_email as '#39'E-mail'#39',u_status as Statu' +
        's , u_adm as Adminstrador FROM GerenciadorUsuario.usuario ')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 23
    Top = 80
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
    Left = 72
    Top = 80
  end
end
