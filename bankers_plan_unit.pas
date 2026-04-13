{
6 kyu
Banker's Plan
https://www.codewars.com/kata/56445c4755d0e45b8c00010a
}

unit bankers_plan_unit;

{$mode objfpc}{$H+}

interface

function Fortune(f0: int64; p: double; c0: int64; n: int64; i: double): boolean;

implementation

function Fortune(f0: int64; p: double; c0: int64; n: int64; i: double): boolean;
var
  year: int64;
begin
  for year := 2 to n do
  begin
    f0 := Trunc(f0 * (1 + p / 100)) - c0;
    if f0 < 0 then
      Exit(False);
    c0 := Trunc(c0 * (1 + i / 100));
  end;
  Result := True;
end;

end.
