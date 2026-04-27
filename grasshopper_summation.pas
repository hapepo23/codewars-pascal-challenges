{
8 kyu
Grasshopper - Summation
https://www.codewars.com/kata/55d24f55d7dd296eb9000030
}

program grasshopper_summation;

{$mode objfpc}{$H+}

uses
  grasshopper_summation_unit;

  procedure DoTest(const N: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Summation(N);
    writeln('N       : ', N);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1);
  DoTest(8, 36);
  DoTest(22, 253);
  DoTest(100, 5050);
  DoTest(213, 22791);
end.
