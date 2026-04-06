{
6 kyu
Backwards Read Primes
https://www.codewars.com/kata/5539fecef69c483c5a000015
}

unit backwards_read_primes_unit;

{$mode objfpc}{$H+}

interface

type
  IntegerArray = array of int64;

function BackwardsPrime(start, nd: int64): IntegerArray;

implementation

function IsPrime(n: int64): boolean;
var
  i: int64 = 3;
begin
  if n < 2 then
    Exit(False);
  if n = 2 then
    Exit(True);
  if n mod 2 = 0 then
    Exit(False);
  while i * i <= n do
  begin
    if n mod i = 0 then
      Exit(False);
    Inc(i, 2);
  end;
  Result := True;
end;

function ReverseNumber(n: int64): int64;
var
  rev: int64 = 0;
begin
  while n > 0 do
  begin
    rev := rev * 10 + (n mod 10);
    n := n div 10;
  end;
  Result := rev;
end;

function BackwardsPrime(start, nd: int64): IntegerArray;
var
  i, rev: int64;
  temp: array of int64 = nil;
  Count: integer = 0;
begin
  SetLength(temp, 0);
  for i := start to nd do
  begin
    if IsPrime(i) then
    begin
      rev := ReverseNumber(i);
      if (rev <> i) and IsPrime(rev) then
      begin
        SetLength(temp, Count + 1);
        temp[Count] := i;
        Inc(Count);
      end;
    end;
  end;
  Result := temp;
  temp := nil;
end;

end.
