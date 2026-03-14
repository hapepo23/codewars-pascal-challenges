{
6 kyu
ASCII Fun #1: X-Shape
https://www.codewars.com/kata/5906436806d25f846400009b
}

unit x_shape_unit;

{$mode objfpc}{$H+}

interface

function X(n: int64): string;

implementation

uses
  StrUtils;

function DoXLine(n, Width: int64): string;
var
  leftright, line: string;
begin
  if n < Width then
    leftright := DupeString('□', (Width - n) div 2)
  else
    leftright := '';
  if n = 1 then
    Result := leftright + '■' + leftright
  else
  begin
    line := leftright + '■' + DupeString('□', n - 2) + '■' + leftright;
    Result := line + '\n' + DoXLine(n - 2, Width) + '\n' + line;
  end;
end;

function X(n: int64): string;
begin
  Result := DoXLine(n, n);
end;

end.
