{
5 kyu
Buddy Pairs
https://www.codewars.com/kata/59ccf051dcc4050f7800008f
}

unit buddy_pairs_unit;

{$mode objfpc}{$H+}

interface

type
  TBuddy = array [0..1] of int64;

const
  noBuddy: TBuddy = (-1, -1);

function Buddy(start, limit: int64): TBuddy;

implementation

function SumDivisors(n: int64): int64;
var
  i, sum: int64;
begin
  if n <= 1 then
    Exit(0);
  sum := 1;
  i := 2;
  while i * i <= n do
  begin
    if n mod i = 0 then
    begin
      sum := sum + i;
      if i <> n div i then
        sum := sum + (n div i);
    end;
    Inc(i);
  end;
  Result := sum;
end;

function Buddy(start, limit: int64): TBuddy;
var
  n, m: int64;
begin
  for n := start to limit do
  begin
    m := SumDivisors(n) - 1;
    if m > n then
    begin
      if SumDivisors(m) = n + 1 then
      begin
        Result[0] := n;
        Result[1] := m;
        Exit(Result);
      end;
    end;
  end;
  Result := noBuddy;
end;

end.
