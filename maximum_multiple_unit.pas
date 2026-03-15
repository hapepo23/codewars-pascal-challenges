{
7 kyu
Maximum Multiple
https://www.codewars.com/kata/5aba780a6a176b029800041c
}

unit maximum_multiple_unit;

{$mode Objfpc}{$H+}

interface

function MaxMultiple(d: integer; b: integer): integer;

implementation

function MaxMultiple(d: integer; b: integer): integer;
begin
  for Result := b downto d do
    if Result mod d = 0 then
      Exit;
end;

end.
