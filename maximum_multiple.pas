{
7 kyu
Maximum Multiple
https://www.codewars.com/kata/5aba780a6a176b029800041c
}

program maximum_multiple;

{$mode objfpc}{$H+}

uses
  maximum_multiple_unit;

  procedure DoTest(d: integer; b: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := MaxMultiple(d, b);
    writeln('Divisor d: ', d);
    writeln('Bound b  : ', b);
    writeln('Expected : ', Expected);
    writeln('Actual   : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2, 7, 6);
  DoTest(3, 10, 9);
  DoTest(7, 17, 14);
  DoTest(10, 50, 50);
  DoTest(37, 200, 185);
  DoTest(7, 100, 98);
  DoTest(7, 8, 7);
end.
