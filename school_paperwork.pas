{
8 kyu
School Paperwork
https://www.codewars.com/kata/55f9b48403f6b87a7c0000bd
}

program school_paperwork;

{$mode objfpc}{$H+}

uses
  school_paperwork_unit;

  procedure DoTest(n: integer; m: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := Paperwork(n, m);
    writeln('n       : ', n);
    writeln('m       : ', m);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(5, 5, 25);
  DoTest(5, -5, 0);
  DoTest(-5, 5, 0);
  DoTest(-5, -5, 0);
  DoTest(5, 0, 0);
end.
