{
6 kyu
Moves in squared strings (II)
https://www.codewars.com/kata/56dbe7f113c2f63570000b86
}

unit moves_in_squared_strings_2_unit;

{$mode objfpc}{$H+}

interface

type
  TFunctionParameter = function(s: string): string;

function Rot(s: string): string;
function SelfieAndRot(s: string): string;
function Oper(f: TFunctionParameter; s: string): string;

implementation

uses
  SysUtils,
  StrUtils;

type
  TStrArray = array of string;

function Rot(s: string): string;
var
  Lines, rlines: TStrArray;
  i, h: integer;
begin
  Lines := s.Split(['\n']);
  h := High(Lines);
  rlines := [];
  SetLength(rlines, h + 1);
  for i := 0 to h do
    rlines[i] := ReverseString(Lines[h - i]);
  Result := string.Join('\n', rlines);
end;

function SelfieAndRot(s: string): string;
var
  Lines, rlines: TStrArray;
  i, h: integer;
begin
  Lines := s.Split(['\n']);
  h := High(Lines);
  rlines := [];
  SetLength(rlines, 2 * (h + 1));
  for i := 0 to h do
    rlines[i] := Lines[i] + DupeString('.', h + 1);
  for i := 0 to h do
    rlines[i + h + 1] := ReverseString(rlines[h - i]);
  Result := string.Join('\n', rlines);
end;

function Oper(f: TFunctionParameter; s: string): string;
begin
  Result := f(s);
end;

end.
