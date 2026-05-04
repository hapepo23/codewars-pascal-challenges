{
7 kyu
Growth of a Population
https://www.codewars.com/kata/563b662a59afc2b5120000c6
}

program population_growth;

{$mode objfpc}{$H+}

uses
  population_growth_unit,
  SysUtils;

  procedure DoTest(p0: int64; percent: double; aug, p: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := NbYear(p0, percent, aug, p);
    writeln('p0      : ', p0);
    writeln('percent : ', Format('%.7g', [percent]));
    writeln('aug     : ', aug);
    writeln('p       : ', p);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1500, 5, 100, 5000, 15);
  DoTest(1500000, 2.5, 10000, 2000000, 10);
  DoTest(1500000, 0.25, 1000, 2000000, 94);
  DoTest(1500000, 0.25, -1000, 2000000, 151);
end.
