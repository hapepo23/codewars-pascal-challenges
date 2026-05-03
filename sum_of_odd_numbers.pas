{
7 kyu
Sum of odd numbers
https://www.codewars.com/kata/55fd2d567d94ac3bc9000064
}

program sum_of_odd_numbers;

{$mode objfpc}{$H+}

uses
  sum_of_odd_numbers_unit;

  procedure DoTest(n: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := RowSumOddNumbers(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1);
  DoTest(2, 8);
  DoTest(3, 27);
  DoTest(42, 74088);
  DoTest(100, 1000000);
  DoTest(300, 27000000);
end.
