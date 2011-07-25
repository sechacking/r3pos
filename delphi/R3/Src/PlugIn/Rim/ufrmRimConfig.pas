unit ufrmRimConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmRimConfig = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    chkTWO_PHASE_COMMIT: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
implementation
uses IniFiles;
{$R *.dfm}

procedure TfrmRimConfig.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRimConfig.Button1Click(Sender: TObject);
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'PlugIn.cfg');
  try
    F.WriteString('rim','url',Edit1.Text);
    F.WriteBool('rim','TWO_PHASE_COMMIT',chkTWO_PHASE_COMMIT.Checked);
  finally
    F.free;
  end;
  close;
end;

procedure TfrmRimConfig.FormCreate(Sender: TObject);
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'PlugIn.cfg');
  try
    Edit1.Text := F.ReadString('rim','url','');
    chkTWO_PHASE_COMMIT.Checked := F.ReadBool('rim','TWO_PHASE_COMMIT',true); 
  finally
    F.free;
  end;
end;

end.
