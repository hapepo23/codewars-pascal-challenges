{
6 kyu
Build a pile of Cubes
https://www.codewars.com/kata/5592e3bd57b64d00f3000047
}

unit pile_of_cubes_unit;

{$mode objfpc}{$H+}

interface

function FindNb(m: int64): int64;

implementation

function FindNb(m: int64): int64;
var
  sqrt_m, d: int64;
begin
  { Sum S of cubes = 1³+2³+3³+...+n³ = (n*(n+1)/2)².
    n with a given sum S is the solution of the
    quadratic equation n² + n - 2*sqrt(S) = 0.
    ==> n = (-1 + sqrt(1 + 8*sqrt(S))) / 2  }
  sqrt_m := Trunc(Sqrt(m));
  if sqrt_m * sqrt_m <> m then
    Exit(-1);
  d := 1 + 8 * sqrt_m;
  if Trunc(Sqrt(d)) * Trunc(Sqrt(d)) <> d then
    Exit(-1);
  Result := (-1 + Trunc(Sqrt(d))) div 2;
  if Sqr(Result * (Result + 1) div 2) <> m then
    Result := -1;
end;

end.
