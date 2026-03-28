{
6 kyu
The Walker
https://www.codewars.com/kata/5b40b666dfb4291ad9000049
}

unit the_walker_unit;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  Math;

type
  TWalker = array [0..3] of int64;

function solve(a, b, c, alpha, beta, gamma: int64): TWalker;

implementation

function solve(a, b, c, alpha, beta, gamma: int64): TWalker;
var
  al, be, ga, xa, ya, xb, yb, xc, yc, angle: double;
begin
  al := alpha * Pi / 180.0;
  be := beta * Pi / 180.0;
  ga := gamma * Pi / 180.0;
  xa := a * cos(al);
  ya := a * sin(al);
  xb := xa - b * sin(be);
  yb := ya + b * cos(be);
  xc := xb - c * cos(ga);
  yc := yb - c * sin(ga);
  Result[0] := Round(Sqrt(Sqr(xc) + Sqr(yc)));
  angle := Arctan2(yc, xc) * 180.0 / Pi;
  Result[1] := Trunc(angle);
  Result[2] := Trunc((angle - Result[1]) * 60);
  Result[3] := Trunc(((angle - Result[1]) * 60 - Result[2]) * 60);
end;

end.
