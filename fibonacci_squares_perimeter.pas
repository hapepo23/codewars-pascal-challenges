{
5 kyu
Perimeter of squares in a rectangle
https://www.codewars.com/kata/559a28007caad2ac4e000083
}

program fibonacci_squares_perimeter;

{$mode objfpc}{$H+}

uses
  fibonacci_squares_perimeter_unit;

  procedure DoTest(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Perimeter(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0, 4);
  DoTest(5, 80);
  DoTest(7, 216);
  DoTest(20, 114624);
  DoTest(30, 14098308);
end.
