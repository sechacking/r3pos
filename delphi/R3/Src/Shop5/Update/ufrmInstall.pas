unit ufrmInstall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, TlHelp32,Forms,
  Dialogs, ComCtrls, RzButton, ExtCtrls, StdCtrls,ZipUtils,IniFiles,ShellApi,ZdbFactory,
  RzBckgnd, ZDataSet;

type
  TFileInfo = packed record
    CommpanyName: string;
    FileDescription: string;
    FileVersion: string;
    InternalName: string;
    LegalCopyright: string;
    LegalTrademarks: string;
    OriginalFileName: string;
    ProductName: string;
    ProductVersion: string;
    SpecialBuild: string;
    PrivateBuild: string;
    Comments: string;
    VsFixedFileInfo: VS_FIXEDFILEINFO;
    UserDefineValue: string;
  end;
  TfrmInstall = class(TForm)
    PrsBar: TProgressBar;
    cxbtnCancel: TRzBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnInstall: TRzBitBtn;
    Bevel2: TBevel;
    Label5: TLabel;
    Image1: TImage;
    RzBackground1: TRzBackground;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxbtnCancelClick(Sender: TObject);
    procedure btnInstallClick(Sender: TObject);
  private
    FUrl: string;
    Aborted:Boolean;
    FPath: string;
    FFiles:TStringList;
    ControlFile:TIniFile;
    BreakFile:TIniFile;
    VersionFile:TIniFile;
    FSysId: string;
    FDelayTime: Integer;
    FNewVersion: string;
    FInstallType: Integer;
    Fflag: integer;
    FComVersion: string;
    procedure SetUrl(const Value: string);
    procedure SetPath(const Value: string);
    procedure SetSysId(const Value: string);
    function GetCurVersion: string;
    function GetFiles: Integer;
    procedure SetDelayTime(const Value: Integer);
    procedure SetInstallType(const Value: Integer);
    procedure Setflag(const Value: integer);
    procedure SetComVersion(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    //result = v1 > v2
    Installed:Boolean;
    function CheckExeFile(filename:string):boolean;
    function  DownLoadControlFile:Boolean;
    procedure LoadVersionFile;
    procedure LoadControlFile;
    procedure LoadBreakFile;
    procedure UpdateLabel(s:string);
    procedure DoEnd;
    //返回True 需要更新
    function CheckVersion(FileName:string):Boolean;
    function CheckDownLoad(FileName:string):Boolean;
    function CheckBreakInfo(FileName:string):Boolean;
    function CheckInstall:Boolean;
    function CompareVersion(v1,v2:string):Boolean;
    function GetFileVersionInfomation(const FileName: string; var info:
      TFileInfo; UserDefine: string = ''): boolean;
    function WinExecAndWait32V2(FileName: string; Visibility: integer): DWORD;
    function DownFile(FileName:string):boolean;
    function DownFiles:boolean;
    function InstallFile(FileName:string):boolean;
    function InstallFiles:boolean;
    function CheckRunState(AExeName:string):boolean;
    property Url:string read FUrl write SetUrl;
    property Path:string read FPath write SetPath;
    property SysId:string read FSysId write SetSysId;
    property CurVersion:string read GetCurVersion;
    property NewVersion:string read FNewVersion;
    property ComVersion:string read FComVersion write SetComVersion;
    property Files:Integer read GetFiles;
    property DelayTime:Integer read FDelayTime write SetDelayTime;
    property InstallType:Integer read FInstallType write SetInstallType;
    property flag:integer read Fflag write Setflag;
  end;

implementation
uses uDownByHttp,uGlobal, COMAdmin,CmAdmCtl,WinSvc;
var IsStop:boolean;
{$R *.dfm}

function StopService(AServName: string): Boolean;
var
  SCManager, hService: SC_HANDLE;
  SvcStatus: TServiceStatus;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  Result := SCManager <> 0;
  if Result then
  try
    hService := OpenService(SCManager, PChar(AServName), SERVICE_ALL_ACCESS);
    Result := hService <> 0;
    if Result then
    try  //停止并卸载服务;
      Result := ControlService(hService, SERVICE_CONTROL_STOP, SvcStatus);
      //删除服务，这一句可以不要;
      //DeleteService(hService);
    finally
      CloseServiceHandle(hService);
    end;
  finally
    CloseServiceHandle(SCManager);
  end;
end;
function StartService(AServName: string): Boolean;
var
  SCManager, hService: SC_HANDLE;
  lpServiceArgVectors: PChar;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  Result := SCManager <> 0;
  if Result then
  try
    hService := OpenService(SCManager, PChar(AServName), SERVICE_ALL_ACCESS);
    Result := hService <> 0;
    if (hService = 0) and (GetLastError = ERROR_SERVICE_DOES_NOT_EXIST) then
      Exception.Create('The specified service does not exist');
    if hService <> 0 then
    try
      lpServiceArgVectors := nil;
      Result := WinSvc.StartService(hService, 0, PChar(lpServiceArgVectors));
      if not Result and (GetLastError = ERROR_SERVICE_ALREADY_RUNNING) then
        Result := True;
    finally
      CloseServiceHandle(hService);
    end;
  finally
    CloseServiceHandle(SCManager);
  end;
end;
function QueryService(AServName: string): Boolean;
var
  SCManager, hService: SC_HANDLE;
  SvcStatus: TServiceStatus;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  Result := SCManager <> 0;
  if Result then
  try
    hService := OpenService(SCManager, PChar(AServName), SERVICE_QUERY_STATUS);
    Result := hService <> 0;
    if Result then
    try  //停止并卸载服务;
      Result := QueryServiceStatus(hService,SvcStatus);
      case SvcStatus.dwCurrentState of
      SERVICE_STOPPED:
        begin
          IsStop := true;
        end;
      SERVICE_RUNNING:
        begin
          IsStop := false;
        end;
      end;
    finally
      CloseServiceHandle(hService);
    end;
  finally
    CloseServiceHandle(SCManager);
  end;
end;

procedure CloseApplication;
var
  i : ICOMAdminCatalog;
  l : ICatalogCollection;
  k : ICatalogObject;
  r:Integer;
  vProgId:TStrings;
begin
//  CoInitialize(nil);
  try
    i:=CoCOMAdminCatalog.Create;
    l:=i.GetCollection('Applications') as ICatalogCollection;
    l.Populate;
    for r:= 0 to l.Count -1 do
      begin
        k:= l.Item[r] as ICatalogObject;
        if k.Name = 'ADOScktSrvr' then
           Break
        else
           k := nil;
      end;
    if k<>nil then
       i.ShutdownApplication(k.Name);
  finally
    //CoUninitialize;
  end;
end;
{文件是否在使用中}
function IsFileInUse(fName:string):boolean;
var
  HFileRes : HFILE;
begin
  Result := false;
  if not FileExists(fName) then
    exit;
  HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE,0, nil, OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;
function GetSystemLoad():String;  //获取系统路径(system/system32)
var
   pcSystemDirectory : PChar;
   dwSDSize          : DWORD;
begin
   dwSDSize := MAX_PATH + 1;
   GetMem(pcSystemDirectory, dwSDSize ); // allocate memory for the string
   try
      if Windows.GetSystemDirectory( pcSystemDirectory, dwSDSize ) <> 0 then
         Result := pcSystemDirectory;
   finally
      FreeMem( pcSystemDirectory ); // now free the memory allocated for the string
   end;
end;
{ TfrmInstall }

function TfrmInstall.DownFile(FileName: string):boolean;
var HTTPGetFile: TDownByHttp;
  DstFile:string;
  SurFile:string;
  i:integer;
begin
  result := false;
  HTTPGetFile := TDownByHttp.Create(nil);
  try
    if Url[Length(Url)]='/' then
       SurFile := Url + FileName
    else
       SurFile := Url + '/'+FileName;
    DstFile := Path+'install\'+FileName;
    HTTPGetFile.FileName := DstFile;
    HTTPGetFile.FileURL := SurFile;
    HTTPGetFile.InitPosHandle(PrsBar.Handle);
    HTTPGetFile.DelayTime := DelayTime;
    ForceDirectories(Path+'install\');//目录不存在时自动建目录
    Aborted := false;
    CheckBreakInfo(FileName);
    PrsBar.Max := 100;
    HTTPGetFile.LoadBreakFile;
    HTTPGetFile.DownFile;
    while not HTTPGetFile.Ended do
      begin
        if Aborted then HTTPGetFile.CancelDownLoad;
        Application.ProcessMessages;
      end;
    if Aborted then
      begin
        {文件可能还在使用中，做延时处理}
        i := 0;
        while (i < 500) and IsFileInUse(DstFile) do
        begin
          Application.ProcessMessages;
          inc(i);
        end;
        DeleteFile(DstFile);
      end;
    if FileExists(DstFile) and HTTPGetFile.Done then
      begin
        result := true;
      end
    else
      if not Aborted and HTTPGetFile.HasFile then
         result := DownFile(FileName);
  finally
    HTTPGetFile.free;
  end;
end;

procedure TfrmInstall.SetPath(const Value: string);
begin
  FPath := Value;
end;

procedure TfrmInstall.SetUrl(const Value: string);
begin
  FUrl := Value;
end;

procedure TfrmInstall.FormCreate(Sender: TObject);
var F:TIniFile;
begin
  inherited;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'frame\web.cfg');
  try
    Caption := '欢迎使用'+ F.ReadString('soft','name','好店铺')+'系列产品';
    Label10.Caption :=  F.ReadString('home','url','www.okonly.net');
    Label12.Caption :=  F.ReadString('home','qq','30355701');
  finally
    F.Free;
  end;
  FFiles := TStringList.Create;
  VersionFile := nil;
  ControlFile := nil;

  InstallType := 0;
end;

procedure TfrmInstall.FormDestroy(Sender: TObject);
begin
  if ControlFile<>nil then FreeAndNil(ControlFile);
  if VersionFile<>nil then FreeAndNil(VersionFile);
  if BreakFile<>nil then FreeAndNil(BreakFile);
  FFiles.Free;
end;

function TfrmInstall.GetFileVersionInfomation(const FileName: string;
  var info: TFileInfo; UserDefine: string): boolean;
const
  SFInfo = '\StringFileInfo\';
var
  VersionInfo: Pointer;
  InfoSize: DWORD;
  InfoPointer: Pointer;
  Translation: Pointer;
  VersionValue: string;
  unused: DWORD;
begin
  unused := 0;
  Result := False;
  InfoSize := GetFileVersionInfoSize(pchar(FileName), unused);
  if InfoSize > 0 then
  begin
    GetMem(VersionInfo, InfoSize);
    Result := GetFileVersionInfo(pchar(FileName), 0, InfoSize, VersionInfo);
    if Result then
    begin
      VerQueryValue(VersionInfo, '\VarFileInfo\Translation', Translation,
        InfoSize);
      VersionValue := SFInfo + IntToHex(LoWord(Longint(Translation^)), 4) +
        IntToHex(HiWord(Longint(Translation^)), 4) + '\';
      VerQueryValue(VersionInfo, pchar(VersionValue + 'CompanyName'),
        InfoPointer, InfoSize);
      info.CommpanyName := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'FileDescription'),
        InfoPointer, InfoSize);
      info.FileDescription := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'FileVersion'),
        InfoPointer, InfoSize);
      info.FileVersion := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'InternalName'),
        InfoPointer, InfoSize);
      info.InternalName := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'LegalCopyright'),
        InfoPointer, InfoSize);
      info.LegalCopyright := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'LegalTrademarks'),
        InfoPointer, InfoSize);
      info.LegalTrademarks := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'OriginalFileName'),
        InfoPointer, InfoSize);
      info.OriginalFileName := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'ProductName'),
        InfoPointer, InfoSize);
      info.ProductName := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'ProductVersion'),
        InfoPointer, InfoSize);
      info.ProductVersion := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'SpecialBuild'),
        InfoPointer, InfoSize);
      info.SpecialBuild := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'PrivateBuild'),
        InfoPointer, InfoSize);
      info.PrivateBuild := string(pchar(InfoPointer));
      VerQueryValue(VersionInfo, pchar(VersionValue + 'Comments'), InfoPointer,
        InfoSize);
      info.Comments := string(pchar(InfoPointer));
      if VerQueryValue(VersionInfo, '\', InfoPointer, InfoSize) then
        info.VsFixedFileInfo := TVSFixedFileInfo(InfoPointer^);
      if UserDefine <> '' then
      begin
        if VerQueryValue(VersionInfo, pchar(VersionValue + UserDefine),
          InfoPointer, InfoSize) then
          info.UserDefineValue := string(pchar(InfoPointer));
      end;
    end;
    FreeMem(VersionInfo);
  end;
end;

function TfrmInstall.CompareVersion(v1, v2: string): Boolean;
var L1,L2:TStringList;
  v11,v12,v13,v14:Integer;
  v21,v22,v23,v24:Integer;
begin
  L1 := TStringList.Create;
  L2 := TStringList.Create;
  try
    L1.Delimiter := '.';
    L1.DelimitedText := v1;
    L2.Delimiter := '.';
    L2.DelimitedText := v2;

    if L1.Count >= 1 then v11 := StrtoIntDef(L1[0],0) else v11 := 0;
    if L1.Count >= 2 then v12 := StrtoIntDef(L1[1],0) else v12 := 0;
    if L1.Count >= 3 then v13 := StrtoIntDef(L1[2],0) else v13 := 0;
    if L1.Count >= 4 then v14 := StrtoIntDef(L1[3],0) else v14 := 0;

    if L2.Count >= 1 then v21 := StrtoIntDef(L2[0],0) else v21 := 0;
    if L2.Count >= 2 then v22 := StrtoIntDef(L2[1],0) else v22 := 0;
    if L2.Count >= 3 then v23 := StrtoIntDef(L2[2],0) else v23 := 0;
    if L2.Count >= 4 then v24 := StrtoIntDef(L2[3],0) else v24 := 0;

    if v11>v21 then
       result := true
    else
    if v11<v21 then
       result := false
    else
    if v12>v22 then
       result := true
    else
    if v12<v22 then
       result := false
    else
    if v13>v23 then
       result := true
    else
    if v13<v23 then
       result := false
    else
    if v14>v24 then
       result := true
    else
       result := false;
  finally
    L1.Free;
    L2.Free;
  end;
end;

function TfrmInstall.DownLoadControlFile: Boolean;
begin
  result := False;
  try
  if ControlFile<>nil then FreeAndNil(ControlFile);
  if DownFile(SysId+'.ugd.zip') then
     begin
        ControlFile := TIniFile.Create(Path+'install\'+SysId+'.ugd.zip');
        Label3.Caption := '最新版本：'+ ControlFile.ReadString('Program','Version','4.0.0.0');
        FFiles.Clear;
        result := true;
     end
  else
     if ControlFile<>nil then FreeAndNil(ControlFile);
  except
     result := false;
  end;
end;

function TfrmInstall.WinExecAndWait32V2(FileName: string;
  Visibility: integer): DWORD;
  procedure WaitFor(processHandle: THandle);
  var
    msg: TMsg;
    ret: DWORD;
  begin
    repeat
      ret := MsgWaitForMultipleObjects(
        1, { 1 handle to wait on }
        processHandle, { the handle }
        False, { wake on any event }
        INFINITE, { wait without timeout }
        QS_PAINT or { wake on paint messages }
        QS_SENDMESSAGE { or messages from other threads }
        );
      if ret = WAIT_FAILED then
        Exit; { can do little here }
      if ret = (WAIT_OBJECT_0 + 1) then
      begin
        { Woke on a message, process paint messages only. Calling
          PeekMessage gets messages send from other threads processed. }
        while PeekMessage(msg, 0, WM_PAINT, WM_PAINT, PM_REMOVE) do
          DispatchMessage(msg);
      end;
    until ret = WAIT_OBJECT_0;
  end; { Waitfor }
var { V1 by Pat Ritchey, V2 by P.Below }
  zAppName: array[0..512] of char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin { WinExecAndWait32V2 }
  StrPCopy(zAppName, FileName);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zAppName, { pointer to command line string }
    nil, { pointer to process security attributes }
    nil, { pointer to thread security attributes }
    false, { handle inheritance flag }
    CREATE_NEW_CONSOLE or { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil, { pointer to new environment block }
    nil, { pointer to current directory name }
    StartupInfo, { pointer to STARTUPINFO }
    ProcessInfo) { pointer to PROCESS_INF } then
    Result := DWORD(-1) { failed, GetLastError has error code }
  else
  begin
    Waitfor(ProcessInfo.hProcess);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end; { Else }
end;

procedure TfrmInstall.SetSysId(const Value: string);
begin
  FSysId := Value;
end;

function TfrmInstall.CheckVersion(FileName: string): Boolean;
var
  sVersion: string;
  flag,cflag:string;
begin
  sVersion := VersionFile.ReadString(FileName,'Version','');
  flag := VersionFile.ReadString('Program','flag','0'); 
  cflag := ControlFile.ReadString(FileName,'flag','0');
  result := CompareVersion(ControlFile.ReadString(FileName,'Version',''),sVersion) and (flag>=cflag);
end;

procedure TfrmInstall.LoadVersionFile;
begin
  if VersionFile<>nil then FreeAndNil(VersionFile);
  VersionFile := TIniFile.Create(Path+SysId+'.Info');
  Label2.Caption := '当前版本：'+ VersionFile.ReadString('Program','Version','4.0.0.0');
  Fflag := VersionFile.ReadInteger('Program','flag',0);
end;

function TfrmInstall.DownFiles: boolean;
var ZipFiles:TStringList;
  i:Integer;
begin
  Result := False;
  UpdateLabel('下载控制文件'+SysID+'.ugd');
  if not DownLoadControlFile then
     begin
       UpdateLabel('下载控制文件'+SysID+'.ugd失败，安装结束');
       DoEnd;
       Exit;
     end;
  LoadVersionFile;
  LoadBreakFile;
  if not CheckInstall then
     begin
       UpdateLabel('没找到新版本，安装结束');
       DoEnd;
       Result := true;
       Exit;
     end;
  ZipFiles := TStringList.Create;
  try
    ControlFile.ReadSections(ZipFiles);
    for i:=0 to ZipFiles.Count -1 do
      begin
        Application.ProcessMessages;
        if uppercase(ZipFiles[i])='PROGRAM' then continue;
        if CheckVersion(ZipFiles[i]) and CheckDownLoad(ZipFiles[i]) then
           begin
             UpdateLabel('正在下载文件：'+ZipFiles[i]);
             if DownFile(ZipFiles[i]) then
                BreakFile.WriteString(ZipFiles[i],'Version',ControlFile.ReadString(ZipFiles[i],'Version',''))
             else
                begin
                  UpdateLabel('下载文件：'+ZipFiles[i]+'失败');
                  Exit;
                end;
           end;
        if Aborted then
           begin
             UpdateLabel('下载文件取消执行....');
             Exit;
           end;
      end;
    BreakFile.WriteString('Program','Version',ControlFile.ReadString('Program','Version',''));
    UpdateLabel('文件下载完毕...');
    btnInstall.Visible := true;
    result := true;
  finally
    ZipFiles.free;
  end;
end;

procedure TfrmInstall.UpdateLabel(s: string);
begin
  Label4.Caption := s;
  Label4.Update;
end;

procedure TfrmInstall.DoEnd;
begin
  cxbtnCancel.Caption := '关闭';
end;

function TfrmInstall.CheckInstall: Boolean;
var
  sVersion: string;
begin
  sVersion := VersionFile.ReadString('Program','Version','');
  result := CompareVersion(ControlFile.ReadString('Program','Version',''),sVersion);
end;

function TfrmInstall.InstallFile(FileName: string): boolean;
var FileDir:string;
  ZipFile,s:string;
  vFiles:TStringList;
  i:integer;
  RegisterServer:function(): HResult; stdcall;
  Handle:THandle;
begin
  result := false;
  ZipFile := Path+'install\'+FileName;
  if uppercase(FileName)=uppercase('mdbFile.zip') then
  begin
     copyfile(pchar(Path+'mdbFile.mdb'),pchar(Path+'mdbFile'+formatDatetime('YYYYMMDD_HHNNSS',now())+'.mdb'),false);
  end;
  if FileExists(ZipFile) then
    begin
      FileDir := ControlFile.ReadString(FileName,'FileDir','');
      if uppercase(FileDir)='SYS32' then
         FileDir := GetSystemLoad
      else
         FileDir := Path+FileDir;
      ForceDirectories(FileDir);//目录不存在时自动建目录
      if FileDir[length(FileDir)]<>'\' then
         FileDir := FileDir + '\';
      if not UnZipFiles(ZipFile,FileDir,'',s) then
         begin
           if ControlFile.ReadString(FileName,'FileDir','')<>'SYS32' then
              Exit;
         end;
      vFiles := TStringList.Create;
      try
        vFiles.CommaText := s;
        for i:=0 to vFiles.Count-1 do
          begin
            if not((uppercase(ExtractFileExt(vFiles[i]))='.DLL')
               or
                   (uppercase(ExtractFileExt(vFiles[i]))='.OCX')
                  )
            then Continue;
            Handle := LoadLibrary(Pchar(FileDir+vFiles[i]));
            try
            if Handle>0 then
               begin
                 @RegisterServer := GetProcAddress(Handle, 'DLLRegisterServer');
                 if @RegisterServer<>nil then
                     RegisterServer;
               end;
            finally
               FreeLibrary(Handle);
            end;
          end;
      finally
        vFiles.Free;
      end;
      VersionFile.WriteString(FileName,'Version',ControlFile.ReadString(FileName,'Version',''));
      result := true;
    end;
end;

procedure TfrmInstall.LoadControlFile;
begin
  if ControlFile<>nil then FreeAndNil(ControlFile);
  ControlFile := TIniFile.Create(Path+'install\'+SysId+'.ugd.zip');
  FNewVersion := ControlFile.ReadString('Program','Version','4.0.0.0');
  FComVersion := ControlFile.ReadString('Program','ComVersion','4.0.0.0');
  if FComVersion='' then FComVersion := FNewVersion;
  Label3.Caption := '最新版本：'+ FNewVersion;
end;

function TfrmInstall.InstallFiles: boolean;
var ZipFiles:TStringList;
  i:Integer;
begin
  Result := False;
  btnInstall.Visible := false;

  UpdateLabel('正在准备安装....');
  LoadVersionFile;
  LoadControlFile;
  ZipFiles := TStringList.Create;
  try
    ControlFile.ReadSections(ZipFiles);
    PrsBar.Max := ZipFiles.Count;
    for i:=0 to ZipFiles.Count -1 do
      begin
        if Aborted then
           begin
             UpdateLabel('安装程序被取消执行....');
             Exit;
           end;
        Application.ProcessMessages;
        PrsBar.Position := i;
        if uppercase(ZipFiles[i])='PROGRAM' then continue;
        try
        if CheckVersion(ZipFiles[i]) then
           begin
             UpdateLabel('正在安装文件：'+ZipFiles[i]);
             if not InstallFile(ZipFiles[i]) then
                begin
                  UpdateLabel('安装文件：'+ZipFiles[i]+'失败');
                  Exit;
                end;
           end;
        finally
           DeleteFile(Path+'install\'+ZipFiles[i]);
        end;
      end;
    VersionFile.WriteString('Program','Version',ControlFile.ReadString('Program','Version',''));
    UpdateLabel('安装文件完毕...');
    result := true;
    Installed := true;
  finally
    ZipFiles.free;
  end;
end;

function TfrmInstall.CheckRunState(AExeName: string):boolean;
begin
  result := IsFileInUse(Path+AExeName);
end;

procedure TfrmInstall.cxbtnCancelClick(Sender: TObject);
begin
//  if cxbtnCancel.Caption = '隐藏' then
//     close;
  if cxbtnCancel.Caption = '取消' then
     Aborted := true;
  if cxbtnCancel.Caption = '退出' then
     Application.Terminate;
//  Close;
end;

function TfrmInstall.GetCurVersion: string;
begin
  result := VersionFile.ReadString('Program','Version','4.0.0.0');
end;

procedure TfrmInstall.btnInstallClick(Sender: TObject);
var Shut:boolean;
begin
  btnInstall.Enabled := false;
  try
  if InstallType =0 then
     begin
        if not InstallFiles then Raise Exception.Create('完装新程序失败') else
           begin
             MessageBox(Handle,'恭喜你成功安装最新程序','友情提示..',MB_OK+MB_ICONINFORMATION);
             Close;
           end;
     end;
  if InstallType=1 then
     begin
       if FileExists(Path+'install\update.zip') then
          begin
            InstallFile('update.zip');
            DeleteFile(Path+'install\update.zip');
          end;
       Global.upgrade := true;
       Application.Terminate;
       Close;
       ShellExecute(handle,'open',pchar(ExtractFilePath(ParamStr(0))+'update.exe'),pchar(ExtractFileName(ParamStr(0))),nil,SW_SHOWNORMAL);
     end;
  if InstallType=2 then
     begin
       Shut := false;
       if CheckExeFile(paramstr(1)) then Raise Exception.Create('请退出软件后再点击安装...');
       if CheckExeFile('ADOScktSrvr.exe') then
          begin
            if MessageBox(Handle,'你本机有运行中间服务程序,是否立即关闭?','友情提示...',MB_YESNO+MB_ICONQUESTION)=6 then
               begin
                  StopService('ADOScktSrvr');
                  isStop := false;
                  while not isStop and QueryService('ADOScktSrvr') do Application.ProcessMessages;
                  CloseApplication;
                  Shut := true;
               end
            else
               Exit;
          end;
       if not InstallFiles then Raise Exception.Create('完装新程序失败') else
          begin
            if Shut then StartService('ADOScktSrvr');
            MessageBox(Handle,'恭喜你成功安装最新程序,请重新进入系统','友情提示..',MB_OK+MB_ICONINFORMATION);
            Close;
          end;
     end;
  finally
     btnInstall.Enabled := true;
  end;
end;


procedure TfrmInstall.LoadBreakFile;
begin
  if BreakFile<>nil then FreeAndNil(BreakFile);
  BreakFile := TIniFile.Create(Path+'install\Files.ft');
end;

function TfrmInstall.CheckDownLoad(FileName: string): Boolean;
var
  sVersion: string;
begin
  FFiles.Add(FileName);
  result := true;
  if FileExists(Path+'install\'+FileName) then
    begin
      sVersion := BreakFile.ReadString(FileName,'Version','');
      result := CompareVersion(ControlFile.ReadString(FileName,'Version',''),sVersion);
    end;
end;

function TfrmInstall.CheckBreakInfo(FileName: string): Boolean;
var
  sVersion: string;
begin
  result := false;
  if FileExists(Path+FileName+'.ft') then
    begin
      sVersion := BreakFile.ReadString(FileName,'ftVersion','');
      if ControlFile.ReadString(FileName,'Version','')=sVersion then
         begin
           BreakFile.WriteString(FileName,'ftVersion',ControlFile.ReadString(FileName,'Version',''));
           result := true;
         end
      else
         begin
           if FileExists(Path+FileName+'.ft') then
              if not DeleteFile(Path+FileName+'.ft') then Raise Exception.Create(Path+FileName+'.ft文件被其他程序占用.');
         end;
    end;
end;

function TfrmInstall.GetFiles: Integer;
begin
  result := FFiles.Count;
end;

procedure TfrmInstall.SetDelayTime(const Value: Integer);
begin
  FDelayTime := Value;
end;

procedure TfrmInstall.SetInstallType(const Value: Integer);
begin
  FInstallType := Value;
end;

function TfrmInstall.CheckExeFile(filename: string): boolean;
var
  ProcessSnapShotHandle: THandle;
  ProcessEntry: TProcessEntry32;
  Ret: BOOL;
  s: string;
  Position: Integer;
begin
  result := false;
  ProcessSnapShotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if ProcessSnapShotHandle>0 then
  begin
    try
      ProcessEntry.dwSize:=SizeOf(TProcessEntry32);
      Ret:=Process32First(ProcessSnapShotHandle, ProcessEntry);
      while Ret do
      begin
        s:=LowerCase(ExtractFileName(ProcessEntry.szExeFile));
        if s=LowerCase(filename)
        then
          begin
            result := true;
            Break;
          end;
        //比较s的值就行了.
        Ret:=Process32Next(ProcessSnapShotHandle, ProcessEntry)
      end;
    finally
      CloseHandle(ProcessSnapShotHandle)
    end;
  end
end;
procedure TfrmInstall.Setflag(const Value: integer);
begin
  Fflag := Value;
end;

procedure TfrmInstall.SetComVersion(const Value: string);
begin
  FComVersion := Value;
end;

end.
