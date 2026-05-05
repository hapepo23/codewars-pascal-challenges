{
6 kyu
Sum of Digits / Digital Root
https://www.codewars.com/kata/541c8630095125aba6000c00
}

unit digital_root_unit;

{$mode objfpc}{$H+}

interface

function DigitalRoot(n: integer): integer;

implementation

function DigitalRoot(n: integer): integer;
var
  sum: integer;
begin
  if n div 10 = 0 then
    Exit(n);
  sum := 0;
  while n > 0 do
  begin
    sum += n mod 10;
    n := n div 10;
  end;
  Result := DigitalRoot(sum);
end;

end.
