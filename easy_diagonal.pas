{
6 kyu
Easy Diagonal
https://www.codewars.com/kata/559b8e46fa060b2c6a0000bf
}

program easy_diagonal;

{$mode objfpc}{$H+}

uses
  easy_diagonal_unit;

  procedure DoTest(n, p, Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Diagonal(n, p);
    writeln('Line n    : ', n);
    writeln('Diagonal p: ', p);
    writeln('Expected  : ', Expected);
    writeln('Actual    : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(7, 0, 8);
  DoTest(7, 1, 28);
  DoTest(7, 2, 56);
  DoTest(20, 3, 5985);
  DoTest(20, 4, 20349);
  DoTest(20, 5, 54264);
  DoTest(20, 15, 20349);
end.
