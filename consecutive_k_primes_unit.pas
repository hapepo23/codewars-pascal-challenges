{
5 kyu
Consecutive k-Primes
https://www.codewars.com/kata/573182c405d14db0da00064e
}

unit consecutive_k_primes_unit;

{$mode objfpc}{$H+}

interface

type
  TInt64Array = array of int64;

function ConsecKprimes(k: int64; arr: TInt64Array): int64;

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

function ConsecKprimes(k: int64; arr: TInt64Array): int64;
var
  i: int64;
  factors: TInt64Array = nil;
begin
  Result := 0;
  SetLength(factors, Length(arr));
  for i := 0 to High(arr) do
    factors[i] := CountPF(arr[i]);
  for i := 0 to High(arr) - 1 do
    if (factors[i] = k) and (factors[i + 1] = k) then
      Inc(Result);
end;

end.
