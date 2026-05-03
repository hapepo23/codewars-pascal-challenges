{
7 kyu
Deodorant Evaporator
https://www.codewars.com/kata/5506b230a11c0aeab3000c1f
}

unit evaporator_unit;

{$mode objfpc}{$H+}
{$WARN 5024 off}

interface

function Evaporator(content, evapPerDay, threshold: double): int64;

implementation

function Evaporator(content, evapPerDay, threshold: double): int64;
var
  act_content: double = 100;
begin
  Result := 0;
  repeat
    Inc(Result);
    act_content -= (act_content * evapPerDay / 100);
  until act_content <= threshold;
end;

end.
