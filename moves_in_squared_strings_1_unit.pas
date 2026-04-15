{
7 kyu
Moves in squared strings (I)
https://www.codewars.com/kata/56dbe0e313c2f63be4000b25
}

unit moves_in_squared_strings_1_unit;

{$mode objfpc}{$H+}

interface

type
  TFunctionParameter = function(s: string): string;

function HorMirror(s: string): string;
function VertMirror(s: string): string;
function Oper(f: TFunctionParameter; s: string): string;

implementation

uses
  SysUtils,
  StrUtils;

type
  TStrArray = array of string;

function HorMirror(s: string): string;
var
  Lines, rlines: TStrArray;
  i, h: integer;
begin
  Lines := s.Split(['\n']);
  h := High(Lines);
  rlines := [];
  SetLength(rlines, h + 1);
  for i := 0 to h do
    rlines[i] := Lines[h - i];
  Result := string.Join('\n', rlines);
end;

function VertMirror(s: string): string;
var
  Lines: TStrArray;
  i: integer;
begin
  Lines := s.Split(['\n']);
  for i := 0 to High(Lines) do
    Lines[i] := ReverseString(Lines[i]);
  Result := string.Join('\n', Lines);
end;

function Oper(f: TFunctionParameter; s: string): string;
begin
  Result := f(s);
end;

end.
