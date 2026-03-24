{
6 kyu
Braking well
https://www.codewars.com/kata/565c0fa6e3a7d39dee000125
}

program braking_well;

{$mode objfpc}{$H+}

uses
  braking_well_unit;

const
  merr: double = 1e-2;

  procedure DoTestDist(v, mu: double; Expected: double);
  var
    Actual: double;
  begin
    Actual := Dist(v, mu);
    writeln('Calculate distance in m');
    writeln('Speed v, km/h     : ', v: 10: 5);
    writeln('Friction coeff. mu: ', mu: 10: 5);
    writeln('Expected d, m     : ', Expected: 10: 5);
    writeln('Actual d, m       : ', Actual: 10: 5);
    if Abs(Expected - Actual) < merr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTestSpeed(d, mu: double; Expected: double);
  var
    Actual: double;
  begin
    Actual := Speed(d, mu);
    writeln('Calculate speed in km/h');
    writeln('Distance d, m     : ', d: 10: 5);
    writeln('Friction coeff. mu: ', mu: 10: 5);
    writeln('Expected v, km/h  : ', Expected: 10: 5);
    writeln('Actual v, km/h    : ', Actual: 10: 5);
    if Abs(Expected - Actual) < merr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTestDist(100, 0.7, 83.9598760937531);
  DoTestSpeed(83.9598760937531, 0.7, 100);
  DoTestDist(144, 0.3, 311.83146449201496);
  DoTestDist(92, 0.5, 92.12909477605366);
  DoTestDist(142, 0.2, 435.94398509960854);
  DoTestSpeed(159, 0.8, 153.79671564846308);
  DoTestSpeed(164, 0.7, 147.91115701756493);
  DoTestSpeed(153, 0.7, 142.14404997566152);
end.
