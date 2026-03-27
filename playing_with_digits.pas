{
6 kyu
Playing with digits
https://www.codewars.com/kata/5552101f47fc5178b1000050
}

program playing_with_digits;

{$mode objfpc}{$H+}

uses
  playing_with_digits_unit;

  procedure DoTest(n, p: int64; expected: int64);
  var
    actual: int64;
  begin
    actual := DigPow(n, p);
    writeln('n       : ', n);
    writeln('p       : ', p);
    writeln('Expected: ', expected);
    writeln('Actual  : ', actual);
    if expected = actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(89, 1, 1);
  DoTest(92, 1, -1);
  DoTest(46288, 3, 51);
  DoTest(114, 3, 9);
  DoTest(46288, 5, -1);
end.
