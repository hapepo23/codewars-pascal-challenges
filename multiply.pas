{
8 kyu
Multiply
https://www.codewars.com/kata/50654ddff44f800200000004
}

program multiply_main;

{$mode objfpc}{$H+}

uses
  multiply_unit;

  procedure DoTest(const A: integer; const B: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Multiply(A, B);
    writeln('A       : ', A);
    writeln('B       : ', B);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1, 1);
  DoTest(2, 1, 2);
  DoTest(2, 2, 4);
  DoTest(3, 5, 15); 
  DoTest(5, 0, 0);
  DoTest(0, 5, 0);
  DoTest(0, 0, 0); 
end.
