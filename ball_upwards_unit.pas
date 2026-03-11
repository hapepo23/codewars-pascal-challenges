{
6 kyu
Ball Upwards
https://www.codewars.com/kata/566be96bb3174e155300001b
}

unit ball_upwards_unit;

{$mode objfpc}{$H+}

interface

function MaxBall(v0: Int64): Int64;

implementation

function MaxBall(v0: Int64): Int64;
  var
    StartVelocityMeterPerSec: Double;
    HeightMeter: Double;
    MaxHeightMeter: Double;
    TimeSec: Double;
    TenthSecond: Int64;
  const
    G: Double = 9.81;
begin
  StartVelocityMeterPerSec := v0 * 1000.0 / 3600.0;
  MaxHeightMeter := 0.0;
  TenthSecond := 0;
  repeat
    TenthSecond := TenthSecond + 1;
    TimeSec := TenthSecond / 10.;
    HeightMeter := StartVelocityMeterPerSec * TimeSec - 
                   0.5 * G * TimeSec * TimeSec;
    if HeightMeter >= MaxHeightMeter then
      MaxHeightMeter := HeightMeter;
  until HeightMeter < MaxHeightMeter;
  Result := TenthSecond - 1;
end; 

end.
