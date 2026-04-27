{
8 kyu
School Paperwork
https://www.codewars.com/kata/55f9b48403f6b87a7c0000bd
}

unit school_paperwork_unit;

{$mode objfpc}{$H+}

interface

function Paperwork(n: integer; m: integer): integer;

implementation

function Paperwork(n: integer; m: integer): integer;
begin
  if (n < 0) or (m < 0) then
    Result := 0
  else
    Result := m * n;
end;

end.
