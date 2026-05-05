{
5 kyu
Factorial decomposition
https://www.codewars.com/kata/5a045fee46d843effa000070
}

unit factorial_decomposition_unit;

{$mode objfpc}{$H+}

interface

function Decomp(n: int64): string;

implementation

uses
  SysUtils;

type
  IntegerArray = array of int64;

var
  fac: IntegerArray;

procedure factors(n: int64);
var
  dv: int64 = 2;
  dvmax: int64;
begin
  dvmax := Trunc(Sqrt(n));
  while dv <= dvmax do
    if (n mod dv) = 0 then
    begin
      Inc(fac[dv]);
      n := n div dv;
      dvmax := Trunc(Sqrt(n));
    end
    else
      Inc(dv);
  Inc(fac[n]);
end;

function Decomp(n: int64): string;
var
  i: int64;
begin
  fac := [];
  SetLength(fac, n + 1);
  for i := 0 to n do
    fac[i] := 0;
  for i := 2 to n do
    factors(i);
  Result := '';
  for i := 0 to n do
    if fac[i] > 0 then
      if fac[i] = 1 then
        Result += IntToStr(i) + ' * '
      else
        Result += IntToStr(i) + '^' + IntToStr(fac[i]) + ' * ';
  Result := Copy(Result, 1, Length(Result) - 3);
end;

end.
