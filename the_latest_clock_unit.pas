{
6 kyu
The latest clock
https://www.codewars.com/kata/58925dcb71f43f30cd00005f
}

unit the_latest_clock_unit;

{$mode objfpc}{$H+}

interface

function LatestClock(a, b, c, d: integer): string;

implementation

uses
  SysUtils;

type
  TIntArray = array of integer;
  TBoolArray = array of boolean;

const
  n: integer = 4;

var
  aa: TIntArray;
  used: TBoolArray;
  current: TIntArray;
  maxmin: integer;
  solution: TIntArray;

function Mins(a, b, c, d: integer): integer;
begin
  if (a in [0..2]) and (c in [0..5]) then
  begin
    if (a = 2) and (b > 3) then
      Result := -1
    else
      Result := a * 600 + b * 60 + c * 10 + d;
  end
  else
    Result := -1;
end;

procedure Permute(depth: integer);
var
  i, mn: integer;
begin
  if depth = n then
  begin
    mn := Mins(current[0], current[1], current[2], current[3]);
    if mn > maxmin then
    begin
      maxmin := mn;
      for i := 0 to n - 1 do
        solution[i] := current[i];
    end;
    Exit;
  end;
  for i := 0 to n - 1 do
  begin
    if used[i] then
      Continue;
    if (i > 0) and (aa[i] = aa[i - 1]) and (not used[i - 1]) then
      Continue;
    used[i] := True;
    current[depth] := aa[i];
    Permute(depth + 1);
    used[i] := False;
  end;
end;

function LatestClock(a, b, c, d: integer): string;
var
  i: integer;
begin
  SetLength(aa, n);
  SetLength(used, n);
  SetLength(current, n);
  SetLength(solution, n);
  maxmin := -1;
  aa[0] := a;
  aa[1] := b;
  aa[2] := c;
  aa[3] := d;
  Permute(0);
  if maxmin = -1 then
    Result := '--:--'
  else
    Result := IntToStr(solution[0]) + IntToStr(solution[1]) + ':' +
      IntToStr(solution[2]) + IntToStr(solution[3]);
end;

end.
