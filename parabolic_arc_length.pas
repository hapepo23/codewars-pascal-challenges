{
6 kyu
Parabolic Arc Length
https://www.codewars.com/kata/562e274ceca15ca6e70000d3
}

program parabolic_arc_length;

{$mode objfpc}{$H+}

uses
  parabolic_arc_length_unit;

  procedure DoTest(n: int64; Expected: double);
  var
    Actual: double;
  begin
    Actual := LenCurve(n);
    writeln('Intervals n: ', n);
    writeln('Expected   : ', Expected: 10: 8);
    writeln('Actual     : ', Actual: 10: 8);
    if Abs((Actual - Expected) / Expected) < 1e-6 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1.414213562);
  DoTest(10, 1.478197397);
  DoTest(40, 1.478896272);
  DoTest(200, 1.478940944);
end.
