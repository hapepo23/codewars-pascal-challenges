{
5 kyu
Euler's method for a first-order ODE
https://www.codewars.com/kata/56347fcfd086de8f11000014
}

unit eulers_method_1st_order_ode_unit;

{$mode objfpc}{$H+}

interface

function ExEuler(nb: int64): double;

implementation

function CalcRelErr(x, y: double): double;
var
  z: double;
begin
  z := 1 + 0.5 * exp(-4.0 * x) - 0.5 * exp(-2.0 * x);
  Result := Abs(y - z) / z;
end;

function ExEuler(nb: int64): double;
var
  i: int64;
  x, y, delta: double;
begin
  delta := 1.0 / nb;
  x := 0.0;
  y := 1.0;
  Result := 0.0;
  for i := 1 to nb do
  begin
    y := y + (2.0 - exp(-4.0 * x) - 2.0 * y) * delta;
    x := x + delta;
    Result := Result + CalcRelErr(x, y);
  end;
  Result := Trunc((Result / (nb + 1)) * 1e6) * 1e-6;
end;

end.
