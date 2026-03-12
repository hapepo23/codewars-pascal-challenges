{
6 kyu
Cuckoo Clock
https://www.codewars.com/kata/656e4602ee72af0017e37e82
}

unit cuckoo_clock_unit;

{$mode objfpc}{$H+}

interface

function CuckooClock(initial_time: string; target: integer): string;

implementation

uses
  SysUtils;

function MinutesSinceOneHour(time: string): integer;
begin
  Result := (StrToInt(copy(time, 1, 2)) - 1) * 60 + StrToInt(copy(time, 4, 2));
end;

function ChimesSinceOneHour(mins: integer): integer;
var
  AddFullChimes: integer;
begin
  AddFullChimes := (mins - 1) div 60;
  Result := (mins + 14) div 15 + AddFullChimes * (AddFullChimes + 1) div 2;
end;

function ChimesToMinsSinceOneHour(chimes: integer): integer;
var
  quarter, lastc, c: integer;
begin
  chimes := chimes mod 114;
  lastc := -1;
  for quarter := 0 to 47 do
  begin
    c := ChimesSinceOneHour(quarter * 15);
    if (chimes > lastc) and (chimes <= c) then
    begin
      Result := (quarter - 1) * 15;
      if Result < 0 then
        Result := 720 + Result;
      exit;
    end
    else
      lastc := c;
  end;
end;

function TimeString(MinsSinceOneHour: integer): string;
begin
  Result := Format('%.2d', [(MinsSinceOneHour div 60) + 1]) + ':' +
    Format('%.2d', [MinsSinceOneHour mod 60]);
end;

function CuckooClock(initial_time: string; target: integer): string;
var
  initial_mins, chimes, final_mins: integer;
begin
  initial_mins := MinutesSinceOneHour(initial_time);
  chimes := ChimesSinceOneHour(initial_mins) + target;
  final_mins := ChimesToMinsSinceOneHour(chimes);
  Result := TimeString(final_mins);
end;

end.
