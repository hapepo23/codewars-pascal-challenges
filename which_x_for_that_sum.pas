{
5 kyu
Which x for that sum?
https://www.codewars.com/kata/5b1cd19fcd206af728000056
}

program which_x_for_that_sum;

{$mode objfpc}{$H+}

uses
  SysUtils,
  which_x_for_that_sum_unit;

  procedure DoTest(m: double; Expected: double);
  var
    Actual: double;
  begin
    Actual := Solve(m);
    writeln('m       : ', Format('%.15g', [m]));
    writeln('Expected: ', Format('%.15g', [Expected]));
    writeln('Actual  : ', Format('%.15g', [Actual]));
    if Abs(Expected - Actual) < 1e-12 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2.00, 0.5);
  DoTest(4.00, 0.609611796797792);
  DoTest(5.00, 0.641742430504416);
  DoTest(6.00, 0.666666666666667);
  DoTest(8.00, 0.703464834591373);
end.
