{
6 kyu
Financing Plan on Planet XY140Z-n
https://www.codewars.com/kata/559ce00b70041bc7b600013d
}

unit planet_financing_plan_unit;

{$mode objfpc}{$H+}

interface

function Finance(n: int64): int64;

implementation

function Finance(n: int64): int64;
begin
  Result := ((n * (n + 1)) div 2) * (n + 2);
end;

end.
