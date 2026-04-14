{
8 kyu
Cockroach
https://www.codewars.com/kata/55fab1ffda3e2e44f00000c6
}

program cockroach;

{$mode objfpc}{$H+}

uses
  cockroach_unit,
  SysUtils;

  procedure DoTest(s: real; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := CockroachSpeed(s);
    writeln('v, km/h : ', Format('%.4g', [s]));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1.08, 30);
  DoTest(1.09, 30);
  DoTest(1.25, 34);
end.
