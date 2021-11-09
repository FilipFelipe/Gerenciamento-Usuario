unit TelaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractConnection, ZConnection,
  Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.WinXCtrls, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons,
  System.Actions, Vcl.ActnList, Vcl.CustomizeDlg,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Vcl.ActnMan;

type
  TMain = class(TForm)
    Menu: TMainMenu;
    Inicio1: TMenuItem;
    Novo: TMenuItem;
    btnSair: TMenuItem;
    Sair2: TMenuItem;
    btnLimparBanco: TMenuItem;
    btnCriarUsers: TMenuItem;
    Painel: TPanel;
    txtBusca: TEdit;
    btnBuscar: TBitBtn;
    userGrid: TDBGrid;
    btnNovoUser: TBitBtn;
    btnEditUser: TBitBtn;
    Acoes: TActionList;
    Sair: TAction;
    BuscarNome: TAction;
    btnConectar: TMenuItem;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoUserClick(Sender: TObject);
    procedure btnLimparBancoClick(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure BuscarNomeExecute(Sender: TObject);
    procedure btnEditUserClick(Sender: TObject);
    procedure btnCriarUsersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    procedure componentesTela(op:BOOL);
  public

  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses Database, CadastroUsuario;

procedure TMain.btnBuscarClick(Sender: TObject);
var
    select:String;
    tabela:String;
begin
    select := 'SELECT u_id as ID, u_name as Nome, u_cpf as CPF, u_dataNascimento as "Data de Nascimento", u_email as "E-mail",IF(u_status<1,"Desativado", "Ativo" ) as Status ,  IF(u_adm!=1, "Não","Sim") as Adminstrador ';
    tabela := 'FROM GerenciadorUsuario.usuario';
    Connection.Query.SQL.Text := select + tabela + ' where u_name LIKE "'+ txtBusca.Text + '%"';
    Connection.Query.Open;
end;


procedure TMain.btnEditUserClick(Sender: TObject);
begin
    FM_Usuario.showmodal;
end;

procedure TMain.btnNovoUserClick(Sender: TObject);
begin
    Connection.Query.Insert;
    FM_Usuario.showmodal;
end;

procedure TMain.BuscarNomeExecute(Sender: TObject);
begin
    txtBusca.setfocus;
end;

procedure TMain.btnLimparBancoClick(Sender: TObject);
begin
  try
    Connection.exeSQL.Script.Clear;
    Connection.exeSQL.Script.Add('TRUNCATE TABLE usuario;');
    Connection.exeSQL.Execute;
    Application.MessageBox('Tabela de dados limpa com sucesso!','Sucesso',MB_OK + MB_ICONINFORMATION);
  Except
    Application.MessageBox('Erro ao estabelecer uma conexão com o banco de dados!','Erro de conexão',MB_OK + MB_ICONERROR);
  end;
    Connection.Query.Refresh;
end;


procedure TMain.btnConectarClick(Sender: TObject);
begin
  Try
    Connection.conexaoBanco.Connected := True;
    Connection.Query.Active:=True;
    componentesTela(true);
  Except
    Application.MessageBox('Erro ao estabelecer uma conexão com o banco de dados!','Erro de conexão',MB_OK + MB_ICONERROR);
  End;

End;
procedure TMain.btnCriarUsersClick(Sender: TObject);
begin
  try
    Connection.exeSQL.Script.Clear;
    Connection.exeSQL.Script.Add('INSERT INTO GerenciadorUsuario.usuario (u_name, u_cpf, u_dataNascimento, u_email, u_status, u_adm) VALUES("Lucas Andrei", "123.147.258-25", "10/12/1999", "lucas@hotmail.com", "Ativo", "Não");');
    Connection.exeSQL.Script.Add('INSERT INTO GerenciadorUsuario.usuario (u_name, u_cpf, u_dataNascimento, u_email, u_status, u_adm) VALUES("Felipe do Santos", "852.147.258-10", "10/12/1989", "felipe@hotmail.com", "Desativado", "Não");');
    Connection.exeSQL.Script.Add('INSERT INTO GerenciadorUsuario.usuario (u_name, u_cpf, u_dataNascimento, u_email, u_status, u_adm) VALUES("Junio do Reis", "165.147.258-91", "10/12/1994", "Junio@hotmail.com", "Ativo", "Não");');
    Connection.exeSQL.Script.Add('INSERT INTO GerenciadorUsuario.usuario (u_name, u_cpf, u_dataNascimento, u_email, u_status, u_adm) VALUES("Fernanda Ferreira", "178.165.278-98", "10/12/1996", "Fernanda@hotmail.com", "Ativo", "Não");');
    Connection.exeSQL.Script.Add('INSERT INTO GerenciadorUsuario.usuario (u_name, u_cpf, u_dataNascimento, u_email, u_status, u_adm) VALUES("Janaina do Santos", "123.137.258-55", "10/12/1993", "Janaina@hotmail.com", "Ativo", "Não");');
	  Connection.exeSQL.Script.Add('INSERT INTO GerenciadorUsuario.usuario (u_name, u_cpf, u_dataNascimento, u_email, u_status, u_adm) VALUES("Henrique Oliveira", "123.147.258-41", "10/12/1991", "Henrique@hotmail.com", "Ativo", "Sim");');
    Connection.exeSQL.Execute;
    Connection.Query.Refresh;
  Except
    Application.MessageBox('Erro ao estabelecer uma conexão com o banco de dados!','Erro de conexão',MB_OK + MB_ICONERROR);

  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin

  try
    Connection.conexaoBanco.Connected := True;
    Connection.Query.Active:=True;
  except
    componentesTela(false);
    Application.MessageBox('Erro ao estabelecer uma conexão com o banco de dados!','Erro de conexão',MB_OK + MB_ICONERROR);
  end;
end;

procedure TMain.componentesTela(op:BOOL);

begin
    btnNovoUser.Enabled := op;
    btnEditUser.Enabled := op;
    btnCriarUsers.Enabled := op;
    btnLimparBanco.Enabled := op;
    btnBuscar.Enabled := op;
    txtBusca.Enabled := op;
End;

procedure TMain.SairExecute(Sender: TObject);
begin
    Application.Terminate;
end;

end.

