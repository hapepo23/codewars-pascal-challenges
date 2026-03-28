{
4 kyu
Twice linear
https://www.codewars.com/kata/5672682212c8ecf83e000050
}

program twice_linear;

{$mode objfpc}{$H+}

uses
  twice_linear_unit;

  procedure DoTest(n: int64; expected: int64);
  var
    actual: int64;
  begin
    actual := dblLinear(n);
    writeln('n       : ', n);
    writeln('Expected: ', expected);
    writeln('Actual  : ', actual);
    if expected = actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(50, 175);
  DoTest(100, 447);
  DoTest(500, 3355);
  DoTest(1000, 8488);
end.
