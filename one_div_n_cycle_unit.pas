{
6 kyu
1/n-Cycle
https://www.codewars.com/kata/5a057ec846d843c81a0000ad
}

unit one_div_n_cycle_unit;

{$mode objfpc}{$H+}

interface

function Cycle(n: int64): int64;

implementation

function GCD(a, b: int64): int64;
begin
  while b <> 0 do
  begin
    a := a mod b;
    a := a + b;
    b := a - b;
    a := a - b;
  end;
  Result := a;
end;

function ModPow(base, exp, modn: int64): int64;
begin
  Result := 1;
  base := base mod modn;
  while exp > 0 do
  begin
    if (exp and 1) = 1 then
      Result := (Result * base) mod modn;
    base := (base * base) mod modn;
    exp := exp shr 1;
  end;
end;

function PhiF(n: int64): int64;
var
  i: int64;
begin
  Result := n;
  i := 2;
  while i * i <= n do
  begin
    if n mod i = 0 then
    begin
      while n mod i = 0 do
        n := n div i;
      Result := Result - Result div i;
    end;
    Inc(i);
  end;
  if n > 1 then
    Result := Result - Result div n;
end;

function Cycle(n: int64): int64;
var
  phi, k, i: int64;
begin
  if GCD(n, 10) <> 1 then
    Exit(-1);
  phi := PhiF(n);
  for i := 1 to phi do
    if (phi mod i = 0) then
      if ModPow(10, i, n) = 1 then
        Exit(i);
  Result := phi; // should rarely happen
end;

end.
