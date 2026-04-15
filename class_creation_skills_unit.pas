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
    constructor Create(a, b: integer); overload;
    constructor Create(a: integer); overload;
    constructor Create; overload;
    constructor Create(const Other: TX); overload; // create & assignment
    destructor Destroy; override;
    procedure Assign(const Other: TX);  // assignment
    function CloneCreate: TX;  //  create copy of self
    procedure Add(const Other: TX);
    procedure Subtract(const Other: TX);
    procedure Inc(Count: integer = 1);
    procedure Dec(Count: integer = 1);
    function ToString(): string; override;
    property GetA: integer read m_a;
    property GetB: integer read m_b;
  end;

implementation

constructor TX.Create(a, b: integer);
begin
  inherited Create;
  m_a := a;
  m_b := b;
end;

constructor TX.Create(a: integer);
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

destructor TX.Destroy;
begin
  Writeln('Destroy ', ToString);
  inherited Destroy;
end;

procedure TX.Assign(const Other: TX);
begin
  m_a := Other.m_a;
  m_b := Other.m_b;
end;

function TX.CloneCreate: TX;
begin
  Result := TX.Create(Self);
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

procedure TX.Inc(Count: integer = 1);
begin
  System.Inc(m_a, Count);
  System.Inc(m_b, Count);
end;

procedure TX.Dec(Count: integer = 1);
begin
  System.Dec(m_a, Count);
  System.Dec(m_b, Count);
end;

function TX.ToString: string;
begin
  WriteStr(Result, '[', m_a, ',', m_b, ']');
end;

end.
