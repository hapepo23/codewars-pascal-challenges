{
7 kyu
Sum of Numbers
https://www.codewars.com/kata/55f2b110f61eb01779000053
}

unit sum_of_numbers_unit;

{$mode objfpc}{$H+}

interface

function GetSum(a: int64; b: int64): int64;

implementation

uses
  Math;

function GetSum(a: int64; b: int64): int64;
var
  val: int64;
begin
  if a = b then
    Exit(a);
  Result := 0;
  for val := Min(a, b) to Max(a, b) do
    Result += val;
end;

end.
