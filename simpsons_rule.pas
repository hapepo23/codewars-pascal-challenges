{
6 kyu
Simpson's Rule - Approximate Integration
https://www.codewars.com/kata/565abd876ed46506d600000d
}

program simpsons_rule;

{$mode objfpc}{$H+}

uses
  simpsons_rule_unit;

  procedure DoTest(n: int64; Expected: double);
  var
    Actual: double;
  const
    merr: double = 1e-10;
  begin
    Actual := Simpson(n);
    writeln('n        :  ', n);
    writeln('Expected :', Expected: 14: 10);
    writeln('Actual   :', Actual: 14: 10);
    if Abs(Expected - Actual) < merr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(290, 1.9999999986);
  DoTest(72, 1.9999996367);
  DoTest(252, 1.9999999976);
end.
