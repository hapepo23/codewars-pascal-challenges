{
6 kyu
Easy Diagonal
https://www.codewars.com/kata/559b8e46fa060b2c6a0000bf
}

unit easy_diagonal_unit;

{$mode objfpc}{$H+}

interface

function Diagonal(n, p: int64): int64;

implementation

function Binom(n, k: int64): int64;
var
  i, r: int64;
begin
  if k > n then
    r := 0
  else
  begin
    if k > n - k then
      k := n - k;
    r := 1;
    for i := 1 to k do
      r := r * (n - k + i) div i;
  end;
  Result := r;
end;

function Diagonal(n, p: int64): int64;
var
  i: int64;
begin
  Result := 0;
  for i := p to n do
    Result := Result + Binom(i, p);
end;

end.
