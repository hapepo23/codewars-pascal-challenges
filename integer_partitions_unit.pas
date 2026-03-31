{
4 kyu
Getting along with Integer Partitions
https://www.codewars.com/kata/55cf3b567fc0e02b0b00000b
}

unit integer_partitions_unit;

{$mode objfpc}{$H+}

interface

function Part(n: int64): string;

implementation

uses
  SysUtils,
  Generics.Collections;

function Part(n: int64): string;
var
  p: array of int64;
  prod: array of int64;
  k, rem, val, j, prd, lprod: int64;
  found: boolean;
  med, avg: double;
begin
  p := [];
  prod := [];
  lprod := 0;
  SetLength(p, n);
  p[0] := n;
  k := 1;
  while True do
  begin
    prd := 1;
    for j := 0 to k - 1 do
      prd *= p[j];
    found := False;
    for j := 0 to lprod - 1 do
      if prd = prod[j] then
      begin
        found := True;
        Break;
      end;
    if not found then
    begin
      Inc(lprod);
      SetLength(prod, lprod);
      prod[lprod - 1] := prd;
    end;
    rem := 0;
    while (k > 0) and (p[k - 1] = 1) do
    begin
      rem := rem + p[k - 1];
      k := k - 1;
    end;
    if k = 0 then
      Break;
    p[k - 1] := p[k - 1] - 1;
    rem := rem + 1;
    val := p[k - 1];
    while rem > val do
    begin
      p[k] := val;
      rem := rem - val;
      k := k + 1;
    end;
    p[k] := rem;
    k := k + 1;
  end;
  specialize TArrayHelper<int64>.Sort(prod);
  avg := 0.0;
  for j := 0 to lprod - 1 do
    avg += prod[j];
  avg /= lprod;
  if lprod mod 2 = 1 then
    med := prod[(lprod - 1) div 2]
  else
    med := (prod[(lprod - 1) div 2] + prod[((lprod - 1)) div 2 + 1]) / 2.0;
  Result := 'Range: ' + IntToStr(prod[lprod - 1] - prod[0]) +
    ' Average: ' + Format('%f', [avg]) + ' Median: ' + Format('%f', [med]);
end;

end.
