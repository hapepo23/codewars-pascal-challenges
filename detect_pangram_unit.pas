{
6 kyu
Detect Pangram
https://www.codewars.com/kata/545cedaa9943f7fe7b000048
}

unit detect_pangram_unit;

{$mode objfpc}{$H+}

interface

function IsPangram(s: string): boolean;

implementation

type
  TCharRange = 'a'..'z';

function IsPangram(s: string): boolean;
const
  diff = Ord('a') - Ord('A');
var
  exists: array[TCharRange] of boolean;
  c: char;
begin
  for c in TCharRange do
    exists[c] := False;
  for c in s do
    case c of
      'a'..'z':
        exists[c] := True;
      'A'..'Z':
        exists[Chr(Ord(c) + diff)] := True;
    end;
  for c in TCharRange do
    if not exists[c] then
      Exit(False);
  Result := True;
end;

end.
