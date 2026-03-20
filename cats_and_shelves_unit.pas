{
7 kyu
Cats and shelves
https://www.codewars.com/kata/62c93765cef6f10030dfa92b
}

unit cats_and_shelves_unit;

{$mode objfpc}{$H+}

interface

function Jump(const start: integer; const finish: integer): integer;

implementation

function Jump(const start: integer; const finish: integer): integer;
begin
  Result := (finish - start) div 3 + (finish - start) mod 3;
end;

end.
