{
5 kyu
Operations on sequences
https://www.codewars.com/kata/5e4bb05b698ef0001e3344bc
}

unit operations_on_sequences_unit;

{$mode objfpc}{$H+}

interface

type
  TArr = array of int64;
  T2Arr = array[0..1] of int64;

function Solve(arr: TArr): T2Arr;

implementation

function Solve(arr: TArr): T2Arr;
var
  a0, a1, a2, a3, n0, n1: int64;
  i, h: integer;
begin
  h := High(arr);
  a0 := arr[0];
  a1 := arr[1];
  i := 2;
  while i < h do
  begin
    a2 := arr[i];
    a3 := arr[i + 1];
    n0 := Abs(a0 * a2 - a1 * a3);
    n1 := Abs(a0 * a3 + a1 * a2);
    a0 := n0;
    a1 := n1;
    i += 2;
  end;
  Result[0] := a0;
  Result[1] := a1;
end;

end.
