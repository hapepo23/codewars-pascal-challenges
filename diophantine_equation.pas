{
5 kyu
Diophantine Equation
https://www.codewars.com/kata/554f76dca89983cc400000bb
}

program diophantine_equation;

{$mode objfpc}{$H+}

uses
  diophantine_equation_unit;

  procedure DoTest(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := SolEqua(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(5, '[[3, 1]]');
  DoTest(12, '[[4, 1]]');
  DoTest(16, '[[4, 0]]');
  DoTest(90002, '[]');
  DoTest(90005, '[[45003, 22501], [9003, 4499], [981, 467], [309, 37]]');
end.
