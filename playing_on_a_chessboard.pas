{
6 kyu
Playing on a chessboard
https://www.codewars.com/kata/55ab4f980f2d576c070000f4
}

program playing_on_a_chessboard;

{$mode objfpc}{$H+}

uses
  playing_on_a_chessboard_unit;

  procedure DoTest(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := Game(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0, '[0]');
  DoTest(1, '[1, 2]');
  DoTest(8, '[32]');
  DoTest(807, '[651249, 2]');
end.
