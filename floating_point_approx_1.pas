{
6 kyu
Floating-point Approximation (I)
https://www.codewars.com/kata/58184387d14fc32f2b0012b2
}

program floating_point_approx_1;

{$mode objfpc}{$H+}

uses
  floating_point_approx_1_unit;

  procedure DoTest(x: double; Expected: double);
  var
    Actual: double;
  begin
    Actual := F(x);
    writeln('x       : ', x);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Abs(Expected - Actual) / Expected < 1.0e-12 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2.6e-08, 1.29999999155e-08);
  DoTest(2.6e-08, 1.29999999155e-08);
  DoTest(1.4e-09, 6.999999997549999e-10);
  DoTest(5.0e-06, 2.499996875007812e-06);
end.

