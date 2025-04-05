unit SmartPointer;

interface

type
  ISmartPointer<T> = reference to function: T;

{*
  Usage:
  var
    _List: ISmartPointer<TStringList>;
  begin
    _List := TSmartPointer<TStringList>.Create();
    _List.Add('Fallow for more great content');
    ShowMessage(_List.Text);
  end;
*}

type
  TSmartPointer<T: class, constructor> = class(TInterfacedObject, ISmartPointer<T>)
  private
    FValue: T;
  public
    constructor Create; overload;
    constructor Create(AValue: T); overload;
    destructor Destroy; override;
    function Invoke: T;
  end;

implementation

uses
  {Delphi}
  System.SysUtils
  {Project}
  ;

constructor TSmartPointer<T>.Create;
begin
  inherited;
  FValue := T.Create;
end;

constructor TSmartPointer<T>.Create(AValue: T);
begin
  inherited Create;
  if AValue = nil then
    FValue := T.Create
  else
    FValue := AValue;
end;

destructor TSmartPointer<T>.Destroy;
begin
  FreeAndNil(FValue);
  inherited;
end;

function TSmartPointer<T>.Invoke: T;
begin
  Result := FValue;
end;

end.
