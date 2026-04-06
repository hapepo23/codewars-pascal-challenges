{
6 kyu
A Rule of Divisibility by 13
https://www.codewars.com/kata/564057bc348c7200bd0000ff
}

unit divisibility_by_thirteen_unit;

{$mode objfpc}{$H+}

interface

function Thirt(n: int64): int64;

implementation

function Thirt(n: int64): int64;
const
  c: array[0..18] of int64 =
    (1, 10, 9, 12, 3, 4, 1, 10, 9, 12, 3, 4, 1, 10, 9, 12, 3, 4, 1);
var
  num, digit, prevsum, sum, i: int64;
begin
  sum := -1;
  num := n;
  repeat
    prevsum := sum;
    sum := 0;
    i := 0;
    while num <> 0 do
    begin
      digit := num mod 10;
      num := num div 10;
      sum += digit * c[i];
      Inc(i);
    end;
    num := sum;
  until sum = prevsum;
  Result := sum;
end;

end.
