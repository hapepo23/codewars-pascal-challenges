{
6 kyu
Persistent Bugger.
https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec
}

unit persistent_bugger_unit;

{$mode objfpc}{$H+}

interface

function Persistence(n: integer): integer;

implementation

function DigitProd(num: integer): integer;
begin
  Result := 1;
  while (num <> 0) do
  begin
    Result := Result * (num mod 10);
    num := num div 10;
  end;
end;

function Persistence(n: integer): integer;
begin
  Result := 0;
  while n >= 10 do
  begin
    Result := Result + 1;
    n := DigitProd(n);
  end;
end;

end.
