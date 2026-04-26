{
6 kyu
Disease Spread
https://www.codewars.com/kata/566543703c72200f0b0000c9
}

unit disease_spread_unit;

{$mode objfpc}{$H+}

interface

function Epidemic(tm, n, s0, i0: int64; b, a: double): int64;

implementation

function Epidemic(tm, n, s0, i0: int64; b, a: double): int64;
var
  dt, maxi, susc, inf, prod: double;
  i: int64;
begin
  dt := tm / n;
  maxi := 0.0;
  susc := s0;
  inf := i0;
  for i := 1 to n do
  begin
    prod := b * susc * inf;
    susc := susc - dt * prod;
    inf := inf + dt * (prod - a * inf);
    if inf > maxi then
      maxi := inf;
    if inf < maxi then
      Break;
  end;
  Result := Trunc(maxi);
end;

end.
