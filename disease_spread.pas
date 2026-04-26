{
6 kyu
Disease Spread
https://www.codewars.com/kata/566543703c72200f0b0000c9
}

program disease_spread;

{$mode objfpc}{$H+}

uses
  disease_spread_unit,
  SysUtils;

  procedure DoTest(tm, n, s0, i0: int64; b, a: double; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Epidemic(tm, n, s0, i0, b, a);
    writeln('Days tm        : ', tm);
    writeln('Intervals n    : ', n);
    writeln('Susceptibles s0: ', s0);
    writeln('Infected i0    : ', i0);
    writeln('Constant b     : ', Format('%.7g', [b]));
    writeln('Constant a     : ', Format('%.7g', [a]));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(18, 432, 1004, 1, 0.00209, 0.51, 420);
  DoTest(12, 288, 1007, 2, 0.00206, 0.45, 461);
  DoTest(13, 312, 999, 1, 0.00221, 0.55, 409);
  DoTest(24, 576, 1005, 1, 0.00216, 0.45, 474);
  DoTest(24, 576, 982, 1, 0.00214, 0.44, 460);
end.
