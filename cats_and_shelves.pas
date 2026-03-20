{
7 kyu
Cats and shelves
https://www.codewars.com/kata/62c93765cef6f10030dfa92b
}

program cats_and_shelves;

{$mode objfpc}{$H+}

uses
  cats_and_shelves_unit;

  procedure DoTest(const start: integer; const finish: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Jump(start, finish);
    writeln('Start   : ', start);
    writeln('Finish  : ', finish);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1, 0);
  DoTest(1, 5, 2);
  DoTest(2, 5, 1);
  DoTest(2, 4, 2);
  DoTest(2, 7, 3);
end.
