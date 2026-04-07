{
5 kyu
Directions Reduction
https://www.codewars.com/kata/550f22f4d758534c1100025a
}

unit directions_reduction_unit;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

function DirReduc(plan: TStringArray): TStringArray;

implementation

function DirReduc(plan: TStringArray): TStringArray;
var
  lplan, i, n: integer;
begin
  lplan := Length(plan);
  Result := [];
  SetLength(Result, lplan);
  n := -1;
  for i := 0 to lplan - 1 do
  begin
    Inc(n);
    Result[n] := plan[i];
    if n >= 1 then
      if ((Result[n][1] = 'W') and (Result[n - 1][1] = 'E')) or
        ((Result[n][1] = 'E') and (Result[n - 1][1] = 'W')) or
        ((Result[n][1] = 'S') and (Result[n - 1][1] = 'N')) or
        ((Result[n][1] = 'N') and (Result[n - 1][1] = 'S')) then
        n -= 2;
  end;
  SetLength(Result, n + 1);
end;

end.
