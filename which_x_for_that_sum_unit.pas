{
5 kyu
Which x for that sum?
https://www.codewars.com/kata/5b1cd19fcd206af728000056
}

unit which_x_for_that_sum_unit;

{$mode objfpc}{$H+}

interface

function Solve(m: double): double;

implementation

function Solve(m: double): double;
begin
  { sum(k*x^k) = x/(1-x)² -> solve m=x/(1-x)² for x
    -> Solution as follows: }
  Result := ((2.0 * m + 1.0) - Sqrt(4.0 * m + 1.0)) / (2.0 * m);
end;

end.
