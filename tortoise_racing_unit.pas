{
6 kyu
Tortoise racing
https://www.codewars.com/kata/55e2adece53b4cdcb900006c
}

unit tortoise_racing_unit;

{$mode objfpc}{$H+}

interface

type
  TDuration = array [0..2] of int64;

const
  invalidDuration: TDuration = (-1, -1, -1);

function Race(v1, v2, g: int64): TDuration;

implementation

function Race(v1, v2, g: int64): TDuration;
var
  vdiff, time: double;
begin
  vdiff := v2 - v1;
  if vdiff <= 0 then
    Result := invalidDuration
  else
  begin
    time := g / vdiff + 2.78e-7; { +1 ms }
    Result[0] := Trunc(time);
    time := (time - Result[0]) * 60;
    Result[1] := Trunc(time);
    time := (time - Result[1]) * 60;
    Result[2] := Trunc(time);
  end;
end;

end.
