{
5 kyu
k-Primes
https://www.codewars.com/kata/5726f813c8dcebf5ed000a6b
}

unit k_primes_unit;

{$mode objfpc}{$H+}

interface

type
  IntegerArray = array of int64;

function CountKprimes(k, start, nd: int64): IntegerArray;
function Puzzle(s: int64): int64;

implementation

function CountPrimeFactors(n: int64): int64;
var
  Count, i: int64;
begin
  Count := 0;
  i := 2;
  while i * i <= n do
  begin
    while (n mod i = 0) do
    begin
      Inc(Count);
      n := n div i;
    end;
    Inc(i);
  end;
  if n > 1 then
    Inc(Count);
  Result := Count;
end;

function CountKprimes(k, start, nd: int64): IntegerArray;
var
  i, l, s: int64;
begin
  Result := [];
  l := 0;
  s := 200;
  SetLength(Result, s);
  for i := start to nd do
  begin
    if CountPrimeFactors(i) = k then
    begin
      Inc(l);
      if l > s then
      begin
        s := s * 2;
        SetLength(Result, s);
      end;
      Result[l - 1] := i;
    end;
  end;
  SetLength(Result, l);
end;

function Puzzle(s: int64): int64;
var
  i, j, sum: int64;
  omg, frq, P1, P3, P7: IntegerArray;
begin
  SetLength(omg, s + 1);
  SetLength(frq, s + 1);
  for i := 0 to s do
    omg[i] := 0;
  for i := 2 to s do
  begin
    if omg[i] = 0 then
    begin
      for j := i to s do
      begin
        sum := j;
        while sum mod i = 0 do
        begin
          omg[j] := omg[j] + 1;
          sum := sum div i;
        end;
      end;
    end;
  end;
  SetLength(P1, 0);
  SetLength(P3, 0);
  SetLength(P7, 0);
  for i := 2 to s do
  begin
    if omg[i] = 1 then
    begin
      SetLength(P1, Length(P1) + 1);
      P1[High(P1)] := i;
    end
    else if omg[i] = 3 then
    begin
      SetLength(P3, Length(P3) + 1);
      P3[High(P3)] := i;
    end
    else if omg[i] = 7 then
    begin
      SetLength(P7, Length(P7) + 1);
      P7[High(P7)] := i;
    end;
  end;
  for i := 0 to s do
    frq[i] := 0;
  for i := 0 to High(P3) do
    for j := 0 to High(P7) do
    begin
      sum := P3[i] + P7[j];
      if sum <= s then
        frq[sum] := frq[sum] + 1;
    end;
  Result := 0;
  for i := 0 to High(P1) do
    if P1[i] <= s then
      Result := Result + frq[s - P1[i]];
end;

end.
