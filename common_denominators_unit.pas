{
5 kyu
Common Denominators
https://www.codewars.com/kata/54d7660d2daf68c619000d95
}

unit common_denominators_unit;

{$mode objfpc}{$H+}

interface

type
  TArr2D = array of array of int64;

function ConvertFrac(ls: TArr2D): TArr2D;

implementation

function GreatestCommonDivisor(m, n: int64): int64;
var
  tmp: int64;
begin
  while m > 0 do
  begin
    tmp := n mod m;
    n := m;
    m := tmp;
  end;
  Result := n;
end;

function LeastCommonMultiple(m, n: int64): int64;
begin
  Result := n * (m div GreatestCommonDivisor(m, n));
end;

function ConvertFrac(ls: TArr2D): TArr2D;
var
  l, i, dv, lcm: int64;
begin
  l := Length(ls);
  Result := [[]];
  SetLength(Result, l, 2);
  for i := 0 to l - 1 do
  begin
    dv := GreatestCommonDivisor(ls[i][0], ls[i][1]);
    Result[i][0] := ls[i][0] div dv;
    Result[i][1] := ls[i][1] div dv;
  end;
  lcm := Result[0][1];
  for i := 1 to l - 1 do
    lcm := LeastCommonMultiple(lcm, Result[i][1]);
  for i := 0 to l - 1 do
  begin
    Result[i][0] := Result[i][0] * lcm div Result[i][1];
    Result[i][1] := lcm;
  end;
end;

end.
