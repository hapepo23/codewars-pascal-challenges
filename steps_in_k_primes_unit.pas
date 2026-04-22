{
6 kyu
Steps in k-primes
https://www.codewars.com/kata/5a48948e145c46820b00002f
}

unit steps_in_k_primes_unit;

{$mode objfpc}{$H+}

interface

type
  TStepArray = array of array[0..1] of int64;

function KprimesStep(k, step, start, nd: int64): TStepArray;

implementation

function CountPF(n: int64): int64;
var
  i: int64 = 2;
begin
  Result := 0;
  while i * i <= n do
  begin
    while (n mod i = 0) do
    begin
      Inc(Result);
      n := n div i;
    end;
    Inc(i);
  end;
  if n > 1 then
    Inc(Result);
end;

function KprimesStep(k, step, start, nd: int64): TStepArray;
var
  i, llist: int64;
  list: array of boolean = ();
begin
  llist := nd - start + 1;
  SetLength(list, llist);
  for i := start to nd do
    list[i - start] := (CountPF(i) = k);
  Result := [];
  for i := 0 to llist - 1 - step do
    if list[i] and list[i + step] then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)][0] := start + i;
      Result[High(Result)][1] := start + i + step;
    end;
end;

end.
