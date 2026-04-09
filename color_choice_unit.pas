{
6 kyu
Color Choice
https://www.codewars.com/kata/55be10de92aad5ef28000023
}

unit color_choice_unit;

{$mode objfpc}{$H+}

interface

function CheckChoose(m, n: int64): int64;

implementation

uses
  Math;

function Binom(n, k, limit: int64): int64;
var
  i: int64;
begin
  { Compute C(n, k), but stop if it exceeds limit }
  if k > n then
    Exit(0);
  k := Min(k, n - k);
  Result := 1;
  for i := 1 to k do
  begin
    Result := Result * (n - k + i) div i;
    if Result > limit then
      Exit(limit + 1);
  end;
end;

function CheckChoose(m, n: int64): int64;
var
  left, right, mid, val: int64;
begin
  if m = 1 then
    Exit(0);
  left := 0;
  right := n div 2;
  Result := -1;
  { Binary search }
  while left <= right do
  begin
    mid := (left + right) div 2;
    val := Binom(n, mid, m);
    if val = m then
    begin
      Result := mid;
      right := mid - 1;
    end
    else if val < m then
      left := mid + 1
    else
      right := mid - 1;
  end;
end;

end.
