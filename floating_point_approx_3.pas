{
7 kyu
Floating-point Approximation (III)
https://www.codewars.com/kata/5b0c0ec907756ffcff00006e
}

program floating_point_approx_3;

{$mode objfpc}{$H+}

uses
  floating_point_approx_3_unit;

  procedure DoTest(a, b, c: double);
  var
    Actual, y: double;
    inrange, smallest: boolean;
  begin
    Actual := Quadratic(a, b, c);
    smallest := Abs(actual) < 1e-1;
    y := a * Actual * Actual + b * Actual + c;
    inrange := Abs(y) <= 1e-12;
    writeln('a       : ', a);
    writeln('b       : ', b);
    writeln('c       : ', c);
    writeln('Actual  : ', Actual);
    writeln('y       : ', y);
    if smallest = False then
      writeln('This root is not the good one');
    if inrange then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(7, 4.00e+13, 8);
  DoTest(9, 1.00e+14, 1);
  DoTest(3, 3.00e+09, 1);
  DoTest(7, 4.00e+09, 7);
  DoTest(7, 1.00e+08, 7);
end.
