{
6 kyu
Tank Truck
https://www.codewars.com/kata/55f3da49e83ca1ddae0000ad
}

unit tank_truck_unit;

{$mode objfpc}{$H+}

interface

function Tankvol(h, d, vt: int64): int64;

implementation

uses
  Math;

function Tankvol(h, d, vt: int64): int64;
var
  radius, areafull, area: double;
begin
  radius := 0.5 * d;
  areafull := Sqr(radius) * Pi;
  area := Sqr(radius) * arccos(1.0 - h / radius) - (radius - h) *
    Sqrt(2.0 * radius * h - Sqr(h));
  Result := Floor(area * vt / areafull);
end;

end.
