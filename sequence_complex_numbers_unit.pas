{
6 kyu
Experimenting with a sequence of complex numbers
https://www.codewars.com/kata/5b06c990908b7eea73000069
}

unit sequence_complex_numbers_unit;

{$mode objfpc}{$H+}

interface

uses
  ucomplex;

function F(z: complex; eps: double): int64;

implementation

uses
  Math;

function F(z: complex; eps: double): int64;
var
  r, n_real: double;
begin
  r := Sqrt(Sqr(z.Re) + Sqr(z.Im));
  if r >= 1.0 then
    Exit(-1);
  if r = 0.0 then
    Exit(0);
  n_real := Ln(eps) / Ln(r);
  Result := Ceil(n_real) - 1;
  if Result < 0 then
    Result := 0;
end;

end.
