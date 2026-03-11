{
7 kyu
Count the Digit
https://www.codewars.com/kata/566fc12495810954b1000030
}

unit count_the_digit_unit;

{$mode Objfpc}{$H+}

interface

function NbDig(n, d: int64): int64;

implementation

function NbDig(n, d: int64): int64;
var
  i, iq, r: int64;
begin
  Result := 0;
  for i := 0 to n do
  begin
    iq := i * i;
    if (iq = 0) and (d = 0) then
      Result := Result + 1;
    while iq > 0 do
    begin
      r := iq mod 10;
      iq := iq div 10;
      if r = d then
        Result := Result + 1;
    end;
  end;
end;

end.
