{
4 kyu
Twice linear
https://www.codewars.com/kata/5672682212c8ecf83e000050
}

unit twice_linear_unit;

{$mode objfpc}{$H+}

interface

function dblLinear(n: int64): int64;

implementation

function dblLinear(n: int64): int64;
var
  i, j, k, l, y, z: int64;
  arr: array of int64;
begin
  arr := [];
  SetLength(arr, n + 1);
  arr[0] := 1;
  i := 0;
  j := 0;
  for k := 1 to n do
  begin
    z := 3 * arr[j] + 1;
    y := 2 * arr[i] + 1;
    if y < z then
    begin
      Inc(i);
      l := y;
    end
    else if z < y then
    begin
      Inc(j);
      l := z;
    end
    else
    begin
      Inc(i);
      Inc(j);
      l := y;
    end;
    arr[k] := l;
  end;
  Result := arr[n];
end;

end.
