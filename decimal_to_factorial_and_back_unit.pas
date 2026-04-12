{
5 kyu
Decimal to Factorial and Back
https://www.codewars.com/kata/54e320dcebe1e583250008fd
}

unit decimal_to_factorial_and_back_unit;

{$mode objfpc}{$H+}

interface

function Dec2FactString(nb: int64): string;
function FactString2Dec(str: string): int64;

implementation

type
  TTranslate = record
    fact: int64;
    letter: char;
  end;

const
  Translate: array [0..20] of TTranslate = (
    (fact: 1; letter: '0'),
    (fact: 1; letter: '1'),
    (fact: 2; letter: '2'),
    (fact: 6; letter: '3'),
    (fact: 24; letter: '4'),
    (fact: 120; letter: '5'),
    (fact: 720; letter: '6'),
    (fact: 5040; letter: '7'),
    (fact: 40320; letter: '8'),
    (fact: 362880; letter: '9'),
    (fact: 3628800; letter: 'A'),
    (fact: 39916800; letter: 'B'),
    (fact: 479001600; letter: 'C'),
    (fact: 6227020800; letter: 'D'),
    (fact: 87178291200; letter: 'E'),
    (fact: 1307674368000; letter: 'F'),
    (fact: 20922789888000; letter: 'G'),
    (fact: 355687428096000; letter: 'H'),
    (fact: 6402373705728000; letter: 'I'),
    (fact: 121645100408832000; letter: 'J'),
    (fact: 2432902008176640000; letter: 'K'));

function Dec2FactString(nb: int64): string;
var
  i, j, c: integer;
  nbo: int64;
begin
  nbo := nb;
  for i := 0 to High(Translate) do
    if Translate[i].fact > nb then
    begin
      j := i - 1;
      Break;
    end;
  Result := '';
  for i := j downto 0 do
  begin
    c := nb div Translate[i].fact;
    nb := nb - c * Translate[i].fact;
    Result := Result + Translate[c].letter;
    if i = j - 1 then
    begin
      if Result = '10' then
      begin
        c := (nbo - nb) div Translate[i].fact;
        Result := Translate[c].letter;
      end;
    end;
  end;
end;

function FactString2Dec(str: string): int64;
var
  i, l, c: integer;
begin
  l := length(str);
  Result := 0;
  for i := l - 1 downto 0 do
  begin
    c := Ord(str[l - i]) - Ord('0');
    if c > 9 then
      c := c - 7;
    Result := Result + c * Translate[i].fact;
  end;
end;

end.
