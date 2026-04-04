{
6 kyu
How Much?
https://www.codewars.com/kata/55b4d87a3766d9873a0000d4
}

unit how_much_unit;

{$mode objfpc}{$H+}

interface

function Howmuch(m, n: int64): string;

implementation

uses
  SysUtils;

function Howmuch(m, n: int64): string;
var
  f: int64;
begin
  if n < m then
  begin
    f := n;
    n := m;
    m := f;
  end;
  Result := '[';
  for f := m to n do
  begin
    if ((f - 1) mod 9 = 0) and ((f - 2) mod 7 = 0) then
      Result += '[M: ' + IntToStr(f) + ' B: ' + IntToStr((f - 2) div 7) +
        ' C: ' + IntToStr((f - 1) div 9) + ']';
  end;
  Result += ']';
end;

end.
