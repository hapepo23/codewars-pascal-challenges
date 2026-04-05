{
6 kyu
Steps in Primes
https://www.codewars.com/kata/5613d06cee1e7da6d5000055
}

unit steps_in_primes_unit;

{$mode objfpc}{$H+}

interface

type
  IntegerArray = array of int64;

function Step(g, start, nd: int64): IntegerArray;

implementation

function IsPrime(n: int64): boolean;
var
  i: int64;
begin
  if n <= 1 then
    Exit(False);
  if n = 2 then
    Exit(True);
  if (n mod 2) = 0 then
    Exit(False);
  i := 3;
  while i * i <= n do
  begin
    if (n mod i) = 0 then
      Exit(False);
    i += 2;
  end;
  Result := True;
end;

function Step(g, start, nd: int64): IntegerArray;
var
  i: int64;
begin
  Result := [];
  i := start;
  while i <= nd - g do
  begin
    if IsPrime(i) then
      if IsPrime(i + g) then
      begin
        SetLength(Result, 2);
        Result[0] := i;
        Result[1] := i + g;
        Exit(Result);
      end;
    Inc(i);
  end;
end;

end.
