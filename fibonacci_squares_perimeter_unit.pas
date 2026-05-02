{
5 kyu
Perimeter of squares in a rectangle
https://www.codewars.com/kata/559a28007caad2ac4e000083
}

unit fibonacci_squares_perimeter_unit;

{$mode objfpc}{$H+}

interface

function Perimeter(n: int64): int64;

implementation

function Perimeter(n: int64): int64;
var
  i: int64;
  a: int64 = 1;
begin
  Result := 1;
  for i := 0 to n do
  begin
    Result += a;
    a := Result - a;
  end;
  Result := 4 * (Result - 1);
end;  
  
end.
