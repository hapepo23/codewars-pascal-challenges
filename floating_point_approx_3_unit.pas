{
7 kyu
Floating-point Approximation (III)
https://www.codewars.com/kata/5b0c0ec907756ffcff00006e
}

unit floating_point_approx_3_unit;

{$mode objfpc}{$H+}

interface

function Quadratic(a, b, c: double): double;

implementation

function Quadratic(a, b, c: double): double;
begin
  Result := (-b + Sqrt(b * b - 4 * a * c)) / (2 * a);
  { Asymptotic approximation (when b is extremely large) }
  if b >= 1e8 then
    Result := -c / b;
end;

end.
