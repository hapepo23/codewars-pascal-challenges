{
8 kyu
Even or Odd
https://www.codewars.com/kata/566fc12495810954b1000030
}

program count_the_digit;

{$mode objfpc}{$H+}

uses
  count_the_digit_unit;

  procedure DoTest(n, d: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := NbDig(n, d);
    writeln('Number  : ', n);
    writeln('Digit   : ', d);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(10, 1, 4);
  DoTest(5750, 0, 4700);
  DoTest(11011, 2, 9481);
  DoTest(12224, 8, 7733);
end.
