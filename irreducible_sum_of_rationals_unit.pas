{
6 kyu
Irreducible Sum of Rationals
https://www.codewars.com/kata/5517fcb0236c8826940003c9
}

unit irreducible_sum_of_rationals_unit;

{$mode objfpc}{$H+}

interface

type
  TArr2D = array of array of int64;
  TNumDen = array [0..1] of int64;

function SumFracts(l: TArr2D): TNumDen;

implementation

function GCD(a, b: int64): int64;
begin
  while b <> 0 do
  begin
    a := a mod b;
    if a = 0 then
      Exit(b);
    b := b mod a;
  end;
  Result := a;
end;

function LCM(a, b: int64): int64;
begin
  Result := a div GCD(a, b);
  Result *= b;
end;

function SumFracts(l: TArr2D): TNumDen;
var
  i, g, ll: int64;
begin
  Result[0] := 0;
  Result[1] := 1;
  for i := 0 to High(l) do
  begin
    ll := LCM(Result[1], l[i][1]);
    Result[0] := (ll div Result[1]) * Result[0] +
      (ll div l[i][1]) * l[i][0];
    Result[1] := ll;
    g := GCD(Result[0], Result[1]);
    Result[0] := Result[0] div g;
    Result[1] := Result[1] div g;
  end;
end;

end.
