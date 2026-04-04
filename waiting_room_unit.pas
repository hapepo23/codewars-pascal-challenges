{
7 kyu
Waiting room
https://www.codewars.com/kata/542f0c36d002f8cd8a0005e5
}

unit waiting_room_unit;

{$mode objfpc}{$H+}

interface

function LastChair(const N: integer): integer;

implementation

function LastChair(const N: integer): integer;
begin
  Result := N - 1;
end;

end.
