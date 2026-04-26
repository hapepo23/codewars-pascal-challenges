{
5 kyu
Getting along with Bernoulli's numbers
https://www.codewars.com/kata/5a02cf76c9fc0ee71d0000d5
}

program getting_along_with_bernoulli_numbers;

{$mode objfpc}{$H+}

uses
  SysUtils,
  getting_along_with_bernoulli_numbers_unit;

  procedure DoTest(k, nb: int64; Expected: double);
  var
    Actual: double;
  begin
    Actual := Series(k, nb);
    writeln('k       : ', k);
    writeln('nb      : ', nb);
    writeln('Expected: ', Format('%.15g', [Expected]));
    writeln('Actual  : ', Format('%.15g', [Actual]));
    if Abs(Expected - Actual) < 1e-6 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(3, 100000, 1.20205690310973);
  DoTest(-11, 0, 0.0210927960927961);
  DoTest(-9, 0, -0.007575757575757576);
  DoTest(-12, 0, 0);
  DoTest(-29, 0, -20052695.7966881);
  DoTest(-27, 0, 974936.823850575);
  DoTest(-25, 0, -54827.5833333333);
  DoTest(-23, 0, 3607.51054639805);
  DoTest(-21, 0, -281.460144927536);
  DoTest(-19, 0, 26.4562121212121);
  DoTest(-17, 0, -3.05395433027012);
  DoTest(-15, 0, 0.443259803921569);
  DoTest(2, 0, 1.64493406684823);
  DoTest(4, 0, 1.08232323371114);
  DoTest(6, 0, 1.01734306198445);
  DoTest(8, 0, 1.00407735619794);
  DoTest(10, 0, 1.00099457512782);
end.
