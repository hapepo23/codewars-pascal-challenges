{
8 kyu
Clock
https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a
}

unit clock_unit;

{$mode objfpc}{$H+}

interface

function Past(H: integer; M: integer; S: integer): integer;

implementation

function Past(H: integer; M: integer; S: integer): integer;
begin
  Result := ((H * 60 + M) * 60 + S) * 1000;
end;

end.
