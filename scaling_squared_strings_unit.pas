{
7 kyu
Scaling Squared Strings
https://www.codewars.com/kata/56ed20a2c4e5d69155000301
}

unit scaling_squared_strings_unit;

{$mode objfpc}{$H+}

interface

function Scale(s: string; k, n: integer): string;

implementation

uses
  SysUtils,
  StrUtils;

function Scale(s: string; k, n: integer): string;
var
  inlines, outlines: array of string;
  i, j: integer;
  temp: string;
  c: char;
begin
  if s = '' then
    Exit('');
  inlines := SplitString(s, '\n');
  outlines := [];
  SetLength(outlines, Length(inlines) * n);
  for i := 0 to High(inlines) do
  begin
    temp := '';
    for c in inlines[i] do
      temp += DupeString(c, k);
    for j := 0 to n - 1 do
      outlines[i * n + j] := temp;
  end;
  Result := string.Join('\n', outlines);
end;

end.
