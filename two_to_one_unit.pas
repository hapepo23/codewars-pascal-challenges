{
7 kyu
Two to One
https://www.codewars.com/kata/5656b6906de340bd1b0000ac
}

unit two_to_one_unit;

{$mode objfpc}{$H+}

interface

function Longest(s1, s2: string): string;

implementation

type
  TCharRange = 'a'..'z';

function Longest(s1, s2: string): string;
var
  cnt: array[TCharRange] of integer;
  c: TCharRange;
begin
  for c in TCharRange do
    cnt[c] := 0;
  for c in s1 do
    Inc(cnt[c]);
  for c in s2 do
    Inc(cnt[c]);
  Result := '';
  for c in TCharRange do
    if cnt[c] > 0 then
      Result += c;
end;

end.
