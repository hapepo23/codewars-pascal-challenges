{
5 kyu
Weight for weight
https://www.codewars.com/kata/55c6126177c9441a570000cc
}

program weight_for_weight;

{$mode objfpc}{$H+}

uses
  weight_for_weight_unit;

  procedure DoTest(s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := OrderWeight(s);
    writeln('String s: ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('103  123 4444 99 2000', '2000 103 123 4444 99');
  DoTest('2000 10003 1234000 44444444 9999 11 11 22 123',
    '11 11 2000 10003 22 123 1234000 44444444 9999');
  DoTest('', '');
  DoTest('10003 1234000 44444444 9999 2000 123456789',
    '2000 10003 1234000 44444444 9999 123456789');
  DoTest('3 16 9 38 95 1131268 49455 347464 59544965313 496636983114762 85246814996697',
    '3 16 9 38 95 1131268 49455 347464 59544965313 496636983114762 85246814996697');
end.
