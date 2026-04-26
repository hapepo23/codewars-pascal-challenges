{
5 kyu
Sections
https://www.codewars.com/kata/5da1df6d8b0f6c0026e6d58d
}

unit sections_unit;

{$mode objfpc}{$H+}

interface

function C(k: int64): int64;

implementation

function C(k: int64): int64;
  { Algorithm:
    - Simplify -> x*y = k^(3/2)
    - For x*y to be an integer, k^(3/2) must be an integer
    - That only happens when k is a perfect square
    - So first check if k is a perfect square. If not → return 0
    - Let t = sqrt(k)
    - Factorize t = p1^a1 * p2^a2 * … * pn^an
    - Then t^3 = p1^(3*a1) * p2^(3*a2) * … * pn^(3*an)
    - Compute Number of divisors: ∏ (3 * ai + 1)  }
var
  t, i: int64;
  exponent: int64;
begin
  t := Trunc(Sqrt(k));
  if t * t <> k then
    Exit(0);
  Result := 1;
  i := 2;
  while i * i <= t do
  begin
    exponent := 0;
    while (t mod i = 0) do
    begin
      t := t div i;
      Inc(exponent);
    end;
    if exponent > 0 then
      Result := Result * (3 * exponent + 1);
    Inc(i);
  end;
  if t > 1 then
    Result := Result * (3 * 1 + 1);
end;

end.
