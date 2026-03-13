{
7 kyu
Drying Potatoes
https://www.codewars.com/kata/58ce8725c835848ad6000007
}

unit drying_potatoes_unit;

{$mode objfpc}{$H+}

interface

function Potatoes(p0, w0, p1: int64): int64;

implementation

function Potatoes(p0, w0, p1: int64): int64;
begin
  Result := Trunc(w0 * (100 - p0) / (100 - p1));
end;

end.
