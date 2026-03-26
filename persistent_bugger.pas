{
6 kyu
Persistent Bugger.
https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec
}

program persistent_bugger;

{$mode objfpc}{$H+}

uses
  persistent_bugger_unit;

  procedure DoTest(n: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Persistence(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(39, 3);
  DoTest(4, 0);
  DoTest(25, 2);
  DoTest(999, 4);
  DoTest(2147483647, 2);
end.
