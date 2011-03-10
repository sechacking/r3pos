// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.10.11.249/services/CaTenantService?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (2011/3/10 13:57:15 - 1.33.2.5)
// ************************************************************************ //

unit CaTenantService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"

  Pub                  = class;                 { "http://xml.soa.modules.rsp.rspcn.com" }
  MessageException     = class;                 { "http://xml.soa.modules.rsp.rspcn.com" }



  // ************************************************************************ //
  // Namespace : http://xml.soa.modules.rsp.rspcn.com
  // ************************************************************************ //
  Pub = class(TRemotable)
  private
    FtimeStamp: WideString;
    Fvss: WideString;
    Fflag: WideString;
    Fmsg: WideString;
    FrecAck: WideString;
  published
    property timeStamp: WideString read FtimeStamp write FtimeStamp;
    property vss: WideString read Fvss write Fvss;
    property flag: WideString read Fflag write Fflag;
    property msg: WideString read Fmsg write Fmsg;
    property recAck: WideString read FrecAck write FrecAck;
  end;



  // ************************************************************************ //
  // Namespace : http://xml.soa.modules.rsp.rspcn.com
  // ************************************************************************ //
  MessageException = class(TRemotable)
  private
    Fmessage: WideString;
    Fpub: Pub;
  public
    destructor Destroy; override;
  published
    property message: WideString read Fmessage write Fmessage;
    property pub: Pub read Fpub write Fpub;
  end;

  fault           = MessageException;      { "http://10.10.11.249/services/CaTenantService"[F] }

  // ************************************************************************ //
  // Namespace : http://10.10.11.249/services/CaTenantService
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : CaTenantServiceSoapBinding
  // service   : CaTenantWebServiceImplService
  // port      : CaTenantService
  // URL       : http://10.10.11.249/services/CaTenantService
  // ************************************************************************ //
  CaTenantWebServiceImpl = interface(IInvokable)
  ['{BA4F5324-098F-1C4D-3ABF-8F98B90C70F7}']
    function  login(const inXml: WideString): WideString; stdcall;
    function  uniqueLoginName(const inXml: WideString): WideString; stdcall;
    function  register(const inXml: WideString): WideString; stdcall;
    function  unRegister(const inXml: WideString): WideString; stdcall;
    function  changePwd(const inXml: WideString): WideString; stdcall;
    function  modidyInfo(const inXml: WideString): WideString; stdcall;
    function  applyRelation(const inXml: WideString): WideString; stdcall;
    function  changeRelationType(const inXml: WideString): WideString; stdcall;
    function  auditRelation(const inXml: WideString): WideString; stdcall;
    function  getTenantInfo(const inXml: WideString): WideString; stdcall;
  end;

function GetCaTenantWebServiceImpl(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CaTenantWebServiceImpl;


implementation

function GetCaTenantWebServiceImpl(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CaTenantWebServiceImpl;
const
  defWSDL = 'http://10.10.11.249/services/CaTenantService?wsdl';
  defURL  = 'http://10.10.11.249/services/CaTenantService';
  defSvc  = 'CaTenantWebServiceImplService';
  defPrt  = 'CaTenantService';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as CaTenantWebServiceImpl);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor MessageException.Destroy;
begin
  if Assigned(Fpub) then
    Fpub.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(CaTenantWebServiceImpl), 'http://10.10.11.249/services/CaTenantService', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CaTenantWebServiceImpl), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(CaTenantWebServiceImpl), ioDocument);
  RemClassRegistry.RegisterXSClass(Pub, 'http://xml.soa.modules.rsp.rspcn.com', 'Pub');
  RemClassRegistry.RegisterXSClass(MessageException, 'http://xml.soa.modules.rsp.rspcn.com', 'MessageException');
  RemClassRegistry.RegisterXSInfo(TypeInfo(fault), 'http://10.10.11.249/services/CaTenantService', 'fault');

end.