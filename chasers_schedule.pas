{
6 kyu
Chaser's schedule
https://www.codewars.com/kata/628df6b29070907ecb3c2d83
}

program chasers_schedule;

{$mode objfpc}{$H+}

uses
  chasers_schedule_unit;

  procedure DoTest(s, t, Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Sprint(s, t);
    writeln('Speed   : ', s);
    writeln('Duration: ', t);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2, 4, 10);
  DoTest(1, 1, 2);
  DoTest(2, 3, 8);
  DoTest(49, 50, 2875);
  DoTest(22, 10, 300);
end.
