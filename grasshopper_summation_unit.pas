{
8 kyu
Grasshopper - Summation
https://www.codewars.com/kata/55d24f55d7dd296eb9000030
}

unit grasshopper_summation_unit;

{$mode objfpc}{$H+}

interface

function Summation(const N: integer): integer;

implementation

function Summation(const N: integer): integer;
begin
  Result := (N * (N + 1)) div 2;
end;

end.
