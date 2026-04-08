{
6 kyu
Financing Plan on Planet XY140Z-n
https://www.codewars.com/kata/559ce00b70041bc7b600013d
}

program planet_financing_plan;

{$mode objfpc}{$H+}

uses
  planet_financing_plan_unit;

  procedure DoTest(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Finance(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(5, 105);
  DoTest(6, 168);
  DoTest(7, 252);
  DoTest(365, 24513765);
  DoTest(999, 499999500);
  DoTest(2000, 4006002000);
  DoTest(5000, 62537505000);
end.
