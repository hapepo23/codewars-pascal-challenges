{
6 kyu
Moves in squared strings (III)
https://www.codewars.com/kata/56dbeec613c2f63be4000be6
}

unit moves_in_squared_strings_3_unit;

{$mode objfpc}{$H+}

interface

type
  TFunctionParameter = function(s: string): string;

function Rot90Clock(s: string): string;
function Diag1Sym(s: string): string;
function SelfieAndDiag1(s: string): string;
function Oper(f: TFunctionParameter; s: string): string;

implementation

uses
  SysUtils,
  StrUtils;

type
  TStrArray = array of string;

function Rot90Clock(s: string): string;
var
  Lines, rlines: TStrArray;
  i, j, h: integer;
begin
  Lines := s.Split(['\n']);
  h := High(Lines);
  rlines := [];
  SetLength(rlines, h + 1);
  for i := 0 to h do
  begin
    rlines[i] := '';
    for j := 0 to h do
      rlines[i] += Lines[h - j][i + 1];
  end;
  Result := string.Join('\n', rlines);
end;

function Diag1Sym(s: string): string;
var
  Lines, rlines: TStrArray;
  i, j, h: integer;
begin
  Lines := s.Split(['\n']);
  h := High(Lines);
  rlines := [];
  SetLength(rlines, h + 1);
  for i := 0 to h do
  begin
    rlines[i] := '';
    for j := 0 to h do
      rlines[i] += Lines[j][i + 1];
  end;
  Result := string.Join('\n', rlines);
end;

function SelfieAndDiag1(s: string): string;
var
  Lines, rlines: TStrArray;
  i, j, h: integer;
begin
  Lines := s.Split(['\n']);
  h := High(Lines);
  rlines := [];
  SetLength(rlines, h + 1);
  for i := 0 to h do
  begin
    rlines[i] := Lines[i] + '|';
    for j := 0 to h do
      rlines[i] += Lines[j][i + 1];
  end;
  Result := string.Join('\n', rlines);
end;

function Oper(f: TFunctionParameter; s: string): string;
begin
  Result := f(s);
end;

end.
