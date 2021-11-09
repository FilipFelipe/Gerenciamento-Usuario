unit CadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFM_Usuario = class(TForm)
    txtCPF: TDBEdit;
    txtEmail: TDBEdit;
    txtNome: TDBEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Separador: TPanel;
    cbStatus: TDBComboBox;
    lbNome: TStaticText;
    lbEmail: TStaticText;
    cbAdmin: TDBComboBox;
    lbCPF: TStaticText;
    lbFicha: TStaticText;
    imgUser: TImage;
    lbStatus: TStaticText;
    lbAdmin: TStaticText;
    lbDataNascimento: TStaticText;
    txtData: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
  public
  end;

var
  FM_Usuario: TFM_Usuario;

implementation
uses Database;

{$R *.dfm}

procedure TFM_Usuario.btnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja continuar?', 'Quaisquer alteração não será salva !',MB_ICONQUESTION + MB_YESNO)= id_yes then
    begin
      Connection.Query.RevertRecord;
      FM_Usuario.Close;
    end;

end;

procedure TFM_Usuario.btnOkClick(Sender: TObject);
begin
  try
    Connection.Query.Edit;
  finally
    Application.MessageBox('Dados do usuário salvo com sucesso.','Salvo',MB_OK + MB_ICONINFORMATION);
    FM_Usuario.Close;
  end;

end;

procedure TFM_Usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Connection.Query.Refresh;
end;



end.
