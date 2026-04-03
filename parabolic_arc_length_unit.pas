{
6 kyu
Parabolic Arc Length
https://www.codewars.com/kata/562e274ceca15ca6e70000d3
}

unit parabolic_arc_length_unit;

{$mode objfpc}{$H+}

interface

function LenCurve(n: int64): double;

implementation

function LenCurve(n: int64): double;
var
  i: integer;
  h, xl, yl, xr, yr: double;
begin
  Result := 0.0;
  h := 1.0 / n;
  xl := 0.0;
  yl := Sqr(xl);
  for i := 1 to n do
  begin
    xr := xl + h;
    yr := Sqr(xr);
    Result += Sqrt(Sqr(xr - xl) + Sqr(yr - yl));
    xl := xr;
    yl := yr;
  end;
end;

end.
