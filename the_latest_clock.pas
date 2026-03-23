{
6 kyu
The latest clock
https://www.codewars.com/kata/58925dcb71f43f30cd00005f
}

program the_latest_clock;

{$mode objfpc}{$H+}

uses
  the_latest_clock_unit;

  procedure DoTest(a, b, c, d: integer; Expected: string);
  var
    Actual: string;
  begin
    Actual := LatestClock(a, b, c, d);
    writeln('a,b,c,d : ', a, ', ', b, ', ', c, ', ', d);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 9, 8, 3, '19:38');
  DoTest(9, 1, 2, 5, '21:59');
  DoTest(9, 9, 9, 5, '--:--');
  DoTest(0, 0, 1, 0, '10:00');
  DoTest(0, 0, 0, 0, '00:00');
  DoTest(9, 5, 3, 2, '23:59');
end.
