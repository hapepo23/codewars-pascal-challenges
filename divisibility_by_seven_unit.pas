{
7 kyu
A Rule of Divisibility by 7
https://www.codewars.com/kata/55e6f5e58f7817808e00002e
}

unit divisibility_by_seven_unit;

{$mode objfpc}{$H+}

interface

type
  TSeven = array [0..1] of int64;

function Seven(m: int64): TSeven;

implementation

function Seven(m: int64): TSeven;
begin
  Result[1] := 0;
  while m > 99 do
  begin
    Inc(Result[1]);
    m := (m div 10) - (m mod 10) * 2;
  end;
  Result[0] := m;
end;

end.
