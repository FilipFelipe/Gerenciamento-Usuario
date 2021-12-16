unit Database;

interface

uses
  System.SysUtils, System.Classes, ZDataset, ZAbstractConnection, ZConnection,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, Vcl.Menus,
  ZSqlUpdate, ZSqlProcessor;

type
  TConnection = class(TDataModule)
    tabelaUsuario: TDataSource;
    conexaoBanco: TZConnection;
    QueryMySQL: TZQuery;
    exeSQL: TZSQLProcessor;
    ZConnectionPG: TZConnection;
    ZQueryPG: TZQuery;
    procedure exeSQLBeforeExecute(Processor: TZSQLProcessor;
      StatementIndex: Integer);
    procedure exeSQLError(Processor: TZSQLProcessor; StatementIndex: Integer;
      E: Exception; var ErrorHandleAction: TZErrorHandleAction);

  private
    { Private declarations }
  public
    Sucess: Integer;
  end;

var
  Connection: TConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}





procedure TConnection.exeSQLBeforeExecute(Processor: TZSQLProcessor;
  StatementIndex: Integer);
begin
        Sucess:=1;
end;

procedure TConnection.exeSQLError(Processor: TZSQLProcessor;
  StatementIndex: Integer; E: Exception;
  var ErrorHandleAction: TZErrorHandleAction);
begin
        Sucess:=0;
end;

end.
