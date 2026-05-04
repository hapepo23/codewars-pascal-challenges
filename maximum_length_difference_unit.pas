{
7 kyu
Maximum Length Difference
https://www.codewars.com/kata/5663f5305102699bad000056
}

unit maximum_length_difference_unit;

{$mode objfpc}{$H+}

interface

type
  TStringArray = array of string;

function MxDifLg(a1, a2: TStringArray): int64;

implementation

uses
  Math;

function MxDifLg(a1, a2: TStringArray): int64;
var
  s: string;
  l: integer;
  maxl_a1: integer = Low(integer);
  maxl_a2: integer = Low(integer);
  minl_a1: integer = High(integer);
  minl_a2: integer = High(integer);
begin
  if (Length(a1) = 0) or (Length(a2) = 0) then
    Exit(-1);
  for s in a1 do
  begin
    l := Length(s);
    maxl_a1 := Max(l, maxl_a1);
    minl_a1 := Min(l, minl_a1);
  end;
  for s in a2 do
  begin
    l := Length(s);
    maxl_a2 := Max(l, maxl_a2);
    minl_a2 := Min(l, minl_a2);
  end;
  Result := Max(maxl_a1 - minl_a2, maxl_a2 - minl_a1);
end;

end.
