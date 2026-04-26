{
5 kyu
Sections
https://www.codewars.com/kata/5da1df6d8b0f6c0026e6d58d
}

program sections;

{$mode objfpc}{$H+}

uses
  sections_unit;

  procedure DoTest(k: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := C(k);
    writeln('k       : ', k);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1);
  DoTest(4, 4);
  DoTest(2019, 0);
  DoTest(4096576, 160);
  DoTest(5345656996, 64);
  DoTest(6340618384, 112);
  DoTest(5445111681, 52);
  DoTest(4902800738, 0);
  DoTest(6218111025, 256);
end.
