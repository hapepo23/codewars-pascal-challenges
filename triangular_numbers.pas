{
7 kyu
Triangular Numbers
https://www.codewars.com/kata/56d0a591c6c8b466ca00118b
}

program triangular_numbers;

{$mode objfpc}{$H+}

uses
  triangular_numbers_unit;

  procedure DoTest(Expected: boolean; t: integer);
  var
    Actual: boolean;
  begin
    Actual := IsTriangular(t);
    writeln('t       : ', t);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(True, 1);
  DoTest(True, 3);
  DoTest(True, 6);
  DoTest(True, 10);
  DoTest(True, 15);
  DoTest(True, 21);
  DoTest(True, 28);
  DoTest(False, 2);
  DoTest(False, 7);
  DoTest(False, 14);
  DoTest(False, 27);
end.
