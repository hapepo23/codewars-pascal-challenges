{
6 kyu
Positions Average
https://www.codewars.com/kata/59f4a0acbee84576800000af
}

program positions_average;

{$mode objfpc}{$H+}

uses
  positions_average_unit;

  procedure DoTest(s: string; Expected: double);
  var
    Actual: double;
  begin
    Actual := PosAverage(s);
    writeln('Strings : ', s);
    writeln('Expected: ', Expected: 13: 10);
    writeln('Actual  : ', Actual: 13: 10);
    if Abs(Expected - Actual) < 1e-9 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('466960, 069060, 494940, 060069, 060090, 640009, 496464, 606900, 004000, 944096',
    26.6666666667);
  DoTest('444996, 699990, 666690, 096904, 600644, 640646, 606469, 409694, 666094, 606490',
    29.2592592593);
  DoTest('449404, 099090, 600999, 694460, 996066, 906406, 644994, 699094, 064990, 696046',
    24.4444444444);
  DoTest('660999, 969060, 044604, 009494, 609009, 640090, 994446, 949940, 046999, 609444',
    22.9629629630);
  DoTest('996060, 606494, 964494, 460409, 609449, 969600, 960944, 960006, 666049, 090996',
    24.8148148148);
end.
