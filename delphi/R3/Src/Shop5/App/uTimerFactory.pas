unit uTimerFactory;

interface
uses Classes,Windows;
type
  TTimerFactory=class(TThread)
  private
    Proc:TNotifyEvent;
    FTimeOut: int64;
    hEvent: THandle;
    procedure SetTimeOut(const Value: int64);
  public
    procedure Execute; override;
    constructor Create(AProc:TNotifyEvent;uTimeOut:int64);
    destructor Destroy; override;
    property TimeOut:int64 read FTimeOut write SetTimeOut;
  end;
implementation

{ TTimerFactory }

constructor TTimerFactory.Create(AProc:TNotifyEvent;uTimeOut:int64);
begin
  Proc := AProc;
  TimeOut := uTimeOut;
  FreeOnTerminate := false;
  hEvent := CreateEvent(nil, True, False, nil);
  ResetEvent(hEvent);
  inherited Create(false);
end;

destructor TTimerFactory.Destroy;
begin
  DoTerminate;
  SetEvent(hEvent);
  inherited;
  if hEvent<>0 then CloseHandle(hEvent);
end;

procedure TTimerFactory.Execute;
begin
  ResetEvent(hEvent);
  while not Terminated do
    begin
      Proc(nil);
      WaitForSingleObject(hEvent, TimeOut);
      if not Terminated then ResetEvent(hEvent);
    end;
end;

procedure TTimerFactory.SetTimeOut(const Value: int64);
begin
  FTimeOut := Value;
end;

end.
