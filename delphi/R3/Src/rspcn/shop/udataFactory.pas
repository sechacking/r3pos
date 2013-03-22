unit udataFactory;

interface

uses
  SysUtils, Classes,DB ,ZDataSet, ZBase, ZIntf, ZdbFactory,Forms,IniFiles;

type
  TdataFactory = class(TDataModule)
  private
    FDataSets:TList;
    Fsqlite: TdbFactory;
    dbFlag:integer;
    Fonline: boolean;
    function getRemote: IdbDllHelp;
    procedure Setsqlite(const Value: TdbFactory);
    procedure Setonline(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //开始事务  超时设置 单位秒
    procedure BeginTrans(TimeOut:integer=-1);
    //提交事务
    procedure CommitTrans;
    //回滚事务
    procedure RollbackTrans;

    //是否已经在事务中 True 在事务中
    function  InTransaction:boolean;

    //得到数据库类型 0:SQL Server ;1 Oracle ; 2 Sybase; 3 ACCESS; 4 DB2;  5 Sqlite
    function  iDbType:Integer;
    //数据包组织
    function BeginBatch:Boolean;
    function AddBatch(DataSet:TDataSet;AClassName:string='';Params:TftParamList=nil):Boolean;
    function OpenBatch:Boolean;
    function CommitBatch:Boolean;
    function CancelBatch:Boolean;

    //查询数据;
    function Open(DataSet:TDataSet;AClassName:String;Params:TftParamList):Boolean;overload;
    function Open(DataSet:TDataSet;AClassName:String):Boolean;overload;
    function Open(DataSet:TDataSet):Boolean;overload;

    //提交数据
    function UpdateBatch(DataSet:TDataSet;AClassName:String;Params:TftParamList):Boolean;overload;
    function UpdateBatch(DataSet:TDataSet;AClassName:String):Boolean;overload;
    function UpdateBatch(DataSet:TDataSet):Boolean;overload;

    //返回执行影响记录数
    function ExecSQL(const SQL:WideString;ObjectFactory:TZFactory=nil):Integer;

    //执行远程方式，返回结果
    function ExecProc(AClassName:String;Params:TftParamList=nil):String;
    procedure MoveToDefault;
    procedure MoveToRemote;
    procedure MoveToSqlite;

    property sqlite:TdbFactory read Fsqlite write Setsqlite;
    property remote:IdbDllHelp read getRemote;
    property online:boolean read Fonline write Setonline;
  end;

var
  dataFactory: TdataFactory;

implementation
uses dllApi;
{$R *.dfm}

{ TdataFactory }

function TdataFactory.AddBatch(DataSet: TDataSet; AClassName: string;
  Params: TftParamList): Boolean;
begin
  case dbFlag of
  0:result := sqlite.AddBatch(DataSet,AClassName,Params);
  else
    begin
      if Params<>nil then
         dbHelp.AddBatch(TZQuery(DataSet).Delta,AClassName,TftParamList.Encode(Params) )
      else
         dbHelp.AddBatch(TZQuery(DataSet).Delta,AClassName,'') ;
      FDataSets.Add(DataSet);
    end;
  end;
end;

function TdataFactory.BeginBatch: Boolean;
begin
  case dbFlag of
  0:result := sqlite.BeginBatch;
  else
    begin
      if FDataSets.Count>0 then Raise Exception.Create('已经在组包状态，不能重复操作。');
      dbHelp.beginbatch;
    end;
  end;
end;

procedure TdataFactory.BeginTrans(TimeOut: integer);
begin
  case dbFlag of
  0:sqlite.BeginTrans(TimeOut);
  else
    dbHelp.BeginTrans(TimeOut);
  end;
end;

function TdataFactory.CancelBatch: Boolean;
begin
  case dbFlag of
  0:sqlite.CancelBatch;
  else
    begin
      dbHelp.CancelBatch;
      FDataSets.Clear;
    end;
  end;
end;

function TdataFactory.CommitBatch: Boolean;
var
  i:integer;
begin
  case dbFlag of
  0:sqlite.CommitBatch;
  else
    begin
      dbHelp.CommitBatch;
      for i:=0 to FDataSets.Count-1 do
        begin
          TZQuery(FDataSets[i]).CommitUpdates;
        end;
      FDataSets.Clear;
    end;
  end;
end;

procedure TdataFactory.CommitTrans;
begin
  case dbFlag of
  0:sqlite.CommitTrans;
  else
    dbHelp.CommitTrans;  
  end;
end;

constructor TdataFactory.Create(AOwner: TComponent);
begin
  inherited;
  sqlite := TdbFactory.Create;
  FDataSets := TList.Create;
  dbFlag := 0;
  sqlite.Initialize('provider=sqlite-3;databasename='+ExtractShortPathName(ExtractFilePath(Application.ExeName))+'data\r3.db');
  sqlite.connect;
end;

destructor TdataFactory.Destroy;
begin
  sqlite.Free;
  FDataSets.Free;
  inherited;
end;

function TdataFactory.ExecProc(AClassName: String;
  Params: TftParamList): String;
begin
  case dbFlag of
  0:result := sqlite.ExecProc(AClassName,Params);
  else
    result := StrPas(dbHelp.ExecProc(AClassName,TftParamList.Encode(Params)));
  end;
end;

function TdataFactory.ExecSQL(const SQL: WideString;
  ObjectFactory: TZFactory): Integer;
begin
  case dbFlag of
  0:result := sqlite.ExecSQL(SQL);
  else
    result := dbHelp.ExecSQL(SQL);
  end;
end;

function TdataFactory.getRemote: IdbDllHelp;
begin
  result := dbHelp;
end;

function TdataFactory.iDbType: Integer;
begin
  case dbFlag of
  0:result := sqlite.iDbType;
  else
    result := dbHelp.iDbType;
  end;
end;

function TdataFactory.InTransaction: boolean;
begin
  case dbFlag of
  0:result := sqlite.InTransaction;
  else
    result := dbHelp.InTransaction;
  end;
end;

function TdataFactory.Open(DataSet: TDataSet; AClassName: String): Boolean;
begin
  case dbFlag of
  0:result := sqlite.Open(DataSet,AClassName);
  else
    TZQuery(DataSet).Data := dbHelp.OpenNS(AClassName,'');
  end;
end;

function TdataFactory.Open(DataSet: TDataSet; AClassName: String;
  Params: TftParamList): Boolean;
begin
  case dbFlag of
  0:result := sqlite.Open(DataSet,AClassName,Params);
  else
    begin
      if Params<>nil then
         TZQuery(DataSet).Data := dbHelp.OpenNS(AClassName,TftParamList.Encode(Params))
      else
         TZQuery(DataSet).Data := dbHelp.OpenNS(AClassName,'');
    end;
  end;
end;

procedure TdataFactory.MoveToDefault;
var
  f:TIniFile;
begin
  case dbFlag of
  0:if sqlite.InTransaction then Raise Exception.Create('在事务中，不能切换连接');
  else
    if remote.InTransaction then Raise Exception.Create('在事务中，不能切换连接');
  end;
  F := TIniFile.Create(ExtractShortPathName(ExtractFilePath(Application.ExeName))+'r3.cfg');
  try
    if F.ReadString('db','SFVersion','.LCL')='.LCL' then
       dbFlag := 0
    else
       dbFlag := 1;
  finally
    F.Free;
  end;
end;

procedure TdataFactory.MoveToRemote;
begin
  case dbFlag of
  0:if sqlite.InTransaction then Raise Exception.Create('在事务中，不能切换连接');
  else
    if remote.InTransaction then Raise Exception.Create('在事务中，不能切换连接');
  end;
  dbFlag := 1;
end;

procedure TdataFactory.MoveToSqlite;
begin
  case dbFlag of
  0:if sqlite.InTransaction then Raise Exception.Create('在事务中，不能切换连接');
  else
    if remote.InTransaction then Raise Exception.Create('在事务中，不能切换连接');
  end;
  dbFlag := 0;
end;

function TdataFactory.Open(DataSet: TDataSet): Boolean;
begin
  case dbFlag of
  0:result := sqlite.Open(DataSet);
  else
    TZQuery(DataSet).Data := dbHelp.OpenSQL(TZQuery(DataSet).SQL.Text,TftParamList.Encode(TZQuery(DataSet).Params));
  end;
end;

function TdataFactory.OpenBatch: Boolean;
var
  V:OleVariant;
  i:integer;
begin
  case dbFlag of
  0:result := sqlite.OpenBatch;
  else
    begin
      V := dbHelp.OpenBatch;
      for i:=0 to FDataSets.Count-1 do
        begin
          TZQuery(FDataSets[i]).Data := V[i];
        end;
      FDataSets.Clear;
    end;
  end;
end;

procedure TdataFactory.RollbackTrans;
begin
  case dbFlag of
  0:sqlite.RollbackTrans;
  else
    dbHelp.RollbackTrans;
  end;
end;

procedure TdataFactory.Setsqlite(const Value: TdbFactory);
begin
  Fsqlite := Value;
end;

function TdataFactory.UpdateBatch(DataSet: TDataSet): Boolean;
begin
  Raise Exception.Create('不支持'); 
end;

function TdataFactory.UpdateBatch(DataSet: TDataSet;
  AClassName: String): Boolean;
begin
  case dbFlag of
  0:result := sqlite.UpdateBatch(DataSet,AClassName);
  else
    begin
      dbHelp.UpdateBatch(TZQuery(DataSet).Delta,AClassName,TftParamList.Encode(TZQuery(DataSet).Params));
      TZQuery(DataSet).CommitUpdates;
    end;
  end;
end;

function TdataFactory.UpdateBatch(DataSet: TDataSet; AClassName: String;
  Params: TftParamList): Boolean;
begin
  case dbFlag of
  0:result := sqlite.UpdateBatch(DataSet,AClassName,Params);
  else
    begin
      if Params<>nil then
         dbHelp.UpdateBatch(TZQuery(DataSet).Delta,AClassName,TftParamList.Encode(Params))
      else
         dbHelp.UpdateBatch(TZQuery(DataSet).Delta,AClassName,'');
      TZQuery(DataSet).CommitUpdates;
    end;
  end;
end;

procedure TdataFactory.Setonline(const Value: boolean);
begin
  Fonline := Value;
end;

initialization
  dataFactory := TdataFactory.create(nil);
finalization
  dataFactory.Free;
end.
