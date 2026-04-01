{
6 kyu
Floating-point Approximation (II)
https://www.codewars.com/kata/581ee0db1bbdd04e010002fd
}

unit floating_point_approx_2_unit;

{$mode objfpc}{$H+}

interface

type
  TDoubleArray = array of double;
  TFunctionParameter = function(s: double): double;

function Interp(f: TFunctionParameter; l, u: double; n: int64): TDoubleArray;

implementation

uses
  Math;

function Interp(f: TFunctionParameter; l, u: double; n: int64): TDoubleArray;
var
  d: double;
  i: int64;
begin
  Result := [];
  SetLength(Result, n);
  d := (u - l) / n;
  for i := 0 to n - 1 do
    Result[i] := Floor(f(l + i * d) * 100.0) / 100.0;
end;

end.
