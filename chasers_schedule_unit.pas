{
6 kyu
Chaser's schedule
https://www.codewars.com/kata/628df6b29070907ecb3c2d83
}

unit chasers_schedule_unit;

{$mode objfpc}{$H+}

interface

function Sprint(const s: integer; const t: integer): integer;

implementation

function Sprint(const s: integer; const t: integer): integer;
var
  istart, time, base_s, dist, best, remaining: integer;
begin
  best := 0;
  for istart := 1 to t + 1 do
  begin
    base_s := s;
    dist := (istart - 1) * s;
    remaining := t - (istart - 1);
    time := 0;
    while (time < remaining) and (base_s > 0) do
    begin
      dist += 2 * base_s;
      Inc(time);
      Dec(base_s);
      if (time >= remaining) or (base_s <= 0) then
        Break;
      dist += base_s;
      Inc(time);
    end;
    if dist > best then
      best := dist;
  end;
  Result := best;
end;

end.
