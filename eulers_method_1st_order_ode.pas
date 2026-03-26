{
5 kyu
Euler's method for a first-order ODE
https://www.codewars.com/kata/56347fcfd086de8f11000014
}

program eulers_method_1st_order_ode;

{$mode objfpc}{$H+}

uses
  eulers_method_1st_order_ode_unit;

  procedure DoTest(nb: int64; Expected: double);
  var
    Actual: double;
  begin
    Actual := ExEuler(nb);
    writeln('Number of steps:  ', nb);
    writeln('Expected       : ', Expected: 10: 7);
    writeln('Actual         : ', Actual: 10: 7);
    if Abs(Actual - Expected) / Expected < 1e-6 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 0.5);
  DoTest(10, 0.026314);
  DoTest(17, 0.015193);
  DoTest(50, 0.005073);
  DoTest(100, 0.002524);
end.
