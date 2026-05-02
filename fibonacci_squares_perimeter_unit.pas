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

procedure Fib(n: int64; out fibn: int64; out fibnp1: int64);
var
  a, b, c, d: int64;
begin
  { calculates Fib(n) and Fib(n+1)
    Fast doubling Fibonacci algorithm, see
    https://www.nayuki.io/page/fast-fibonacci-algorithms }
  if n = 0 then
  begin
    fibn := 0;
    fibnp1 := 1;
  end
  else
  begin
    Fib(n div 2, a, b);
    c := a * (b * 2 - a);
    d := Sqr(a) + Sqr(b);
    if n mod 2 = 0 then
    begin
      fibn := c;
      fibnp1 := d;
    end
    else
    begin
      fibn := d;
      fibnp1 := c + d;
    end;
  end;
end;

function Perimeter(n: int64): int64;
var
  i, np1, fibn, fibnp1: int64;
begin
  Result := 0;
  np1 := n + 1;
  i := 1;
  while i <= n + 1 do
  begin
    Fib(i, fibn, fibnp1);
    Result += fibn;
    if i + 1 <= np1 then
      Result += fibnp1;
    Inc(i, 2);
  end;
  Result *= 4;
end;

end.
