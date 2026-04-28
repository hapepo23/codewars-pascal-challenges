{
6 kyu
Bouncing Balls
https://www.codewars.com/kata/5544c7a5cb454edb3c000047
}

program bouncing_balls;

{$mode objfpc}{$H+}

uses
  SysUtils,
  bouncing_balls_unit;

  procedure DoTest(h, bounce, window: double; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := BouncingBall(h, bounce, window);
    writeln('h       : ', Format('%.7g', [h]));
    writeln('bounce  : ', Format('%.7g', [bounce]));
    writeln('window  : ', Format('%.7g', [window]));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(3, 0.66, 1.5, 3);
  DoTest(3, 0, 1.5, -1);
  DoTest(3, 1, 1.5, -1);
  DoTest(0, 1, 1.5, -1);
  DoTest(3, 1, 4.5, -1);
  DoTest(30, 0.66, 1.5, 15);
  DoTest(2, 0.5, 1, 1);
  DoTest(10, 0.6, 10, -1);
  DoTest(40, 1, 10, -1);
  DoTest(-5, 0.66, 1.5, -1);
end.
