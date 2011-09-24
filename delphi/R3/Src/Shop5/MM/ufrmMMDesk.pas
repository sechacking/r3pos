unit ufrmMMDesk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDesk, StdCtrls, OleCtrls, SHDocVw, MSHTML, ActnList;

type
  TfrmMMDesk = class(TfrmDesk)
    IEDesktop: TWebBrowser;
    procedure ufr(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
  private
    FHookLocked: boolean;
    procedure SetHookLocked(const Value: boolean);
    { Private declarations }
    procedure MouseHook(Code: integer; Msg: word;MouseHook: longint);override;
    procedure KeyBoardHook(Code: integer; Msg: word;KeyboardHook: longint);override;
  public
    { Public declarations }
    procedure LoadDesk;
    property HookLocked:boolean read FHookLocked write SetHookLocked;
  end;

var
  frmMMDesk: TfrmMMDesk;

implementation
uses uDevFactory,ufrmMMMain,ufrmMMToolBox;
{$R *.dfm}

{ TfrmMMDesk }

procedure TfrmMMDesk.KeyBoardHook(Code: integer; Msg: word;
  KeyboardHook: Integer);
begin
  inherited;
  if (Msg=VK_HOME) and not HookLocked then
     DevFactory.OpenCashBox;

end;

procedure TfrmMMDesk.LoadDesk;
var
    url:string;
    Doc:IHTMLDocument2;
    Ec:IHTMLElementCollection;
    iframe:DispHTMLIFrame;
    _Start:int64;
begin
  if not FileExists(ExtractFilePath(ParamStr(0))+'desk.html') then Exit;
  IEDesktop.Navigate(ExtractFilePath(ParamStr(0))+'desk.html');
  _Start := GetTickCount;
  while IEDesktop.ReadyState in [READYSTATE_LOADING,READYSTATE_LOADED] do
    begin
      if (GetTickCount-_Start) > 20000 then break;
      Application.ProcessMessages;
    end;
  Doc := IEDesktop.Document as IHTMLDocument2;
  if Doc=nil then Exit;
  if FileExists(ExtractFilePath(ParamStr(0))+'res\desk.html') then
     begin
       url := ExtractFilePath(ParamStr(0))+'res\desk.html';
       iframe := Doc.all.item('mht1',EmptyParam) as DispHTMLIFrame;
       if iframe<>nil then iframe.src := url;
     end;
  if FileExists(ExtractFilePath(ParamStr(0))+'adv\adv1.html') then
     begin
       url := ExtractFilePath(ParamStr(0))+'adv\adv1.html';
       iframe := Doc.all.item('Adv1',EmptyParam) as DispHTMLIFrame;
       if iframe<>nil then iframe.src := url;
     end;
end;

procedure TfrmMMDesk.MouseHook(Code: integer; Msg: word;
  MouseHook: Integer);
begin
  inherited;

end;

procedure TfrmMMDesk.SetHookLocked(const Value: boolean);
begin
  FHookLocked := Value;
end;

procedure TfrmMMDesk.ufr(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  s:string;
  w:integer;
  vList:TStringList;
  Node:PMMToolBox;
  Action:TAction;
begin
  inherited;
  Cancel := true;
  w := pos(s,'dsk=(');
  if w=0 then Exit;
  delete(s,1,w+5);
  if (s<>'') and (s[length(s)]=')') then delete(s,length(s),1);
  vList := TStringList.Create;
  new(Node);
  try
    vList.CommaText := s;
    Action := frmMMMain.FindAction(vList.Values['action']);
    if Assigned(Action) and Action.Enabled then
       begin
         Node^.Action := Action;
         Node^.mid := vList.Values['moduId'];
         if (Action.Name = 'actfrmXsmNet')
            or
            (Action.Name = 'actfrmRimNet')
         then
            Action.OnExecute(TObject(Node))
         else
            Action.OnExecute(Action);
       end
    else Raise Exception.Create('你没有操作此模块的权限...');
  finally
    dispose(Node);
    vList.Free;
  end;
end;

end.
