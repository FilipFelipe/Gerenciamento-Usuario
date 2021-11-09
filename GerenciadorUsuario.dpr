program GerenciadorUsuario;

uses
  Vcl.Forms,
  TelaUsuarios in 'TelaUsuarios.pas' {Main},
  Database in 'Database.pas' {Connection: TDataModule},
  CadastroUsuario in 'CadastroUsuario.pas' {FM_Usuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TFM_Usuario, FM_Usuario);
  Application.Run;
end.
