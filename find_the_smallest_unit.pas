{
5 kyu
Find the smallest
https://www.codewars.com/kata/573992c724fc289553000e95
}

unit find_the_smallest_unit;

{$mode objfpc}{$H+}

interface

type
  TSmallest = array [0..2] of int64;

function Smallest(n: int64): TSmallest;

implementation

uses
  SysUtils;

function Smallest(n: int64): TSmallest;
var
  s, t: string;
  i, j: integer;
  best, current: int64;
begin
  s := IntToStr(n);
  best := n;
  Result[0] := n;
  Result[1] := 0;
  Result[2] := 0;
  for i := 1 to Length(s) do
    for j := 1 to Length(s) do
    begin
      t := s;
      Delete(t, i, 1);
      Insert(s[i], t, j);
      current := StrToInt64(t);
      if (current < best) or ((current = best) and
        ((i - 1 < Result[1]) or ((i - 1 = Result[1]) and (j - 1 < Result[2])))) then
      begin
        best := current;
        Result[0] := current;
        Result[1] := i - 1;
        Result[2] := j - 1;
      end;
    end;
end;

end.
