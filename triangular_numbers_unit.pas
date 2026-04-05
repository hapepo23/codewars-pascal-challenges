{
7 kyu
Triangular Numbers
https://www.codewars.com/kata/56d0a591c6c8b466ca00118b
}

unit triangular_numbers_unit;

{$mode objfpc}{$H+}

interface

function IsTriangular(t: integer): boolean;

implementation

function IsTriangular(t: integer): boolean;
var
  n, q: int64;
begin
  q := 1 + 8 * t;
  n := Trunc(sqrt(q));
  Result := (q = n * n);
end;

end.
