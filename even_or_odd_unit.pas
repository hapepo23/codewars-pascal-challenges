{
8 kyu
Even or Odd
https://www.codewars.com/kata/53da3dbb4a5168369a0000fe
}

unit even_or_odd_unit;

{$mode objfpc}{$H+}

interface

function EvenOrOdd(Num: integer): string;

implementation

function EvenOrOdd(Num: integer): string;
begin
  if Num mod 2 = 0 then
    Result := 'Even'
  else
    Result := 'Odd';
end;

end.
