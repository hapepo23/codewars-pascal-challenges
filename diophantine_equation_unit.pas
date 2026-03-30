{
5 kyu
Diophantine Equation
https://www.codewars.com/kata/554f76dca89983cc400000bb
}

unit diophantine_equation_unit;

{$mode objfpc}{$H+}

interface

function SolEqua(n: int64): string;

implementation

uses
  SysUtils;

{ Algorithm:
  Find all factor pairs (a,b) of n with a ≤ b
  For each pair: Check if (b−a) mod 4 = 0
  Compute: x = (a+b)/2 and y = (b−a)/4  }

function SolEqua(n: int64): string;
var
  max, a, b, x, y: int64;
begin
  Result := '[';
  max := Trunc(Sqrt(n)) + 1;
  for a := 1 to max do
  begin
    if n mod a = 0 then
    begin
      b := n div a;
      if (b - a) mod 4 = 0 then
      begin
        x := (a + b) div 2;
        y := (b - a) div 4;
        if Result <> '[' then
          Result += ', ';
        Result += '[' + IntToStr(x) + ', ' + IntToStr(y) + ']';
      end;
    end;
  end;
  Result += ']';
end;

end.
