{
7 kyu
Sum of odd numbers
https://www.codewars.com/kata/55fd2d567d94ac3bc9000064
}

unit sum_of_odd_numbers_unit;

{$mode objfpc}{$H+}

interface

function RowSumOddNumbers(const n: integer): integer;

implementation

function RowSumOddNumbers(const n: integer): integer;
var
  sum_n: integer;
begin
  sum_n := (n * (n + 1)) div 2;
  Result := Sqr(sum_n) - Sqr(sum_n - n);
end;

end.
