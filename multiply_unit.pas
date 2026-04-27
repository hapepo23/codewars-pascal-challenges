{
8 kyu
Multiply
https://www.codewars.com/kata/50654ddff44f800200000004
}

unit multiply_unit;

{$mode objfpc}{$H+}

interface

function Multiply(const A: integer; const B: integer): integer;

implementation

function Multiply(const A: integer; const B: integer): integer;
begin
  Result := A * B;
end;

end.
