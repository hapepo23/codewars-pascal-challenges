{
7 kyu
Vowel Count
https://www.codewars.com/kata/54ff3102c1bad923760001f3
}

unit vowel_count_unit;

{$mode objfpc}{$H+}

interface

function GetCount(s: string): integer;

implementation

function GetCount(s: string): integer;
var
  c: char;
begin
  Result := 0;
  for c in s do
    case c of
      'a', 'e', 'i', 'o', 'u':
        Inc(Result);
    end;
end;

end.
