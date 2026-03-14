{
5 kyu
Best travel
https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa
}

unit best_travel_unit;

{$mode objfpc}{$H+}

interface

type
  TInt64Array = array of int64;

function ChooseBestSum(t, k: int64; ls: TInt64Array): int64;

implementation

var  { for recursive calc. of sums of combinations in CombSums }
  sums, a: TInt64Array;
  idx, nn, kk: int64;

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

procedure CombSums(start, depth: integer; currentSum: int64);
var
  i: integer;
begin
  if depth = kk then
  begin
    sums[idx] := currentSum;
    Inc(idx);
    Exit;
  end;
  for i := start to nn - (kk - depth) do
    CombSums(i + 1, depth + 1, currentSum + a[i]);
end;

function ChooseBestSum(t, k: int64; ls: TInt64Array): int64;
var
  no_comb, i, l: int64;
begin
  l := Length(ls);
  no_comb := Binom(l, k);
  if no_comb = 0 then
    Result := -1
  else
  begin
    SetLength(sums, no_comb);
    SetLength(a, l);
    for i := 0 to l - 1 do
      a[i] := ls[i];
    idx := 0;
    nn := l;
    kk := k;
    CombSums(0, 0, 0);
    Result := 0;
    for i := 0 to Length(sums) - 1 do
      if (sums[i] <= t) and (sums[i] > Result) then
        Result := sums[i];
    if Result = 0 then
      Result := -1;
  end;
end;

end.
