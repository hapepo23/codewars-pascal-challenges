{
5 kyu
Primes in numbers
https://www.codewars.com/kata/54d512e62a5e54c96200019e
}

unit prime_factor_decomposition_unit;

{$mode objfpc}{$H+}

interface

function PrimeFactors(n: int64): string;

implementation

uses
  SysUtils;

var
  fac: array of array[0..1] of int64;

procedure AddFac(n: int64);
var
  l, h: integer;
begin
  l := Length(fac);
  h := l - 1;
  if (l = 0) or ((l > 0) and (n <> fac[h][0])) then
  begin
    SetLength(fac, l + 1);
    fac[l][0] := n;
    fac[l][1] := 1;
  end
  else
    Inc(fac[h][1]);
end;

function PrimeFactors(n: int64): string;
var
  dv, dvmax: int64;
  i: integer;
begin
  fac := [];
  SetLength(fac, 0);
  dv := 2;
  dvmax := Trunc(Sqrt(n));
  while dv <= dvmax do
    if n mod dv = 0 then
    begin
      AddFac(dv);
      n := n div dv;
      dvmax := Trunc(Sqrt(n));
    end
    else
      Inc(dv);
  AddFac(n);
  Result := '';
  for i := 0 to High(fac) do
  begin
    if fac[i][1] = 1 then
      Result += '(' + IntToStr(fac[i][0]) + ')'
    else
      Result += '(' + IntToStr(fac[i][0]) + '**' + IntToStr(fac[i][1]) + ')';
  end;
end;

end.
