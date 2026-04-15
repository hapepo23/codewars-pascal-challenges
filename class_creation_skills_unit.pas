{
6 kyu
Train your skills in creation of classes
https://www.codewars.com/kata/5ab4f002379d20e82500008c
}

unit class_creation_skills_unit;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}

interface

type
  { ---- (1) Class Version ----- }
  TX = class(TObject)
  private
    m_a: integer;
    m_b: integer;
  public
    constructor Create(const a, b: integer);  // normal create
    constructor Create(const a: integer);     // create with default b
    constructor Create; overload;             // create with defaults
    constructor Create(const Other: TX);      // create & assignment
    function CreateClone: TX;                 // create copy of self
    destructor Destroy; override;             // destroy
    procedure Assign(const a, b: integer);    // assignment a,b to self
    procedure Assign(const Other: TX);        // assignment other to self
    procedure Add(const Other: TX);           // add other to self
    procedure Subtract(const Other: TX);      // subtract other from self
    procedure Inc(const Count: integer = 1);  // increment self by count
    procedure Dec(const Count: integer = 1);  // decrement self by count
    function ToString(): string; override;    // self as string
    property GetA: integer read m_a;          // get a
    property GetB: integer read m_b;          // get b
    procedure SetA(const a: integer);         // set a
    procedure SetB(const b: integer);         // set b
  end;

type
  { ---- (2) Record Version ($modeswitch advancedrecords) ----- }
  TY = record
  private
    m_a: integer;
    m_b: integer;
  public
    constructor Create(a, b: integer); overload;
    constructor Create(a: integer); overload;
    class function Default: TY; static;
    class operator +(const L, R: TY): TY;
    class operator -(const L, R: TY): TY;
    function ToString: string;
    function GetA: integer;
    function GetB: integer;
    procedure SetA(a: integer);
    procedure SetB(b: integer);
  end;

implementation

{ ---- (1) Class Version ----- }

constructor TX.Create(const a, b: integer);
begin
  inherited Create;
  m_a := a;
  m_b := b;
end;

constructor TX.Create(const a: integer);
begin
  Self.Create(a, 2);  // delegate
end;

constructor TX.Create;
begin
  Self.Create(1, 2);  // delegate
end;

constructor TX.Create(const Other: TX);
begin
  inherited Create;
  Assign(Other);
end;

function TX.CreateClone: TX;
begin
  Result := TX.Create(Self);
end;

destructor TX.Destroy;
begin
  Writeln('Destroy ', ToString);
  inherited Destroy;
end;

procedure TX.Assign(const a, b: integer);
begin
  m_a := a;
  m_b := b;
end;

procedure TX.Assign(const Other: TX);
begin
  m_a := Other.m_a;
  m_b := Other.m_b;
end;

procedure TX.Add(const Other: TX);
begin
  m_a := m_a + Other.m_a;
  m_b := m_b + Other.m_b;
end;

procedure TX.Subtract(const Other: TX);
begin
  m_a := m_a - Other.m_a;
  m_b := m_b - Other.m_b;
end;

procedure TX.Inc(const Count: integer = 1);
begin
  System.Inc(m_a, Count);
  System.Inc(m_b, Count);
end;

procedure TX.Dec(const Count: integer = 1);
begin
  System.Dec(m_a, Count);
  System.Dec(m_b, Count);
end;

function TX.ToString: string;
begin
  WriteStr(Result, '[', m_a, ',', m_b, ']');
end;

procedure TX.SetA(const a: integer);
begin
  m_a := a;
end;

procedure TX.SetB(const b: integer);
begin
  m_b := b;
end;

{ ---- (2) Record Version ($modeswitch advancedrecords) ----- }

constructor TY.Create(a, b: integer);
begin
  m_a := a;
  m_b := b;
end;

constructor TY.Create(a: integer);
begin
  Self.Create(a, 2);
end;

class function TY.Default: TY;
begin
  Result.m_a := 1;
  Result.m_b := 2;
end;

class operator TY.+(const L, R: TY): TY;
begin
  Result.m_a := L.m_a + R.m_a;
  Result.m_b := L.m_b + R.m_b;
end;

class operator TY.-(const L, R: TY): TY;
begin
  Result.m_a := L.m_a - R.m_a;
  Result.m_b := L.m_b - R.m_b;
end;

function TY.ToString: string;
begin
  WriteStr(Result, '[', m_a, ',', m_b, ']');
end;

function TY.GetA: integer;
begin
  Result := m_a;
end;

function TY.GetB: integer;
begin
  Result := m_b;
end;

procedure TY.SetA(a: integer);
begin
  m_a := a;
end;

procedure TY.SetB(b: integer);
begin
  m_b := b;
end;

end.
