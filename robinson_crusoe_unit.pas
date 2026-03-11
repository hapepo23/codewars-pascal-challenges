{
7 kyu
Robinson Crusoe
https://www.codewars.com/kata/5d95b7644a336600271f52ba
}

unit robinson_crusoe_unit;

{$mode objfpc}{$H+}

interface

type 
  TArr = array [0..1] of Double;

function Crusoe(n: Int64; 
                d: Double; 
                ang: Int64; 
                distmult: Double; 
                angmult: Double): TArr;

implementation

function Crusoe(n: Int64; 
                d: Double; 
                ang: Int64; 
                distmult: Double; 
                angmult: Double): TArr;
var
  i: Int64;
  a: Double;
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
