unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractRODataset, ZAbstractDataset,DB ,ZDataset, ZConnection,
  ZAbstractTable, StdCtrls, ZdbFactory, Grids, DBGrids,zIntf, ZDbcIntfs, ZDbcCache,
  ADODB, ZSqlUpdate
  ;

type
  TForm1 = class(TForm)
    ZQuery1: TZQuery;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ADOConnection1: TADOConnection;
    Button7: TButton;
    ZUpdateSQL1: TZUpdateSQL;
    Button8: TButton;
    Button9: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dbHelp:TdbFactory;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  dbHelp := TdbFactory.Create;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  dbHelp.Initialize('Provider=sqlite-3;DatabaseName=D:\Delphi\R3\zLib\src\zLib\Test\test.db');
  dbHelp.Connect;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Text := 'select * from CUSTOMER';
//  ZQuery1.Params.ParamByName('CUST_NO').AsString := '';
  dbHelp.Open(ZQuery1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ZQuery1.UpdateObject := nil;
  dbHelp.UpdateBatch(ZQuery1);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ZQuery1.ShowRecordTypes := [usModified, usInserted, usDeleted];
  ZQuery1.Filtered := not ZQuery1.Filtered;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  dbHelp.BeginTrans();
  dbHelp.UpdateBatch(ZQuery1);
  showmessage('kdjfkd');
  dbHelp.CommitTrans;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ZQuery1.Filtered := false;
  ZQuery1.Filter := Edit1.Text;
  ZQuery1.Filtered := true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ZQuery1.Locate('CUST_NO',Edit1.Text,[]); 
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ZQuery1.UpdateObject := ZUpdateSQL1;
  dbHelp.UpdateBatch(ZQuery1);

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  dbHelp.ExecSQL('update CUSTOMER set CUST_NO=''2222'' where CUST_NO=''1111''');
end;

end.
