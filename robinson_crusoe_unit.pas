{
7 kyu
Robinson Crusoe
https://www.codewars.com/kata/5d95b7644a336600271f52ba
}

unit robinson_crusoe_unit;

{$mode objfpc}{$H+}

interface

type
  TArr = array [0..1] of double;

function Crusoe(n: int64; d: double; ang: int64;
  distmult: double; angmult: double): TArr;

implementation

function Crusoe(n: int64; d: double; ang: int64;
  distmult: double; angmult: double): TArr;
var
  i: int64;
  a: double;
begin
  a := ang;
  Result[0] := 0;
  Result[1] := 0;
  for i := 1 to n do
  begin
    Result[0] := Result[0] + d * cos(a * Pi / 180.0);
    Result[1] := Result[1] + d * sin(a * Pi / 180.0);
    d := d * distmult;
    a := a * angmult;
  end;
end;

end.
