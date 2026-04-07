{
5 kyu
Gap in Primes
https://www.codewars.com/kata/561e9c843a2ef5a40c0000a4
}

unit gap_in_primes_unit;

{$mode objfpc}{$H+}

interface

type
  TGap = array [0..1] of int64;

function Gap(g, m, n: int64): TGap;

implementation

const
  noGap: TGap = (0, 0);

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

function Gap(g, m, n: int64): TGap;
var
  lastprime: int64 = 0;
  i: int64;
begin
  Result := noGap;
  for i := m to n do
    if IsPrime(i) then
    begin
      if lastprime <> 0 then
        if i = lastprime + g then
        begin
          Result[0] := lastprime;
          Result[1] := i;
          Exit(Result);
        end;
      lastprime := i;
    end;
end;

end.
