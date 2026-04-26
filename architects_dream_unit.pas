{
6 kyu
Architect's Dream: drawing curves, observing, thinking
https://www.codewars.com/kata/5db19d503ec3790012690c11
}

unit architects_dream_unit;

{$mode objfpc}{$H+}

interface

function Weight(n, w: int64): double;

implementation

function Weight(n, w: int64): double;
const
  eminus2 = exp(-2.0);
var
  area: double = 0.14849853757254047;
  areasum: double;
  i: int64;
begin
  areasum := area;
  for i := 2 to n do
  begin
    area := area * eminus2;
    areasum += area;
  end;
  Result := areasum * w;
end;

end.
