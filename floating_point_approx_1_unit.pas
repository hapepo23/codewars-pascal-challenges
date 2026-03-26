{
6 kyu
Floating-point Approximation (I)
https://www.codewars.com/kata/58184387d14fc32f2b0012b2
}

unit floating_point_approx_1_unit;

{$mode objfpc}{$H+}

interface

function F(x: double): double;

implementation

function F(x: double): double;
begin
  { Algebraic reformulation of sqrt(1+x)-1 to x/(sqrt(1+x)+1)
    This form avoids subtracting nearly equal numbers and is
    much more numerically stable. }
  Result := x / (sqrt(1 + x) + 1);
end;

end.

