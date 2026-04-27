{
8 kyu
Clock
https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a
}

program clock;

{$mode objfpc}{$H+}

uses
  clock_unit;

  procedure DoTest(H: integer; M: integer; S: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Past(H, M, S);
    writeln('Hours   : ', H);
    writeln('Minutes : ', M);
    writeln('Seconds : ', S);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0, 1, 1, 61000);
  DoTest(1, 1, 1, 3661000);
  DoTest(0, 0, 0, 0);
  DoTest(1, 0, 1, 3601000);
  DoTest(1, 0, 0, 3600000);
end.
