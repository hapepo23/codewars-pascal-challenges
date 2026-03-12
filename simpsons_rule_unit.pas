{
6 kyu
Simpson's Rule - Approximate Integration
https://www.codewars.com/kata/565abd876ed46506d600000d
}

unit simpsons_rule_unit;

{$mode objfpc}{$H+}

interface

function Simpson(n: int64): double;

implementation

function F(x: double): double;
var
  sx: double;
begin
  sx := sin(x);
  Result := 3.0 * sx * sx * sx / 2.0;
end;

function Simpson(n: int64): double;
var
  a, b, h, sum1, sum2: double;
  i, n2, n2m1: int64;
begin
  a := 0;
  b := Pi;
  n2 := n div 2;
  n2m1 := n2 - 1;
  h := (b - a) / n;
  sum1 := 0;
  for i := 1 to n2 do
    sum1 := sum1 + F(a + (2 * i - 1) * h);
  sum2 := 0;
  for i := 1 to n2m1 do
    sum2 := sum2 + F(a + 2 * i * h);
  Result := (b - a) / (3.0 * n) * (F(a) + F(b) + 4.0 * sum1 + 2.0 * sum2);
end;

end.
