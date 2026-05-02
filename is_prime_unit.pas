{
6 kyu
Is a number prime?
https://www.codewars.com/kata/5262119038c0985a5b00029f
}

unit is_prime_unit;

{$mode objfpc}{$H+}

interface

function IsPrime(n: integer): boolean;

implementation

function IsPrime(n: integer): boolean;
var
  i: integer = 5;
begin
  if n <= 1 then
    Exit(False);
  if (n = 2) or (n = 3) then
    Exit(True);
  if (n mod 2 = 0) or (n mod 3 = 0) then
    Exit(False);
  while Sqr(i) <= n do
  begin
    if (n mod i = 0) or (n mod (i + 2) = 0) then
      Exit(False);
    Inc(i, 6);
  end;
  Result := True;
end;

end.
