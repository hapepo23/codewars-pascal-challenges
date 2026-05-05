{
6 kyu
Sum of Digits / Digital Root
https://www.codewars.com/kata/541c8630095125aba6000c00
}

program digital_root_main;

{$mode objfpc}{$H+}

uses
  digital_root_unit;

  procedure DoTest(n: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := DigitalRoot(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(10, 1);
  DoTest(16, 7);
  DoTest(195, 6);
  DoTest(992, 2);
  DoTest(167346, 9);
  DoTest(0, 0);
end.
