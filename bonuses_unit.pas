{
6 kyu
Bonuses
https://www.codewars.com/kata/5d68d05e7a60ba002b0053f6
}

unit bonuses_unit;

{$mode objfpc}{$H+}

interface

type
  TI64Array = array of int64;

function Bonus(arr: TI64Array; s: int64): TI64Array;

implementation

function Bonus(arr: TI64Array; s: int64): TI64Array;
var
  i, j, l: integer;
  nom, denom, sum: extended;
begin
  l := length(arr);
  SetLength(Result, l);
  nom := s;
  for i := 1 to l - 1 do
    nom := nom * arr[i];
  denom := 0;
  for i := 0 to l - 1 do
  begin
    sum := 1;
    for j := 0 to l - 1 do
      if i <> j then sum := sum * arr[j];
    denom := denom + sum;
  end;
  Result[0] := Trunc(nom / denom + 0.5);
  for i := 1 to l - 1 do
    Result[i] := (Result[0] * arr[0]) div arr[i];
end;

end.
