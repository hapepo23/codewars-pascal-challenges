{
7 kyu
Growth of a Population
https://www.codewars.com/kata/563b662a59afc2b5120000c6
}

unit population_growth_unit;

{$mode objfpc}{$H+}

interface

function NbYear(p0: int64; percent: double; aug, p: int64): int64;

implementation

function NbYear(p0: int64; percent: double; aug, p: int64): int64;
begin
  Result := 0;
  while p0 < p do
  begin
    p0 += Trunc(p0 * percent * 0.01) + aug;
    Inc(Result);
  end;
end;

end.
