{
6 kyu
Ball Upwards
https://www.codewars.com/kata/566be96bb3174e155300001b
}

unit ball_upwards_unit;

{$mode objfpc}{$H+}

interface

function MaxBall(v0: int64): int64;

implementation

function MaxBall(v0: int64): int64;
var
  StartVelocityMeterPerSec: double;
  HeightMeter: double;
  MaxHeightMeter: double;
  TimeSec: double;
  TenthSecond: int64;
const
  G: double = 9.81;
begin
  StartVelocityMeterPerSec := v0 * 1000.0 / 3600.0;
  MaxHeightMeter := 0.0;
  TenthSecond := 0;
  repeat
    TenthSecond := TenthSecond + 1;
    TimeSec := TenthSecond / 10.;
    HeightMeter := StartVelocityMeterPerSec * TimeSec - 0.5 *
      G * TimeSec * TimeSec;
    if HeightMeter >= MaxHeightMeter then
      MaxHeightMeter := HeightMeter;
  until HeightMeter < MaxHeightMeter;
  Result := TenthSecond - 1;
end;

end.
