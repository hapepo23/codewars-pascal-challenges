{
6 kyu
Rectangle into Squares
https://www.codewars.com/kata/55466989aeecab5aac00003e
}

program rectangle_into_squares;

{$mode objfpc}{$H+}

uses
  rectangle_into_squares_unit;

  procedure DoTest(lng, wdth: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := SqInRect(lng, wdth);
    writeln('Length  : ', lng);
    writeln('Width   : ', wdth);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(5, 3, '3 2 1 1');
  DoTest(5, 5, 'nil');
  DoTest(20, 14, '14 6 6 2 2 2');
  DoTest(14, 20, '14 6 6 2 2 2');
end.
