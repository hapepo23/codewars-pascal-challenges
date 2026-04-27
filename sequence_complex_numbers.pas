{
6 kyu
Experimenting with a sequence of complex numbers
https://www.codewars.com/kata/5b06c990908b7eea73000069
}

program sequence_complex_numbers;

{$mode objfpc}{$H+}

uses
  ucomplex,
  sequence_complex_numbers_unit;

  procedure DoTest(z: complex; eps: double; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := F(z, eps);
    writeln('z       : ', CStr(z, 6, 3));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Abs(Expected - Actual) <= 1 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0.64 + 0.75 * i, 1e-12, 1952);
  DoTest(30.0 + 50.0 * i, 1e-4, -1);
  DoTest(0.3 + 0.5 * i, 1e-4, 17);
end.
