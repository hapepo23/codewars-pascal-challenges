{
7 kyu
Looking for a benefactor
https://www.codewars.com/kata/569b5cec755dd3534d00000f
}

unit new_average_unit;

{$mode objfpc}{$H+}

interface

type
  TDoubleArray = array of double;

function NewAvg(arr: TDoubleArray; navg: double): int64;

implementation

uses
  Math;

function NewAvg(arr: TDoubleArray; navg: double): int64;
var
  l, i: integer;
  sum, r: double;
begin
  l := Length(arr);
  sum := 0;
  for i := Low(arr) to High(arr) do
    sum := sum + arr[i];
  r := navg * (l + 1) - sum;
  if r <= 0 then
    Result := -1
  else
    Result := Ceil(r);
end;

end.
