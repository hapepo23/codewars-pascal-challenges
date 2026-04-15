{
6 kyu
Train your skills in creation of classes
https://www.codewars.com/kata/5ab4f002379d20e82500008c
}

unit class_creation_skills_unit;

{$mode objfpc}{$H+}

interface

type
  TX = class(TObject)
  private
    m_a: integer;
    m_b: integer;
  public
    constructor Create(const a, b: integer);  // normal create
    constructor Create(const a: integer);     // create with default b
    constructor Create; overload;             // create with defaults
    constructor Create(const Other: TX);      // create & assignment
    function CloneCreate: TX;                 // create copy of self
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
    procedure SetB(const b: integer);         // set a
  end;

implementation

constructor TX.Create(const a, b: integer);
begin
  inherited Create;
  m_a := a;
  m_b := b;
end;

constructor TX.Create(const a: integer);
begin
  Create(a, 2);  // delegate
end;

constructor TX.Create;
begin
  Create(1, 2);  // delegate
end;

constructor TX.Create(const Other: TX);
begin
  inherited Create;
  Assign(Other);
end;

function TX.CloneCreate: TX;
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

end.
